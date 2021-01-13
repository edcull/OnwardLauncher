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
       Call :title 0, "Error:"
       echo This script requires the presence of both an "Onward"
       echo folder and either an "Onward17" or "Onward18" folder
       echo in the same directory	   
	   echo.
	   echo Press enter to exit
       set /p input=
       exit
   ) else (
       Call :title 1, ""
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
    tasklist /FI "IMAGENAME eq Onward.exe" 2>NUL | find /I /N "Onward.exe" >NUL	
    if %ERRORLEVEL% == 0 (	
	    Call :title 1, "Onward is currently running.."
		
	) else (	
		IF EXIST Onward17 (
			RENAME Onward Onward18
			RENAME Onward17 Onward
		) 
		Call :title 0, "Please wait for Onward 1.7 to launch..."
		%steam_exe% -applaunch 496240
		TIMEOUT 8 >NUL /NOBREAK
		Call :exit_17
	)
	
:exit_17
    echo After exiting the game, press enter to restore 1.8 files
	set /p input=
	
	tasklist /FI "IMAGENAME eq Onward.exe" 2>NUL | find /I /N "Onward.exe" >NUL	
    if %ERRORLEVEL% == 0 (
	    echo Onward is currently running..
		Call :exit_17
	) else (
	    IF EXIST Onward18 (
            RENAME Onward Onward17
            RENAME Onward18 Onward
        ) 
        Call :title 1, "Onward 1.8 files restored"
	)

Rem ### Function to rename folders for version 1.8 ###
:launch_18
    tasklist /FI "IMAGENAME eq Onward.exe" 2>NUL | find /I /N "Onward.exe" >NUL	
    if %ERRORLEVEL% == 0 (	
	    Call :title 1, "Onward is currently running.."
		
	) else (
		IF EXIST Onward18 (
			RENAME Onward Onward17
			RENAME Onward18 Onward
		) 
		%steam_exe% -applaunch 496240
		Call :title 1, "Onward 1.8 launched"
	)	
	
Rem ### Function to restore 1.8 for steam updates ###
:restore_18

    tasklist /FI "IMAGENAME eq Onward.exe" 2>NUL | find /I /N "Onward.exe" >NUL	
    if %ERRORLEVEL% == 0 (	
	    Call :title 1, "Onward is currently running.."
		
	) else (	
		IF EXIST Onward18 (
            RENAME Onward Onward17
            RENAME Onward18 Onward
        ) 	
        Call :title 1, "Onward 1.8 files restored"
	)
   
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
    Call :title 1, "Desktop Shortcut Created"

:title 
    cls
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
    if not "%~2" == "" (
		 echo. && echo %~2
	)
  	if "%~1" == "1" (
	    Call :choice
    )
	
	