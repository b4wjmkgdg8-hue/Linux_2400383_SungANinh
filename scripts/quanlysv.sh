#!/bin/bash

# Duong dan thu muc
THUMUC="$HOME/2400383_ninh_Linux"
DATA="$THUMUC/data/sinhvien.txt"

# Kiem tra file du lieu
if [ ! -f "$DATA" ]; then
    echo "Khong tim thay file du lieu sinh vien!"
    exit 1
fi

# Vong lap menu
while true
do
    echo ""
    echo "===== CHUONG TRINH QUAN LY SINH VIEN ====="
    echo "1. Hien thi danh sach sinh vien"
    echo "2. Tim kiem sinh vien theo ma"
    echo "3. Thong ke sinh vien dat va khong dat"
    echo "4. Tinh diem trung binh"
    echo "5. Hien thi sinh vien co diem cao nhat"
    echo "6. Sap xep sinh vien theo diem giam dan"
    echo "0. Thoat chuong trinh"
    echo "=========================================="
    read -p "Nhap lua chon: " chon

    case $chon in

        1)
            echo "===== DANH SACH SINH VIEN ====="
            cat "$DATA"
            ;;

        2)
            read -p "Nhap ma sinh vien can tim: " ma
            ketqua=$(grep "^$ma," "$DATA")

            if [ -n "$ketqua" ]; then
                echo "Tim thay sinh vien:"
                echo "$ketqua"
            else
                echo "Khong tim thay sinh vien!"
            fi
            ;;

        3)
            echo "===== THONG KE SINH VIEN ====="
            awk -F',' '
            $3 >= 5 {dat++}
            $3 < 5 {khongdat++}
            END {
                print "So sinh vien dat: " dat+0
                print "So sinh vien khong dat: " khongdat+0
            }' "$DATA"
            ;;

        4)
            echo "===== DIEM TRUNG BINH ====="
            awk -F',' '
            {tong += $3; dem++}
            END {
                if (dem > 0)
                    printf "Diem trung binh: %.2f\n", tong/dem
            }' "$DATA"
            ;;

5)
            echo "===== SINH VIEN CO DIEM CAO NHAT ====="
            awk -F',' '
            NR == 1 || $3 > max {
                max = $3
                ds = $0
            }
            END {
                print ds
                print "Diem cao nhat: " max
            }' "$DATA"
            ;;

        6)
            echo "===== SAP XEP DIEM GIAM DAN ====="
            sort -t',' -k3,3nr "$DATA"
            ;;

        0)
            echo "Cam on ban da su dung chuong trinh!"
            break
            ;;

        *)
            echo "Lua chon khong hop le! Vui long nhap lai."
            ;;

    esac
done
