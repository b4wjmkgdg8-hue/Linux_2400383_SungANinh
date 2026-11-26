#!/bin/bash

# Duong dan thu muc bai tap
THUMUC="$HOME/2400383_ninh_Linux"
LOG="$THUMUC/logs/hethong.log"

# Ghi ket qua vao file log
{
    echo "=================================="
    echo "       THONG TIN HE THONG"
    echo "=================================="

    echo "Ten nguoi dung: $(whoami)"
    echo "Ten may tinh: $(hostname)"
    echo "Ngay gio hien tai: $(date)"
    echo "Phien ban Linux Kernel: $(uname -r)"

    echo ""
    echo "========== DUNG LUONG RAM =========="
    free -h

    echo ""
    echo "========== DUNG LUONG O DIA =========="
    df -h

    echo ""
    echo "========== KIEM TRA MANG =========="

    if ping -c 2 -W 3 google.com.vn > /dev/null 2>&1
    then
        echo "Co ket noi mang"
    else
        echo "Khong xac nhan duoc ket noi mang"
    fi

    echo ""
    echo "Thoi gian ket thuc: $(date)"
    echo "=================================="

} | tee "$LOG"

