#!/bin/bash

# --- WARNA (Supaya Tampilannya Keren) ---
M="\e[1;31m" # Merah
H="\e[1;32m" # Hijau
K="\e[1;33m" # Kuning
B="\e[1;34m" # Biru
C="\e[1;36m" # Cyan
P="\e[1;37m" # Putih
R="\e[0m"    # Reset

# --- CEK ALAT ---
if ! command -v jq &> /dev/null; then
    echo -e "${M}[!] Error:${P} Paket 'jq' belum install."
    echo -e "${K}    Ketik: pkg install jq${R}"
    exit 1
fi

# --- BANNER KEREN ---
banner() {
clear
printf "${C}"
cat << "EOF"
  __  __             _       
 |  \/  | ___  _ __ (_)_ __  
 | |\/| |/ _ \| '_ \| | '_ \ 
 | |  | | (_) | | | | | |_) |
 |_|  |_|\___/|_| |_|_| .__/ 
                      |_|    
EOF
printf "${P}    [ IP TRACKER PREMIUM V2 ]\n"
printf "${H}    Created by YantoSepinggan${R}\n\n"
}

# --- MENU UTAMA ---
menu() {
    printf "${K}[01]${P} Cek IP Saya (My Location)\n"
    printf "${K}[02]${P} Lacak Target (Track IP)\n"
    printf "${K}[00]${P} Keluar (Exit)\n"
    echo ""
    read -p "root@yanto-termux:~# " pilih

    if [[ $pilih == 1 || $pilih == 01 ]]; then
        lacak_ip ""
    elif [[ $pilih == 2 || $pilih == 02 ]]; then
        masukan_target
    elif [[ $pilih == 0 || $pilih == 00 ]]; then
        echo -e "\n${H}Terima kasih telah menggunakan tools ini!${R}"
        exit 0
    else
        echo -e "${M}Pilihan tidak ada!${R}"
        sleep 1
        banner
        menu
    fi
}

# --- INPUT IP TARGET ---
masukan_target() {
    echo ""
    echo -e "${C}Masukkan Alamat IP Target:${R}"
    read -p ">> " target
    if [[ -z "$target" ]]; then
        banner
        menu
    else
        lacak_ip "$target"
    fi
}

# --- PROSES PELACAKAN ---
lacak_ip() {
    target=$1
    banner
    
    if [[ -z "$target" ]]; then
        echo -e "${B}[*] Sedang mengambil data IP Kamu...${R}"
        url="http://ip-api.com/json/"
    else
        echo -e "${B}[*] Sedang melacak IP: $target ...${R}"
        url="http://ip-api.com/json/$target"
    fi

    # Ambil Data
    response=$(curl -s --max-time 10 "$url")
    status=$(echo $response | jq -r '.status')

    if [[ "$status" == "fail" ]]; then
        echo ""
        echo -e "${M}[!] GAGAL! IP Tidak Valid / Server Down.${R}"
        echo -e "${K}Pesan: $(echo $response | jq -r '.message')${R}"
        echo ""
        read -p "Tekan Enter untuk kembali..."
        banner
        menu
    else
        # Parsing Data
        ip=$(echo $response | jq -r '.query')
        kota=$(echo $response | jq -r '.city')
        prov=$(echo $response | jq -r '.regionName')
        negara=$(echo $response | jq -r '.country')
        isp=$(echo $response | jq -r '.isp')
        lat=$(echo $response | jq -r '.lat')
        lon=$(echo $response | jq -r '.lon')
        zona=$(echo $response | jq -r '.timezone')
        as=$(echo $response | jq -r '.as')

        # TAMPILAN HASIL RAPI
        echo ""
        echo -e "  ${P}=================================${R}"
        echo -e "  ${H}       HASIL PELACAKAN           ${R}"
        echo -e "  ${P}=================================${R}"
        echo -e "  ${K}IP Address  :${P} $ip"
        echo -e "  ${K}Provider    :${P} $isp"
        echo -e "  ${K}Kota        :${P} $kota"
        echo -e "  ${K}Provinsi    :${P} $prov"
        echo -e "  ${K}Negara      :${P} $negara"
        echo -e "  ${K}Zona Waktu  :${P} $zona"
        echo -e "  ${K}ASN         :${P} $as"
        echo -e "  ${P}---------------------------------${R}"
        echo -e "  ${C}Google Maps :${P}"
        echo -e "  https://maps.google.com/?q=$lat,$lon"
        echo -e "  ${P}=================================${R}"
        echo ""
        
        read -p "Tekan Enter untuk kembali ke menu..."
        banner
        menu
    fi
}

# Jalankan
banner
menu
