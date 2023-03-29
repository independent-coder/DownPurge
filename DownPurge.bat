@echo off
setlocal enabledelayedexpansion

echo List of files in the Downloads folder:
echo ---------------------------------------
cd /d %userprofile%\downloads
set /a count=0
for %%a in (*.*) do (
    set /a count+=1
    echo !count!: %%a
)

if %count%==0 (
    echo No files found.
    goto end
)

echo.
set /p input=Enter the numbers of the files to delete (separated by spaces):
for %%a in (%input%) do (
    if %%a leq %count% (
        set file=
        for /f "tokens=1* delims=:" %%b in ('dir /b /o:n /a-d ^| findstr /n "^"') do (
            if %%b==%%a set file=%%c
        )
        if defined file (
            echo Deleting !file!...
            del /q "!file!"
        )
    )
)

:end
pause

