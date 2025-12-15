# Yanto IP Tracker

Tool berbasis Bash untuk melihat informasi IP publik dan membaca koordinat Google Maps.
Dibuat untuk tujuan edukasi dan pembelajaran networking dasar.

Author: YantoSepinggan
GitHub: https://github.com/YantoRoblox

--------------------------------------------------

CARA MENGGUNAKAN (TERMUX)

1. Update Termux dan install dependency

pkg update && pkg upgrade
pkg install curl jq

2. Download script dari GitHub

curl -LO https://raw.githubusercontent.com/YantoRoblox/yanto-ip-tracker/refs/heads/main/yanto-ip.sh

3. Beri izin eksekusi

chmod +x yanto-ip.sh

4. Jalankan script

./yanto-ip.sh

Jika berhasil, akan muncul tampilan:
[ YANTO CYBER TRACKER ]
Created by YantoSepinggan

--------------------------------------------------

MENU & FUNGSI

[01] Cek IP Saya
Menampilkan informasi IP publik perangkat yang digunakan.
Lokasi yang ditampilkan adalah perkiraan berdasarkan ISP

[02] Cek IP / Maps Target
Mendukung 3 jenis input:

- IP Address
  Contoh: 8.8.8.8

- Koordinat Latitude,Longitude
  Contoh: kordinat ip 

- Link Google Maps
  Contoh:
  https://www.google.com/maps/place/

Script akan otomatis mendeteksi jenis input dan menampilkan hasilnya.

[00] Exit
Keluar dari program.
--------------------------------------------------

Yanto IP Tracker
Created by YantoSepinggan
