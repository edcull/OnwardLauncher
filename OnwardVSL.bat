@ECHO OFF

echo ####################################################
echo #                                                  #
echo #                    OnwardVSL                     #
echo #         Onward Switcher and Launcher v1.0        #
echo #                                                  #
echo #                Onward 1.7 Players                #
echo #            https://discord.gg/EjjtFkft           #
echo #                                                  #
echo #             by Archetek and BigWing              # 
echo #        with thanks to Ytrex and Monorchid        #
echo #                                                  # 
echo ####################################################
echo. 
echo Select version to launch and press Enter
echo [0] Create Desktop Shortcut
echo [1] Launch Onward 1.7
echo [2] Launch Onward 1.8

Rem ### Find the Steam Executable location from the Registry ###
FOR /F "usebackq tokens=3*" %%A IN (`REG QUERY "HKEY_CURRENT_USER\SOFTWARE\Valve\Steam" /v SteamExe`) DO (
    set steam_exe="%%A %%B"
)

Rem ### Function to prompt for version to launch ###
:choice        
    set /P c= 
    if /I "%c%" EQU "0" goto :create_shortcut
    if /I "%c%" EQU "1" goto :launch_17
    if /I "%c%" EQU "2" goto :launch_18	
goto :choice
    
Rem ### Function to rename folders for version 1.7 ###
:launch_17
    echo Preparing to launch Onward 1.7
    IF EXIST Onward17 (
        echo Renaming Folders
        RENAME Onward Onward18
        RENAME Onward17 Onward
    ) 
    goto :launch_app

Rem ### Function to rename folders for version 1.8 ###
:launch_18
    echo Preparing to launch Onward 1.8
    IF EXIST Onward18 (
        echo Renaming Folders
        RENAME Onward Onward17
        RENAME Onward18 Onward
    ) 
    goto :launch_app

Rem ### Function to launch Onward ###
:launch_app
    echo Please wait for Onward to launch
    "%steam_exe%" -applaunch 496240
    echo Press enter to exit
    set /p input=
    exit
   
Rem ### Function to create desktop shortcut via temp vbscript###	
:create_shortcut
    set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
    echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
    echo sLinkFile = "%USERPROFILE%\Desktop\OnwardVSL.lnk" >> %SCRIPT%
    echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
    echo oLink.TargetPath = "%CD%\OnwardVSL.bat" >> %SCRIPT%
    echo oLink.WorkingDirectory = "%CD%" >> %SCRIPT% 
    echo oLink.IconLocation = "%CD%\Onward\Onward.exe,0" >> %SCRIPT%
    echo oLink.Save >> %SCRIPT%
    cscript /nologo %SCRIPT%
    del %SCRIPT%
    echo Desktop Shortcut Created
    goto :choice