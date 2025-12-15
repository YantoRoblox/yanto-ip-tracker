#!/bin/bash

banner() {
clear
printf "\e[0m\n"
printf "\e[1;36m   __  __   ___   _   _   _____   ___   \e[0m\e[1;33mIP TRACER\e[0m\n"
printf "\e[1;36m  |  \/  | / _ \ | \ | | |_   _| |  _ \ \e[0m\n"
printf "\e[1;36m  | \  / || | | ||  \| |   | |   | |_) |\e[0m\n"
printf "\e[1;36m  | |\/| || | | || . \ |   | |   |  __/ \e[0m\n"
printf "\e[1;36m  | |  | || |_| || |\  |  _| |_  | |    \e[0m\n"
printf "\e[1;36m  |_|  |_| \___/ |_| \_| |_____| |_|    \e[0m\n"
printf "\e[0m\n"
printf "\e[1;33m               YANTO IP TRACKER\e[0m\n"
printf "\e[0m\n"
printf "\e[1;37m          Created & Modified by\e[0m \e[1;32mYantoSepinggan\e[0m\n"
printf "\e[1;37m                Balikpapan - Indonesia\e[0m\n"
printf "\e[0m\n"
}

menu() {
printf "\e[0m\n"
printf "\e[1;31m  [\e[1;37m01\e[1;31m]\e[1;33m My IP Location\e[0m\n"
printf "\e[1;31m  [\e[1;37m02\e[1;31m]\e[1;33m Track Target IP\e[0m\n"
printf "\e[1;31m  [\e[1;37m00\e[1;31m]\e[1;33m Exit\e[0m\n"
printf "\e[0m\n"
read -p $'  \e[1;31m[\e[1;37m~\e[1;31m]\e[1;92m Pilih Menu \e[1;96m: \e[1;93m' option

case $option in
  1|01) myipaddr ;;
  2|02) useripaddr ;;
  0|00) printf "\n  \e[1;32mSampai jumpa, YantoSepinggan!\e[0m\n\n"; exit 0 ;;
  *) printf "  \e[1;91m[!] Pilihan salah bro!\e[0m\n"; sleep 1; banner; menu ;;
esac
}

myipaddr() {
banner
printf "\e[1;34m  Sedang mengambil data IP kamu...\e[0m\n\n"

myipaddripapico=$(curl -s "https://ipapi.co/json/" -L)
myipaddripapicom=$(curl -s "http://ip-api.com/json/" -L)

myip=$(echo $myipaddripapico | grep -Po '(?<="ip":")[^"]*')
mycity=$(echo $myipaddripapico | grep -Po '(?<="city":")[^"]*')
myregion=$(echo $myipaddripapico | grep -Po '(?<="region":")[^"]*')
mycountry=$(echo $myipaddripapico | grep -Po '(?<="country_name":")[^"]*')
mylat=$(echo $myipaddripapicom | grep -Po '(?<="lat":)[^,}]*')
mylon=$(echo $myipaddripapicom | grep -Po '(?<="lon":)[^,}]*')
mytime=$(echo $myipaddripapicom | grep -Po '(?<="timezone":")[^"]*')
mypostal=$(echo $myipaddripapicom | grep -Po '(?<="zip":")[^"]*')
myisp=$(echo $myipaddripapico | grep -Po '(?<="org":")[^"]*')
myasn=$(echo $myipaddripapico | grep -Po '(?<="asn":")[^"]*')

printf "  \e[1;93mIP Address    \e[1;96m:\e[1;92m $myip\e[0m\n"
printf "  \e[1;93mKota          \e[1;96m:\e[1;92m $mycity\e[0m\n"
printf "  \e[1;93mProvinsi      \e[1;96m:\e[1;92m $myregion\e[0m\n"
printf "  \e[1;93mNegara        \e[1;96m:\e[1;92m $mycountry\e[0m\n"
printf "\e[0m\n"
printf "  \e[1;93mLatitude      \e[1;96m:\e[1;92m $mylat\e[0m\n"
printf "  \e[1;93mLongitude     \e[1;96m:\e[1;92m $mylon\e[0m\n"
printf "  \e[1;93mTime Zone     \e[1;96m:\e[1;92m $mytime\e[0m\n"
printf "  \e[1;93mKode Pos      \e[1;96m:\e[1;92m $mypostal\e[0m\n"
printf "\e[0m\n"
printf "  \e[1;93mISP           \e[1;96m:\e[1;92m $myisp\e[0m\n"
printf "  \e[1;93mASN           \e[1;96m:\e[1;92m $myasn\e[0m\n"
printf "\e[0m\n"
printf "  \e[1;93mGoogle Maps   \e[1;96m:\e[1;94m https://maps.google.com/?q=$mylat,$mylon\e[0m\n"
printf "\e[0m\n"
read -p $'  \e[1;31m[Enter]\e[1;96m Kembali ke menu...\e[0m' ; banner; menu
}

