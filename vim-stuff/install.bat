@echo off
rem set VIMFILES=%HOMEDRIVE%%HOMEPATH%\vimfiles
rem set VIMRC=%HOMEDRIVE%%HOMEPATH%\_vimrc
set VIMFILES=C:\tmp\vimfiles
set VIMRC=C:\tmp\_vimrc

rem TEST
del %VIMRC%
rd /s /q %VIMFILES%

rem INSTALL VIMRC
if exist %VIMRC% (
    echo %VIMRC% already exists 
) else (
    copy .\.vimrc %VIMRC%
)

rem INSTALL VIMFILES
if exist %VIMFILES% (
    echo %VIMFILES% already exists
) else (
    mkdir %VIMFILES%
    xcopy /E .\.vim %VIMFILES%
)
