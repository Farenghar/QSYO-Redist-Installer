@echo off
chcp 65001 >nul
color 0B
title Redistributables Installer / Instalador de Redistribuibles

:: ================================================================
:: VERIFICAR PERMISOS DE ADMINISTRADOR
:: ================================================================
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrator privileges / Solicitando permisos de administrador...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: ================================================================
:: PANTALLA DE BIENVENIDA ANIMADA (SPLASH SCREEN)
:: ================================================================
cls
echo.
echo.
echo     QQQQQQQQQ        SSSSSSSSSSSSSSS YYYYYYY       YYYYYYY     OOOOOOOOO     
powershell -Command "Start-Sleep -Milliseconds 40"
echo   QQ:::::::::QQ    SS:::::::::::::::SY:::::Y       Y:::::Y   OO:::::::::OO   
powershell -Command "Start-Sleep -Milliseconds 40"
echo QQ:::::::::::::QQ S:::::SSSSSS::::::SY:::::Y       Y:::::Y OO:::::::::::::OO 
powershell -Command "Start-Sleep -Milliseconds 40"
echo Q:::::::QQQ:::::::QS:::::S     SSSSSSSY::::::Y     Y::::::YO:::::::OOO:::::::O
powershell -Command "Start-Sleep -Milliseconds 40"
echo Q::::::O   Q::::::QS:::::S            YYY:::::Y   Y:::::YYYO::::::O   O::::::O
powershell -Command "Start-Sleep -Milliseconds 40"
echo Q:::::O     Q:::::QS:::::S               Y:::::Y Y:::::Y   O:::::O     O:::::O
powershell -Command "Start-Sleep -Milliseconds 40"
echo Q:::::O     Q:::::Q S::::SSSS             Y:::::Y:::::Y    O:::::O     O:::::O
powershell -Command "Start-Sleep -Milliseconds 40"
echo Q:::::O     Q:::::Q  SS::::::SSSSS         Y:::::::::Y     O:::::O     O:::::O
powershell -Command "Start-Sleep -Milliseconds 40"
echo Q:::::O     Q:::::Q    SSS::::::::SS        Y:::::::Y      O:::::O     O:::::O
powershell -Command "Start-Sleep -Milliseconds 40"
echo Q:::::O     Q:::::Q       SSSSSS::::S        Y:::::Y       O:::::O     O:::::O
powershell -Command "Start-Sleep -Milliseconds 40"
echo Q:::::O  QQQQ:::::Q            S:::::S       Y:::::Y       O:::::O     O:::::O
powershell -Command "Start-Sleep -Milliseconds 40"
echo Q::::::O Q::::::::Q            S:::::S       Y:::::Y       O::::::O   O::::::O
powershell -Command "Start-Sleep -Milliseconds 40"
echo Q:::::::QQ::::::::QSSSSSSS     S:::::S       Y:::::Y       O:::::::OOO:::::::O
powershell -Command "Start-Sleep -Milliseconds 40"
echo QQ::::::::::::::Q S::::::SSSSSS:::::S    YYYY:::::YYYY     OO:::::::::::::OO 
powershell -Command "Start-Sleep -Milliseconds 40"
echo   QQ:::::::::::Q  S:::::::::::::::SS     Y:::::::::::Y       OO:::::::::OO   
powershell -Command "Start-Sleep -Milliseconds 40"
echo     QQQQQQQQ::::QQ SSSSSSSSSSSSSSS       YYYYYYYYYYYYY         OOOOOOOOO     
powershell -Command "Start-Sleep -Milliseconds 40"
echo             Q:::::Q                                                          
powershell -Command "Start-Sleep -Milliseconds 40"
echo              QQQQQQ                                                          
echo.
timeout /t 1 /nobreak >nul

:: ================================================================
:: SELECTOR DE IDIOMA
:: ================================================================
:SELECCIONAR_IDIOMA
cls
echo.
echo ================================================================
echo             SELECT LANGUAGE / SELECCIONAR IDIOMA
echo ================================================================
echo.
echo   [1] English
echo   [2] Espanol
echo.
echo ================================================================
choice /c 12 /n /m "Choose an option / Elige una opcion [1-2]: "

if errorlevel 2 (
    call :LANG_ES
    goto MENU
)
if errorlevel 1 (
    call :LANG_EN
    goto MENU
)

