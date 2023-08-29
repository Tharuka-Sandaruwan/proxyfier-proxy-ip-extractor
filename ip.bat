@echo off
setlocal enabledelayedexpansion

for /f "tokens=*" %%a in ('ipconfig /allcompartments /all ^| findstr /c:"DHCP Server"') do (
    set line=%%a
    set line=!line:*DHCP Server =!
    set dhcp_ip=!line: =!
    set dhcp_ip=!dhcp_ip:...........:=!
)

if "!dhcp_ip:~0,3!"=="192" (
    echo !dhcp_ip!| clip
    echo Cleaned DHCP Server IP address: !dhcp_ip! has been copied to clipboard.
) else (
    echo No suitable DHCP Server IP address found.
)

