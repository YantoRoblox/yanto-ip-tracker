#!/bin/bash

M="\e[1;31m"
H="\e[1;32m"
K="\e[1;33m"
B="\e[1;34m"
C="\e[1;36m"
P="\e[1;37m"
R="\e[0m"

if ! command -v jq &> /dev/null; then
    echo -e "${M}[!] Error:${P} Paket 'jq' belum install."
    echo -e "${K}    Ketik: pkg install jq${R}"
    exit 1
fi

banner() {
clear
printf "${H}"
cat << "EOF"
       _______________________
      |  ___________________  |
      | |   SYSTEM: ONLINE  | |
      | |   > IP TRACKING   | |
      | |   > CONNECTING... | |
      | |___________________| |
      |_______________________|
       \_____________________/
        \ _________________ /
         \_________________/
EOF
printf "${P}    [ YANTO CYBER TRACKER ]\n"
printf "${C}    Created by YantoSepinggan${R}\n\n"
}

menu() {
    printf "${K}[01]${P} Cek IP Saya (My Location)\n"
    printf "${K}[02]${P} Lacak Target (Track IP)\n"
    printf "${K}[00]${P} Keluar (Exit)\n"
    echo ""
    read -p "root@yanto-hacker:~# " pilih

    if [[ $pilih == 1 || $pilih == 01 ]]; then
        lacak_ip ""
    elif [[ $pilih == 2 || $pilih == 02 ]]; then
        masukan_target
    elif [[ $pilih == 0 || $pilih == 00 ]]; then
        echo -e "\n${H}System Shutdown... Bye!${R}"
        exit 0
    else
        echo -e "${M}Command not found!${R}"
        sleep 1
        banner
        menu
    fi
}

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

lacak_ip() {
    target=$1
    banner
    
    if [[ -z "$target" ]]; then
        echo -e "${B}[*] Sedang scan data IP sendiri...${R}"
        url="http://ip-api.com/json/"
    else
        echo -e "${B}[*] Hacking location IP: $target ...${R}"
        url="http://ip-api.com/json/$target"
    fi

    response=$(curl -s --max-time 10 "$url")
    status=$(echo $response | jq -r '.status')

    if [[ "$status" == "fail" ]]; then
        echo ""
        echo -e "${M}[!] AKSES DITOLAK! IP Tidak Valid.${R}"
        echo -e "${K}Server msg: $(echo $response | jq -r '.message')${R}"
        echo ""
        read -p "Tekan Enter untuk kembali..."
        banner
        menu
    else
        ip=$(echo $response | jq -r '.query')
        kota=$(echo $response | jq -r '.city')
        prov=$(echo $response | jq -r '.regionName')
        negara=$(echo $response | jq -r '.country')
        isp=$(echo $response | jq -r '.isp')
        lat=$(echo $response | jq -r '.lat')
        lon=$(echo $response | jq -r '.lon')
        zona=$(echo $response | jq -r '.timezone')
        as=$(echo $response | jq -r '.as')

        echo ""
        echo -e "  ${P}=================================${R}"
        echo -e "  ${H}       DATA FOUND [SUCCESS]      ${R}"
        echo -e "  ${P}=================================${R}"
        echo -e "  ${K}IP Address  :${P} $ip"
        echo -e "  ${K}Provider    :${P} $isp"
        echo -e "  ${K}Kota        :${P} $kota"
        echo -e "  ${K}Provinsi    :${P} $prov"
        echo -e "  ${K}Negara      :${P} $negara"
        echo -e "  ${K}Zona Waktu  :${P} $zona"
        echo -e "  ${P}---------------------------------${R}"
        echo -e "  ${C}Lokasi Map  :${P}"
        echo -e "  https://maps.google.com/?q=$lat,$lon"
        echo -e "  ${P}=================================${R}"
        echo ""
        
        read -p "Tekan Enter untuk kembali..."
        banner
        menu
    fi
}

banner
menu
