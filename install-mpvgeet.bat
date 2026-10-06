@echo off
setlocal
rem Installer mpvgeet untuk Windows. Satu file, hanya pakai tool bawaan.
rem Pakai: install-mpvgeet.bat [folder-install]
rem Default folder install: .\mpvgeet di folder kerja saat ini.

set "MPV_API=https://api.github.com/repos/mpv-player/mpv/releases/tags/git-release"
set "REPO_ZIP=https://github.com/geetcr4ck/mpvgeet/archive/refs/heads/main.zip"
set "TMP_ZIP_MPV=%TEMP%\mpvgeet-mpv.zip"
set "TMP_ZIP_REPO=%TEMP%\mpvgeet-repo.zip"
set "DL_DIR=%TEMP%\mpvgeet-dl"
set "MPV_STAGE=%DL_DIR%\mpv"
set "REPO_STAGE=%DL_DIR%\repo"

if "%~1"=="" (
  set "INSTALL_DIR=%CD%\mpvgeet"
) else (
  set "INSTALL_DIR=%~1"
)

echo [1/6] Cek tool bawaan: curl.exe, tar.exe, powershell.exe ...
where curl.exe >nul 2>nul
if errorlevel 1 (
  echo [GAGAL] curl.exe tidak ditemukan di PATH.
  pause
  exit /b 1
)
where tar.exe >nul 2>nul
if errorlevel 1 (
  echo [GAGAL] tar.exe tidak ditemukan di PATH.
  pause
  exit /b 1
)
where powershell.exe >nul 2>nul
if errorlevel 1 (
  echo [GAGAL] powershell.exe tidak ditemukan di PATH.
  pause
  exit /b 1
)
echo        Semua tool ada. Target install: "%INSTALL_DIR%"

echo [2/6] Ambil link unduhan mpv terbaru dari GitHub ...
set "MPV_URL="
for /f "delims=" %%U in ('powershell -NoProfile -Command "(Invoke-RestMethod -Uri 'https://api.github.com/repos/mpv-player/mpv/releases/tags/git-release').assets | Where-Object { $_.name -like '*-x86_64-w64-mingw32-full.zip' } | Select-Object -First 1 -ExpandProperty browser_download_url" 2^>nul') do set "MPV_URL=%%U"
if not defined MPV_URL (
  echo [GAGAL] Gagal dapat link mpv. Mungkin rate limit GitHub 60 per jam. Coba lagi nanti.
  pause
  exit /b 1
)
echo        Link ditemukan.

echo [3/6] Unduh paket mpv ...
curl -L -o "%TMP_ZIP_MPV%" "%MPV_URL%"
if errorlevel 1 (
  echo [GAGAL] Unduhan mpv gagal. Periksa koneksi lalu coba lagi.
  pause
  exit /b 1
)

echo [4/6] Ekstrak mpv dan siapkan folder install ...
if exist "%DL_DIR%" rmdir /s /q "%DL_DIR%"
mkdir "%MPV_STAGE%"
tar -xf "%TMP_ZIP_MPV%" -C "%MPV_STAGE%"
if errorlevel 1 (
  echo [GAGAL] Ekstrak paket mpv gagal. File zip mungkin rusak.
  pause
  exit /b 1
)
set "MPV_SRC="
if exist "%MPV_STAGE%\mpv.exe" set "MPV_SRC=%MPV_STAGE%"
if not defined MPV_SRC for /d %%D in ("%MPV_STAGE%\*") do if exist "%%D\mpv.exe" set "MPV_SRC=%%D"
if not defined MPV_SRC (
  echo [GAGAL] mpv.exe tidak ditemukan di hasil ekstrak.
  pause
  exit /b 1
)
if not exist "%INSTALL_DIR%" mkdir "%INSTALL_DIR%"
xcopy "%MPV_SRC%\*" "%INSTALL_DIR%\" /E /H /I /Y >nul
if errorlevel 1 (
  echo [GAGAL] Gagal salin file mpv ke folder install.
  pause
  exit /b 1
)
echo        File mpv tersalin ke folder install.

echo [5/6] Unduh dan pasang konfigurasi mpvgeet ...
curl -L -o "%TMP_ZIP_REPO%" "%REPO_ZIP%"
if errorlevel 1 (
  echo [GAGAL] Unduhan konfigurasi mpvgeet gagal. Periksa koneksi lalu coba lagi.
  pause
  exit /b 1
)
mkdir "%REPO_STAGE%"
tar -xf "%TMP_ZIP_REPO%" -C "%REPO_STAGE%"
if errorlevel 1 (
  echo [GAGAL] Ekstrak konfigurasi mpvgeet gagal. File zip mungkin rusak.
  pause
  exit /b 1
)
set "REPO_SRC="
if exist "%REPO_STAGE%\portable_config" set "REPO_SRC=%REPO_STAGE%"
if not defined REPO_SRC for /d %%D in ("%REPO_STAGE%\*") do if exist "%%D\portable_config" set "REPO_SRC=%%D"
if not defined REPO_SRC (
  echo [GAGAL] Folder portable_config tidak ditemukan di repo mpvgeet.
  pause
  exit /b 1
)
xcopy "%REPO_SRC%\portable_config" "%INSTALL_DIR%\portable_config\" /E /H /I /Y >nul
if errorlevel 1 (
  echo [GAGAL] Gagal salin portable_config ke folder install.
  pause
  exit /b 1
)
if not exist "%INSTALL_DIR%\portable_config\watch_later" mkdir "%INSTALL_DIR%\portable_config\watch_later"
del /q "%INSTALL_DIR%\portable_config\watch_later\*" 2>nul
for /d %%D in ("%INSTALL_DIR%\portable_config\watch_later\*") do rmdir /s /q "%%D" 2>nul
echo        Konfigurasi terpasang dan watch_later dikosongkan.

echo [6/6] Verifikasi hasil install ...
if not exist "%INSTALL_DIR%\mpv.exe" (
  echo [GAGAL] Verifikasi gagal. mpv.exe tidak ada di folder install.
  pause
  exit /b 1
)
if not exist "%INSTALL_DIR%\portable_config\mpv.conf" (
  echo [GAGAL] Verifikasi gagal. portable_config\mpv.conf tidak ada di folder install.
  pause
  exit /b 1
)

del /q "%TMP_ZIP_MPV%" "%TMP_ZIP_REPO%" 2>nul
rmdir /s /q "%DL_DIR%" 2>nul

echo [OK] Sukses. mpvgeet terpasang di: "%INSTALL_DIR%"
echo Langkah berikut: 1. Jalankan mpv.exe di folder install.
echo Langkah berikut: 2. Untuk default player, klik kanan mpv-register.bat lalu Run as administrator.
exit /b 0