:: ================================================================
:: MENU PRINCIPAL
:: ================================================================
:MENU
cls
echo ================================================================
echo         %TXT_HEADER%
echo ================================================================
echo.
echo   %TXT_OPT1%
echo   %TXT_OPT2%
echo   %TXT_OPT3%
echo   %TXT_OPT4%
echo   %TXT_OPT5%
echo   %TXT_OPT6%
echo   %TXT_OPT7%
echo   %TXT_OPT8%
echo   %TXT_OPT0%
echo.
echo ================================================================
set /p opcion="%TXT_PROMPT%"

if "%opcion%"=="1" goto TODO
if "%opcion%"=="2" goto VCREDIST
if "%opcion%"=="3" goto DIRECTX
if "%opcion%"=="4" goto DOTNET
if "%opcion%"=="5" goto XNA
if "%opcion%"=="6" goto OPENAL
if "%opcion%"=="7" goto JAVA
if "%opcion%"=="8" goto CAMBIAR_IDIOMA
if "%opcion%"=="0" exit
goto MENU

:CAMBIAR_IDIOMA
if "%CUR_LANG%"=="ES" (
    call :LANG_EN
) else (
    call :LANG_ES
)
goto MENU

:TODO
cls
echo %TXT_INSTALL_ALL%
call :INSTALAR_VCREDIST
call :INSTALAR_DIRECTX
call :INSTALAR_DOTNET
call :INSTALAR_XNA
call :INSTALAR_OPENAL
call :INSTALAR_JAVA
goto FIN

:VCREDIST
cls
call :INSTALAR_VCREDIST
goto FIN

:DIRECTX
cls
call :INSTALAR_DIRECTX
goto FIN

:DOTNET
cls
call :INSTALAR_DOTNET
goto FIN

:XNA
cls
call :INSTALAR_XNA
goto FIN

:OPENAL
cls
call :INSTALAR_OPENAL
goto FIN

:JAVA
cls
call :INSTALAR_JAVA
goto FIN

:: --- SUBRUTINAS DE INSTALACION ---

:INSTALAR_VCREDIST
echo.
echo [+] %TXT_INST_VC%
winget install --id Microsoft.VCRedist.2005.x86 --silent --accept-package-agreements --accept-source-agreements
winget install --id Microsoft.VCRedist.2005.x64 --silent --accept-package-agreements --accept-source-agreements
winget install --id Microsoft.VCRedist.2008.x86 --silent --accept-package-agreements --accept-source-agreements
winget install --id Microsoft.VCRedist.2008.x64 --silent --accept-package-agreements --accept-source-agreements
winget install --id Microsoft.VCRedist.2010.x86 --silent --accept-package-agreements --accept-source-agreements
winget install --id Microsoft.VCRedist.2010.x64 --silent --accept-package-agreements --accept-source-agreements
winget install --id Microsoft.VCRedist.2012.x86 --silent --accept-package-agreements --accept-source-agreements
winget install --id Microsoft.VCRedist.2012.x64 --silent --accept-package-agreements --accept-source-agreements
winget install --id Microsoft.VCRedist.2013.x86 --silent --accept-package-agreements --accept-source-agreements
winget install --id Microsoft.VCRedist.2013.x64 --silent --accept-package-agreements --accept-source-agreements
winget install --id Microsoft.VCRedist.2015+.x86 --silent --accept-package-agreements --accept-source-agreements
winget install --id Microsoft.VCRedist.2015+.x64 --silent --accept-package-agreements --accept-source-agreements
exit /b

:INSTALAR_DIRECTX
echo.
echo [+] %TXT_INST_DX%
winget install --id Microsoft.DirectX --silent --accept-package-agreements --accept-source-agreements
exit /b

:INSTALAR_DOTNET
echo.
echo [+] %TXT_INST_NET%
winget install --id Microsoft.DotNet.DesktopRuntime.6 --silent --accept-package-agreements --accept-source-agreements
winget install --id Microsoft.DotNet.DesktopRuntime.7 --silent --accept-package-agreements --accept-source-agreements
winget install --id Microsoft.DotNet.DesktopRuntime.8 --silent --accept-package-agreements --accept-source-agreements
exit /b

