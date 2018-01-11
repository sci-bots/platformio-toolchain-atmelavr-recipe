set PIO_PKG_NAME=%PKG_NAME:platformio-=%
echo %PIO_PKG_NAME%
REM Install PlatformIO package
python -c "import platformio as pio; import platformio.managers.package; pm = pio.managers.package.PackageManager('.', repositories=['https://dl.bintray.com/platformio/dl-packages/manifest.json', 'https://sourceforge.net/projects/platformio-storage/files/packages/manifest.json/download', 'http://dl.platformio.org/packages/manifest.json']); pm.install('%PIO_PKG_NAME%', '%PKG_VERSION%')"
if errorlevel 1 exit 1

REM Create PlatformIO packages directory.
setlocal enableextensions
md "%PREFIX%"\share\platformio\packages
endlocal
REM Move extracted package to PlatformIO packages directory.
move %PIO_PKG_NAME% "%PREFIX%"\share\platformio\packages
if errorlevel 1 exit 1
