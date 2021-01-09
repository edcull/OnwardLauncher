@ECHO OFF

echo ####################################################
echo #                                                  #
echo #                    OnwardVSL                     #
echo #  Onward Version Switcher and Launcher v2.0beta   #
echo #                                                  #
echo #                Onward 1.7 Players                #
echo #            https://discord.gg/EjjtFkft           #
echo #                                                  #
echo #             by Archetek and BigWing              # 
echo #        with thanks to Ytrex and Monorchid        #
echo #                                                  # 
echo ####################################################
echo. 


Rem ### Find the Steam Executable location from the Registry ###
FOR /F "usebackq tokens=3*" %%A IN (`REG QUERY "HKEY_CURRENT_USER\SOFTWARE\Valve\Steam" /v SteamExe`) DO (
    set steam_exe="%%A %%B"
)

Rem ### Function to initialise the script by checking the correct folder structure exists ###
:init
   set init=false
   if Exist Onward set init=true
   if not EXIST Onward17 if not EXIST Onward18 set init=false
   if "%init%"=="false" (
       echo Error: This script requires the presence of both an
	   echo "Onward" echo folder and either an "Onward17" or
	   echo "Onward18" folder as created by following BigWing's
       echo instructions for downloading both versions of Onward.
	   echo Press enter to exit
       set /p input=
       exit
   ) else (
       Call :choice
   )

Rem ### Function to prompt for version to launch ###
:choice        
    echo Select version to launch and press Enter
    echo [1] Launch Onward 1.7
    echo [2] Launch Onward 1.8
    echo [3] Restore Onward 1.8 files for updates without launching
    echo [4] Create Desktop Shotcut
	
    set /P c= 
    if /I "%c%" EQU "1" Call :launch_17
    if /I "%c%" EQU "2" Call :launch_18	
	if /I "%c%" EQU "3" Call :restore_18	
	if /I "%c%" EQU "4" Call :create_shortcut
    Call :choice
    
Rem ### Function to rename folders for version 1.7 ###
:launch_17
    IF EXIST Onward17 (
        RENAME Onward Onward18
        RENAME Onward17 Onward
    ) 
    echo Please wait for Onward 1.7 to launch (it can take a while)
	echo Keep this window open until you close the game to ensure that 1.8 is restored for updates 
	%steam_exe% -applaunch 496240
	echo Press enter to exit
    set /p input=
	echo Restoring Onward 1.8 files
    RENAME Onward Onward17
    RENAME Onward18 Onward
	exit

Rem ### Function to rename folders for version 1.8 ###
:launch_18
    IF EXIST Onward18 (
        RENAME Onward Onward17
        RENAME Onward18 Onward
    ) 
    %steam_exe% -applaunch 496240
    exit	

Rem ### Function to launch Onward ###
:launch_app
    echo Please wait for Onward to launch
    %steam_exe% -applaunch 496240
    echo Press enter to exit
    set /p input=
    exit
	
Rem ### Function to restore 1.8 for steam updates ###
:restore_18
    IF EXIST Onward18 (
        RENAME Onward Onward17
        RENAME Onward18 Onward
    ) 	
	echo Onward 1.8 files restored
    Call :choice
   
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
    Call :choice