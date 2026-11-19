#  QSYO Redist Installer

*[English version below](#-english-version)*

**QSYO Redist Installer** es una herramienta interactiva para Windows que descarga e instala de forma silenciosa y oficial los paquetes redistribuibles esenciales (Visual C++, DirectX, .NET, XNA, OpenAL y Java) mediante **Winget**, solucionando errores comunes de archivos `.dll` al ejecutar videojuegos y programas.

---

##  Ejecución Rápida (Desde PowerShell)

No necesitas descargar nada manualmente. Puedes iniciar el instalador directamente desde la terminal:

1. Haz clic derecho en el botón de **Inicio** de Windows y abre **Terminal** o **PowerShell**.
2. Pega el siguiente comando y presiona **Enter**:

```powershell
irm "https://githubusercontent.com" -OutFile "\(env:TEMP\QSYO-Redist.bat"; Start-Process "\)env:TEMP\QSYO-Redist.bat" -Verb RunAs
```

> **Nota:** El script solicitará permisos de administrador automáticamente para realizar las instalaciones.

---

##  Paquetes Incluidos

El menú interactivo te permite instalar **todo con un solo clic (Opción 1)** o elegir cada paquete por separado:

| Opción | Paquete | Descripción / Uso habitual |
| :--- | :--- | :--- |
| **[1]** | **Instalar TODO** | Instala automáticamente todos los paquetes de la lista (ideal para PC recién formateada). |
| **[2]** | **Visual C++ (2005 - 2022)** | Versiones `x86` y `x64`. Soluciona errores como `VCRUNTIME140.dll` o `MSVCP140.dll`. |
| **[3]** | **DirectX End-User Runtime** | Librerías gráficas necesarias para juegos clásicos y modernos (`d3dx9_43.dll`, etc.). |
| **[4]** | **.NET Desktop Runtime** | Versiones **6, 7 y 8** requeridas por aplicaciones modernas de Windows. |
| **[5]** | **Microsoft XNA Framework 4.0** | Indispensable para juegos indie clásicos (Terraria, Stardew Valley, Magicka, etc.). |
| **[6]** | **OpenAL** | Motor de audio 3D utilizado en numerosos videojuegos. |
| **[7]** | **Java Runtime (Temurin JRE 21)** | Entorno Java actualizado para Minecraft y aplicaciones `.jar`. |

---

##  Seguridad y Requisitos

* **100% Oficial y Seguro:** No contiene archivos `.exe` compilados ni enlaces de terceros; todo se descarga directamente desde los servidores oficiales de Microsoft y Winget.
* **Requisitos:** Windows 10 (1809+) o Windows 11 con `winget` (Instalador de aplicación) disponible y conexión a Internet.

---
---

#  English Version

**QSYO Redist Installer** is an interactive Windows batch tool to easily download and silently install official redistributable packages (Visual C++, DirectX, .NET, XNA, OpenAL, and Java) via **Winget**, fixing missing `.dll` errors when running video games and applications.

##  Quick Run (PowerShell)

Run the interactive menu directly without manually downloading files:

1. Right-click the Windows **Start** button and select **Terminal** or **PowerShell**.
2. Copy and paste the following command, then press **Enter**:

```powershell
irm "https://githubusercontent.com" -OutFile "\(env:TEMP\QSYO-Redist.bat"; Start-Process "\)env:TEMP\QSYO-Redist.bat" -Verb RunAs
```

##  Included Packages

* **[1] Install ALL**: Recommended for fresh Windows installations.
* **[2] Visual C++ Redistributables (2005 - 2022)**: Both `x86` and `x64` architectures.
* **[3] DirectX End-User Runtime**: Essential legacy and modern DirectX libraries.
* **[4] .NET Desktop Runtime**: Versions **6, 7, and 8**.
* **[5] Microsoft XNA Framework 4.0**: Required for classic indie games.
* **[6] OpenAL**: 3D audio API for games.
* **[7] Java Runtime (Eclipse Temurin JRE 21)**: For Minecraft and Java-based software.