useripaddr() {
banner
printf "\e[0m\n"
read -p $'  \e[1;31m[\e[1;37m~\e[1;31m]\e[1;92m Masukkan IP Target \e[1;96m: \e[1;93m' useripaddress

if [[ -z "$useripaddress" ]]; then
    printf "  \e[1;91m[!] IP tidak boleh kosong!\e[0m\n"; sleep 2; useripaddr
fi

printf "\e[1;34m  Sedang melacak $useripaddress...\e[0m\n\n"

ipaddripapico=$(curl -s "https://ipapi.co/$useripaddress/json/" -L)
ipaddripapicom=$(curl -s "http://ip-api.com/json/$useripaddress" -L)

userip=$(echo $ipaddripapico | grep -Po '(?<="ip":")[^"]*')
usercity=$(echo $ipaddripapico | grep -Po '(?<="city":")[^"]*')
useregion=$(echo $ipaddripapico | grep -Po '(?<="region":")[^"]*')
usercountry=$(echo $ipaddripapico | grep -Po '(?<="country_name":")[^"]*')
userlat=$(echo $ipaddripapicom | grep -Po '(?<="lat":)[^,}]*')
userlon=$(echo $ipaddripapicom | grep -Po '(?<="lon":)[^,}]*')
usertime=$(echo $ipaddripapicom | grep -Po '(?<="timezone":")[^"]*')
userpostal=$(echo $ipaddripapicom | grep -Po '(?<="zip":")[^"]*')
userisp=$(echo $ipaddripapico | grep -Po '(?<="org":")[^"]*')
userasn=$(echo $ipaddripapico | grep -Po '(?<="asn":")[^"]*')

if [[ $userip == "" ]]; then
    printf "  \e[1;91m[!] IP tidak valid atau tidak ditemukan!\e[0m\n"
    sleep 2; banner; menu
fi

printf "  \e[1;93mIP Address    \e[1;96m:\e[1;92m $userip\e[0m\n"
printf "  \e[1;93mKota          \e[1;96m:\e[1;92m $usercity\e[0m\n"
printf "  \e[1;93mProvinsi      \e[1;96m:\e[1;92m $useregion\e[0m\n"
printf "  \e[1;93mNegara        \e[1;96m:\e[1;92m $usercountry\e[0m\n"
printf "\e[0m\n"
printf "  \e[1;93mLatitude      \e[1;96m:\e[1;92m $userlat\e[0m\n"
printf "  \e[1;93mLongitude     \e[1;96m:\e[1;92m $userlon\e[0m\n"
printf "  \e[1;93mTime Zone     \e[1;96m:\e[1;92m $usertime\e[0m\n"
printf "  \e[1;93mKode Pos      \e[1;96m:\e[1;92m $userpostal\e[0m\n"
printf "\e[0m\n"
printf "  \e[1;93mISP           \e[1;96m:\e[1;92m $userisp\e[0m\n"
printf "  \e[1;93mASN           \e[1;96m:\e[1;92m $userasn\e[0m\n"
printf "\e[0m\n"
printf "  \e[1;93mGoogle Maps   \e[1;96m:\e[1;94m https://maps.google.com/?q=$userlat,$userlon\e[0m\n"
printf "\e[0m\n"
read -p $'  \e[1;31m[Enter]\e[1;96m Kembali ke menu...\e[0m' ; banner; menu
}

banner
menu
