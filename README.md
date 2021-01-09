# Onward Version Switcher and Launcher OVSL v1.0
Onward version quick swap utility script created by Archetek and BigWing.

### DISCLAIMER
This solution uses a windows batch file to rename the Onward Steam Library folders and launch the Onward Steam application. You should check the contents of batch files before running on your own machine to ensure that there are no malicious commands. I have tried to comment the commands as much as possible to help users understand what they do.

### CREDITS
This script just automates the process for switching Onward versions created by **BigWing** and **Ytrex**, based on work by **Monorchild**. My thanks to BigWing for extensive testing and troubleshooting.

### PREREQUISITES

- Windows Operating System
- Steam version of Onward
- Following BigWing's instructions to install Onward 1.7 and Onward 1.8 Folders
  - It is recommended to keep the beta opt-in option to "1.7backup - 1.7backup" to prevent 1.8 updates from overwritting your 1.7 files
- You should have either:
  - Onward 1.7 in the **Onward** folder and Onward 1.8 in the **Onward18** folder
  - Onward 1.8 in the **Onward** folder and Onward 1.7 in the **Onward17** folder

### INSTRUCTIONS

- Optional. Open the **OVSL.bat** file in a text editor to check its contents are not malicious
- Copy the **OVSL.bat** file into the parent folder of the Onward folders (The Steam library location containing Onward, i.e. *C:\Program Files (x86)\Steam\steamapps\common*)
- Run the **OVSL.bat** file
- Optional. Choose the hidden "0" option to automatically create a desktop shortcut
- Chose the "1" option to launch Onward 1.7, or the "2" option to launch Onward 1.8.
  - note: you can close the launcher immediately, but Onward may take a short time to check SteamVR is running before launching into VR
 

### EXPLANATION

The script prompts for the version of Onward the user wishes to launch (Options 0, 1 or, 2)

- Option 0 - For creating a Desktop Shortcut
  - The script creates a temporary VBScript to create a Desktop Shortcut to the batch file

- Option 1 - For launching Onward 1.7:
  - The script will check for the presence of the **"Onward17"** folder alongside the active **"Onward"** folder
  - If the **"Onward17"** folder is found, it is assumed that the **"Onward"** folder contains Onward 1.8 and the **"Onward17"** folder contains the Onward 1.7 files
  - Accordingly, the script then renames the active **"Onward"** folder as **"Onward18"** and the **"Onward17"** folder to **"Onward"** to switch the active version to 1.7
  - The script then launches Onward (App ID:496240) using the steam.exe command line (the Steam executable location being taken from the registry)
  
- Option 2 - For launching Onward 1.8:
  - The script will check for the presence of the **"Onward18"** folder alongside the active **"Onward"** folder
  - If the **"Onward18"** folder is found, it is assumed that the **"Onward"** folder contains Onward 1.7 and the **"Onward18"** folder contains the Onward 1.8 files
  - Accordingly, the script then renames the active **"Onward"** folder as **"Onward17"** and the **"Onward18"** folder to **"Onward"** to switch the active version to 1.8
  - The script then launches Onward (App ID:496240) using the steam.exe command line (the Steam executable location being taken from the registry)


	
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
