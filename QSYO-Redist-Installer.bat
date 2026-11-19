@echo off
chcp 65001 >nul
title Instalador de Redistribuibles - Menu Interactivo
color 0B

:: Verificar permisos de administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Solicitando permisos de administrador...
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
echo                        Cargando herramientas del sistema...
timeout /t 2 /nobreak >nul

:: ================================================================
:: MENU PRINCIPAL
:: ================================================================
:MENU
cls
echo ================================================================
echo         INSTALADOR DE REDISTRIBUIBLES PARA JUEGOS Y APPS
echo ================================================================
echo.
echo   [1] Instalar TODO (Recomendado para PC nueva)
echo   [2] Visual C++ Redistributables (2005 - 2022 x86/x64)
echo   [3] DirectX End-User Runtime
echo   [4] .NET Desktop Runtime (6, 7 y 8)
echo   [5] Microsoft XNA Framework 4.0 (Juegos Indie/Antiguos)
echo   [6] OpenAL (Audio 3D en juegos clasicos)
echo   [7] Java Runtime (Temurin JRE 21 - Minecraft y apps Java)
echo   [0] Salir
echo.
echo ================================================================
set /p opcion="Selecciona una opcion [0-7]: "

if "%opcion%"=="1" goto TODO
if "%opcion%"=="2" goto VCREDIST
if "%opcion%"=="3" goto DIRECTX
if "%opcion%"=="4" goto DOTNET
if "%opcion%"=="5" goto XNA
if "%opcion%"=="6" goto OPENAL
if "%opcion%"=="7" goto JAVA
if "%opcion%"=="0" exit
goto MENU

:TODO
cls
echo Instalando TODOS los paquetes disponibles...
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
echo [+] Instalando Visual C++ Redistributables (2005 - 2022)...
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
echo [+] Instalando DirectX End-User Runtime...
winget install --id Microsoft.DirectX --silent --accept-package-agreements --accept-source-agreements
exit /b

:INSTALAR_DOTNET
echo.
echo [+] Instalando .NET Desktop Runtime (6, 7 y 8)...
winget install --id Microsoft.DotNet.DesktopRuntime.6 --silent --accept-package-agreements --accept-source-agreements
winget install --id Microsoft.DotNet.DesktopRuntime.7 --silent --accept-package-agreements --accept-source-agreements
winget install --id Microsoft.DotNet.DesktopRuntime.8 --silent --accept-package-agreements --accept-source-agreements
exit /b

:INSTALAR_XNA
echo.
echo [+] Instalando Microsoft XNA Framework 4.0...
winget install --id Microsoft.XNARedist --silent --accept-package-agreements --accept-source-agreements
exit /b

:INSTALAR_OPENAL
echo.
echo [+] Instalando OpenAL...
winget install --id OpenAL.OpenAL --silent --accept-package-agreements --accept-source-agreements
exit /b

:INSTALAR_JAVA
echo.
echo [+] Instalando Eclipse Temurin JRE 21 (Java)...
winget install --id EclipseAdoptium.Temurin.21.JRE --silent --accept-package-agreements --accept-source-agreements
exit /b

:FIN
echo.
echo ================================================================
echo   Proceso finalizado. Se recomienda reiniciar el equipo.
echo ================================================================
pause
goto MENU