:INSTALAR_XNA
echo.
echo [+] %TXT_INST_XNA%
winget install --id Microsoft.XNARedist --silent --accept-package-agreements --accept-source-agreements
exit /b

:INSTALAR_OPENAL
echo.
echo [+] %TXT_INST_OAL%
winget install --id OpenAL.OpenAL --silent --accept-package-agreements --accept-source-agreements
exit /b

:INSTALAR_JAVA
echo.
echo [+] %TXT_INST_JAVA%
winget install --id EclipseAdoptium.Temurin.21.JRE --silent --accept-package-agreements --accept-source-agreements
exit /b

:FIN
echo.
echo ================================================================
echo   %TXT_DONE%
echo ================================================================
pause
goto MENU

:: ================================================================
:: DICCIONARIOS DE IDIOMAS
:: ================================================================
:LANG_ES
set "CUR_LANG=ES"
title Instalador de Redistribuibles - Menu Interactivo
set "TXT_HEADER=INSTALADOR DE REDISTRIBUIBLES PARA JUEGOS Y APPS"
set "TXT_OPT1=[1] Instalar TODO (Recomendado para PC nueva)"
set "TXT_OPT2=[2] Visual C++ Redistributables (2005 - 2022 x86/x64)"
set "TXT_OPT3=[3] DirectX End-User Runtime"
set "TXT_OPT4=[4] .NET Desktop Runtime (6, 7 y 8)"
set "TXT_OPT5=[5] Microsoft XNA Framework 4.0 (Juegos Indie/Antiguos)"
set "TXT_OPT6=[6] OpenAL (Audio 3D en juegos clasicos)"
set "TXT_OPT7=[7] Java Runtime (Temurin JRE 21 - Minecraft y apps Java)"
set "TXT_OPT8=[8] Cambiar idioma a Ingles (Switch to English)"
set "TXT_OPT0=[0] Salir"
set "TXT_PROMPT=Selecciona una opcion [0-8]: "
set "TXT_INSTALL_ALL=Instalando TODOS los paquetes disponibles..."
set "TXT_INST_VC=Instalando Visual C++ Redistributables (2005 - 2022)..."
set "TXT_INST_DX=Instalando DirectX End-User Runtime..."
set "TXT_INST_NET=Instalando .NET Desktop Runtime (6, 7 y 8)..."
set "TXT_INST_XNA=Instalando Microsoft XNA Framework 4.0..."
set "TXT_INST_OAL=Instalando OpenAL..."
set "TXT_INST_JAVA=Instalando Eclipse Temurin JRE 21 (Java)..."
set "TXT_DONE=Proceso finalizado. Se recomienda reiniciar el equipo."
exit /b

:LANG_EN
set "CUR_LANG=EN"
title Redistributables Installer - Interactive Menu
set "TXT_HEADER=REDISTRIBUTABLES INSTALLER FOR GAMES AND APPS"
set "TXT_OPT1=[1] Install ALL (Recommended for a new PC)"
set "TXT_OPT2=[2] Visual C++ Redistributables (2005 - 2022 x86/x64)"
set "TXT_OPT3=[3] DirectX End-User Runtime"
set "TXT_OPT4=[4] .NET Desktop Runtime (6, 7 and 8)"
set "TXT_OPT5=[5] Microsoft XNA Framework 4.0 (Indie/Older Games)"
set "TXT_OPT6=[6] OpenAL (3D Audio in classic games)"
set "TXT_OPT7=[7] Java Runtime (Temurin JRE 21 - Minecraft and Java apps)"
set "TXT_OPT8=[8] Switch language to Spanish (Cambiar a Espanol)"
set "TXT_OPT0=[0] Exit"
set "TXT_PROMPT=Select an option [0-8]: "
set "TXT_INSTALL_ALL=Installing ALL available packages..."
set "TXT_INST_VC=Installing Visual C++ Redistributables (2005 - 2022)..."
set "TXT_INST_DX=Installing DirectX End-User Runtime..."
set "TXT_INST_NET=Installing .NET Desktop Runtime (6, 7 and 8)..."
set "TXT_INST_XNA=Installing Microsoft XNA Framework 4.0..."
set "TXT_INST_OAL=Installing OpenAL..."
set "TXT_INST_JAVA=Installing Eclipse Temurin JRE 21 (Java)..."
set "TXT_DONE=Process finished. A system restart is recommended."
exit /b
