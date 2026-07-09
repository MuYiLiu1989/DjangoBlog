@echo off
:: =====================================================================
:: Configuration Parameters for Database Download
:: =====================================================================
:: https://drive.google.com/file/d/1Tv5UucHxBHCiIrwvJar9nwBnj5PdVioA/view?usp=sharing
:: Google Drive File ID for db.sqlite3
set "FILE_ID=1Tv5UucHxBHCiIrwvJar9nwBnj5PdVioA"

:: Local path where the database will be saved
set "DB_PATH=%~dp0db.sqlite3"

:: Direct download link constructed from FILE_ID
set "DOWNLOAD_URL=https://drive.google.com/uc?export=download&id=%FILE_ID%"

set "GIT_USER_NAME=MuYiChen"
set "GIT_USER_EMAIL=chenmy1989@gmail.com"