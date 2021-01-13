@ECHO OFF
Title OnwardVSL v2.0

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
	   echo "Onward" folder and either an "Onward17" or "Onward18"
       echo folder as created by following BigWing's instructions
       echo for downloading both versions of Onward.
	   echo Press enter to exit
       set /p input=
       exit
   ) else (
       Call :title
       Call :choice
   )

Rem ### Function to prompt for version to launch ###
:choice        
    echo. 
    echo Select command and press Enter
    echo  [1] Launch Onward 1.7
    echo  [2] Launch Onward 1.8
    echo  [3] Restore Onward 1.8 files
    echo  [4] Create Desktop Shotcut
	echo  [5] Exit OnwardVSL
	
    set /P c= 
    if /I "%c%" EQU "1" Call :launch_17
    if /I "%c%" EQU "2" Call :launch_18	
	if /I "%c%" EQU "3" Call :restore_18	
	if /I "%c%" EQU "4" Call :create_shortcut
	if /I "%c%" EQU "5" exit
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
	
Rem ### Function to restore 1.8 for steam updates ###
:restore_18
    IF EXIST Onward18 (
        RENAME Onward Onward17
        RENAME Onward18 Onward
    ) 	
	
	cls
	Call :title
	echo. 
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
	
	cls
	Call :title
	echo. 
    echo Desktop Shortcut Created
    Call :choice
	
:title
    echo #####################################################
    echo #                                                   #
    echo #                     OnwardVSL                     #
    echo #     Onward Version Switcher and Launcher v2.0     #
    echo #                                                   #
    echo #                 Onward 1.7 Players                #
    echo #             https://discord.gg/EjjtFkft           #
    echo #                                                   #
    echo #              by Archetek and BigWing              # 
    echo #         with thanks to Ytrex and Monorchid        #
    echo #                                                   # 
    echo #####################################################
	
	
	