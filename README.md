# Onward Version Switcher and Launcher
### OnwardVSL v2.02 created by Archetek and BigWing.

### DISCLAIMER
This solution uses a windows batch file to rename the Onward Steam Library folders and launch the Onward Steam application. You should check the contents of batch files before running on your own machine to ensure that there are no malicious commands. I have tried to comment the commands as much as possible to help users understand what they do.

### CREDITS
This script just automates the process for switching Onward versions created by **BigWing** and **Ytrex**, based on work by **Monorchild**. My thanks to BigWing for extensive testing and troubleshooting.

### CHANGES


- v1.01    Added brief summary of instructions to install both versions of Onward

- v2.0     Allows Steam updates to Onward 1.8. Keeps the 1.8 files in the Onward directory and only renames the folders to put 1.7 files in the Onward directory when you are actually playing 1.7 to prevent 1.8 updates from overwriting 1.7 files.

- v2.01    Added checks to see if the game is running to prevent game file corruption

- v2.02    Updated documentation

### PREREQUISITES

- Windows Operating System
- Steam version of Onward

### INSTALLATION

- Install Onward 1.7 and Onward 1.8 Folders
  - Install Onward 1.7 by changing the Beta Opt-in to "1.7backup - 1.7backup"
    - Right click Onward in your steam library and select "Properties". In the Betas tab select "1.7backup - 1.7backup" in the dropdown	
  - After downloading the 1.7 files, rename the **"Onward"** game folder to **"Onward17"**
    - The game folder can be found in the Steam Library location where Onward was installed (for example, C:\Program Files (x86)\Steam\steamapps\common)  
  - Switch the Beta Opt-in back to "None" to start downloading 1.8 into a new **"Onward"** folder 	
  - You should now have Onward 1.8 in the **"Onward"** folder and Onward 1.7 in the **"Onward17"** folder	
  - Keep the beta opt-in option to "None"
 
- Copy the OnwardVSL.bat file into the parent directory of the Onward folders (for example, C:\Program Files (x86)\Steam\steamapps\common)

### INSTRUCTIONS
  
- Run the OnwardVSL.bat script

OnwardVSL menu options

- Chose menu option "1" to launch Onward 1.7
  - OnwardVSL will rename the Onward game folders as nessessary to ensure version 1.7 the active version
    - OnwardVSL will check for the presence of the **"Onward17"** folder alongside the **"Onward"** folder
    - If the **"Onward17"** folder is found, it is assumed that the **"Onward"** folder contains Onward 1.8 and the **"Onward17"** folder contains Onward 1.7
    - Accordingly, OnwardVSL renames the **"Onward"** folder to **"Onward18"** and the **"Onward17"** folder to **"Onward"** to switch the active version to 1.7
  - OnwardVSL then launches Onward (App ID:496240) using the steam.exe command line (the Steam executable location being taken from the registry)
  - OnwardVSL then prompts for the window to be left open until after closing the game so that it can restore version 1.8
    - Pressing "Enter" in the OnwardVSL window when the game has exited will restore version 1.8 into the **"Onward"** folder and move version 1.7 files into the **"Onward17"** folder
    - If the window is closed before you exit Onward 1.7 then you can manually restore version 1.8 to the **"Onward"** folder with menu option "3". This is nessessary to ensure that version 1.8 files are in the "Onward" folder for Steam updates
	
- Chose menu option "2" to launch Onward 1.8
  - OnwardVSL will rename the Onward game folders as nessessary to ensure version 1.8 is the active version
    - OnwardVSL will check for the presence of the **"Onward18"** folder alongside the active **"Onward"** folder
    - If the **"Onward18"** folder is found, it is assumed that the **"Onward"** folder contains Onward 1.7 and the **"Onward18"** folder contains Onward 1.8
    - Accordingly, OnwardVSL renames the **"Onward"** folder to **"Onward17"** and the **"Onward18"** folder to **"Onward"** to switch the active version to 1.8
  - OnwardVSL then launches Onward (App ID:496240) using the steam.exe command line (the Steam executable location being taken from the registry)
  
- Chose menu option "3" to manually restore version 1.8 
  - OnwardVSL will rename the Onward game folders as nessessary to ensure version 1.8 is the active version
    - OnwardVSL will check for the presence of the **"Onward18"** folder alongside the active **"Onward"** folder
    - If the **"Onward18"** folder is found, it is assumed that the **"Onward"** folder contains Onward 1.7 and the **"Onward18"** folder contains Onward 1.8
    - Accordingly, OnwardVSL renames the **"Onward"** folder to **"Onward17"** and the **"Onward18"** folder to **"Onward"** to switch the active version to 1.8
  
- Chose menu option "4" to create a Desktop Shortcut
  - OnwardVSL uses a temporary VBScript to create a Desktop Shortcut

- Chose menu option "5" to exit OnwardVSL
	
### MIT LICENCE

Copyright (c) 2021 Ed Cull

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
