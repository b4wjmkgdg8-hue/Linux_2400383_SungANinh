#!/bin/bash

THUMUC="$HOME/2400383_ninh_Linux"
DATA="$THUMUC/data"
BACKUP="$THUMUC/backup"
LOG="$THUMUC/logs/backup.log"

# Tao thu muc backup va logs neu chua co
mkdir -p "$BACKUP"
mkdir -p "$THUMUC/logs"

# Lay thoi gian hien tai
THOIGIAN=$(date '+%Y%m%d_%H%M%S')
TENFILE="backup_$THOIGIAN.tar.gz"

echo "===== CHUONG TRINH SAO LUU DU LIEU ====="

# Kiem tra thu muc data
if [ -d "$DATA" ]; then

    # Nen thu muc data
    tar -czf "$BACKUP/$TENFILE" -C "$THUMUC" data

    # Kiem tra ket qua sao luu
    if [ -s "$BACKUP/$TENFILE" ] && tar -tzf "$BACKUP/$TENFILE" >/dev/null 2>&1; then

        TRANGTHAI="THANH CONG"
        echo "Sao luu thanh cong!"
        echo "File: $TENFILE"
    else
        TRANGTHAI="THAT BAI"
        echo "Sao luu that bai!"
    fi

else
    TRANGTHAI="THAT BAI - KHONG TIM THAY THU MUC DATA"
    echo "Khong tim thay thu muc data!"
fi

# Ghi nhat ky
echo "$(date '+%d/%m/%Y %H:%M:%S') | $TENFILE | $TRANGTHAI" >> "$LOG"

# Hien thi danh sach file sao luu
echo ""
echo "===== DANH SACH CAC FILE SAO LUU ====="
ls -lh "$BACKUP"

echo "======================================"


