# Yanto IP Tracker

Tool berbasis **Bash (Termux)** untuk menampilkan informasi **IP publik** dan membaca **koordinat / link Google Maps**.  
Dibuat untuk tujuan **edukasi dan pembelajaran networking dasar**.

> ⚠️ Lokasi IP bersifat **perkiraan** (berdasarkan ISP), **bukan GPS real-time**.

---

## ✨ Fitur
- Cek IP publik sendiri
- Cek IP target
- Baca koordinat latitude & longitude
- Parsing link Google Maps
- Tampilan terminal sederhana & interaktif
- Ringan, tanpa database

---

## 📱 Persyaratan
- Termux (Android)
- Koneksi internet

---

## 🔧 Instalasi

Update package dan install dependency:

```bash
pkg update && pkg upgrade
pkg install curl jq
curl -LO https://raw.githubusercontent.com/YantoRoblox/yanto-ip-tracker/refs/heads/main/yanto-ip.sh
chmod +x yanto-ip.sh
./yanto-ip.sh
```

🧭 Menu & Cara Pakai
[01] Cek IP Saya

Menampilkan informasi IP publik perangkat yang digunakan saat ini.

Catatan:

Lokasi hanya perkiraan

Bisa menunjuk kota / pusat ISP

[02] Cek IP / Maps Target

Mendukung beberapa jenis input:
```IP Address
8.8.4.4
```

```Koordinat Latitude,Longitude
-6.21462,106.84513
```

```Link Google Maps
https://www.google.com/maps/place/-7.250445+112.768845
```

Contoh Output
IP Address  : 8.8.4.4
Provider    : Google LLC
Kota        : Jakarta
Negara      : Indonesia
Google Maps :
https://maps.google.com/?q=-6.21462,106.84513




