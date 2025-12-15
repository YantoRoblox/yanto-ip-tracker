#!/bin/bash

# ================= COLORS =================
M="\e[1;31m"
H="\e[1;32m"
K="\e[1;33m"
B="\e[1;34m"
C="\e[1;36m"
P="\e[1;37m"
R="\e[0m"

# ================= DEP CHECK =================
if ! command -v jq &> /dev/null; then
    echo -e "${M}[!] Error:${P} Paket 'jq' belum terinstall.${R}"
    echo -e "${K}    Install dengan:${P} pkg install jq${R}"
    exit 1
fi

# ================= BANNER =================
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

# ================= PARSE MAPS =================
parse_maps() {
    input="$1"
    coords=$(echo "$input" | grep -oE '[-]?[0-9]+\.[0-9]+\+[-]?[0-9]+\.[0-9]+')
    if [[ -n "$coords" ]]; then
        lat=$(echo "$coords" | cut -d'+' -f1)
        lon=$(echo "$coords" | cut -d'+' -f2)
        return 0
    else
        return 1
    fi
}

# ================= SHOW MAP =================
tampil_maps() {
    banner
    echo -e "${H}[✓] KOORDINAT TERDETEKSI${R}\n"
    echo -e "  ${K}Latitude   :${P} $lat"
    echo -e "  ${K}Longitude  :${P} $lon"
    echo -e "  ${P}---------------------------------${R}"
    echo -e "  ${C}Google Maps:${P}"
    echo -e "  https://maps.google.com/?q=$lat,$lon"
    echo -e "  ${P}=================================${R}\n"
    read -p "Tekan Enter untuk kembali..."
    menu
}

# ================= IP TRACK =================
lacak_ip() {
    target="$1"
    banner

    if [[ -z "$target" ]]; then
        echo -e "${B}[*] Mengambil data IP sendiri...${R}"
        url="http://ip-api.com/json/"
    else
        echo -e "${B}[*] Scan IP: $target ...${R}"
        url="http://ip-api.com/json/$target"
    fi

    response=$(curl -s --max-time 10 "$url")
    status=$(echo "$response" | jq -r '.status')

    if [[ "$status" == "fail" ]]; then
        echo -e "\n${M}[!] IP tidak valid atau diblokir${R}"
        read -p "Tekan Enter..."
        menu
        return
    fi

    ip=$(echo "$response" | jq -r '.query')
    kota=$(echo "$response" | jq -r '.city')
    prov=$(echo "$response" | jq -r '.regionName')
    negara=$(echo "$response" | jq -r '.country')
    isp=$(echo "$response" | jq -r '.isp')
    lat=$(echo "$response" | jq -r '.lat')
    lon=$(echo "$response" | jq -r '.lon')
    zona=$(echo "$response" | jq -r '.timezone')
    as=$(echo "$response" | jq -r '.as')

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
    echo -e "  ${C}Google Maps:${P}"
    echo -e "  https://maps.google.com/?q=$lat,$lon"
    echo -e "  ${P}=================================${R}\n"

    read -p "Tekan Enter untuk kembali..."
    menu
}

# ================= INPUT =================
masukan_target() {
    echo ""
    echo -e "${C}Masukkan IP / Link Google Maps / Koordinat:${R}"
    read -p ">> " target

    [[ -z "$target" ]] && menu

    if echo "$target" | grep -q "google.com/maps"; then
        parse_maps "$target" && tampil_maps || menu
    elif echo "$target" | grep -q ","; then
        lat=$(echo "$target" | cut -d',' -f1)
        lon=$(echo "$target" | cut -d',' -f2)
        tampil_maps
    else
        lacak_ip "$target"
    fi
}

# ================= MENU =================
menu() {
    banner
    echo -e "${K}[01]${P} Cek IP Saya"
    echo -e "${K}[02]${P} Cek IP / Maps Target"
    echo -e "${K}[00]${P} Exit\n"
    read -p "root@yanto:~# " pilih

    case $pilih in
        1|01) lacak_ip "" ;;
        2|02) masukan_target ;;
        0|00) echo -e "${H}Bye!${R}"; exit ;;
        *) echo -e "${M}Command not found!${R}"; sleep 1; menu ;;
    esac
}

menu
