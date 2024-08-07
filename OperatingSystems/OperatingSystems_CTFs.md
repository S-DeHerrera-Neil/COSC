# Windows_PowerShell
Level 1:
Primer_CLI(1)
1.conhost.exe
2.WSL
3.Windows Terminal
4.cmd.exe
5.string
6.(.NET)
7.PowerShell version
8.pwsh.exe
9.PowerShell.exe
Level 5:
Windows_PowerShell_Basics(5)
1.verb-noun
2.get-command
3.get-verb
4.objects
5.properties,methods
6.get-member
Windows_PowerShell_Alias(5)
1.get-alias
2.get-childitem {gci}
Windows_PowerShell_Help(5)
1.get-help
2.-full
3.update-help
4.-online
Windows_PowerShell_Interaction(5)
1.start chrome
2.(get-process chrome).kill()
3.stop-process -name chrome
Windows_PowerShell_CIMClasses(5)
1.get-WMIobjectWin32_processor
Windows_PowerShell_Logic(5)
1.get-content
2.measure-object
Windows_PowerShell_REGEX(5)
1.select-string
Windows_PowerShell_Basics(5)
7.(C:\Users\)
Windows_PowerShell_Basics(10)
8.> (get-process | get-member -membertype property).count
    value is: 52
Windows_PowerShell_Alias(10)
3. 3
Windows_PowerShell_Help(10)
5. > Get-Process Powershell
Windows_PowerShell_CIMClasses(10)
2. > Get-WMIObject WIN32_service | ?{$_.Name -like "legoland"} | select Description
answer: i_love_legos
Windows_PowerShell_Logic(10)
3. > Get-Content words2.txt | Measure-Object -Word
    Answer: 5254 words
4. > (Get-ChildItem | Measure-Object).count
    Answer: 925 files
5.
6.
7.
Windows_PowerShell_Basics(10)
9.
Windows_PowerShell_Logic(10)
8.
Windows_PowerShell_REGEX(10)
2.
3.
4.
Windows_PowerShell_Logic(15)
9.
Windows_PowerShell_REGEX(15)
5.
#-----------------------------------------------------------------------------------------------

# Windows_PowerShell_Profiles

    Question 1-2: Level of Precendence Powershell Profiles
    
    1.All Users, All Hosts            $PsHome\Profile.ps1
    2.All Users, Currnet Host         $PsHome\Microsoft.PowerShell_profile.ps1
    3.Current User, All Hosts         $Home\[My]Documents\Profile.ps1
    4.Current User, Current Host      $Home\[My ]Documents\WindowsPowerShell\Profile.ps1

    Question 3: Which PowerShell variable stores the current user's home directory?
    
    > $home
    Question 4: Which PowerShell variable stores the installation directory for PowerShell?
    
    > $PSHome
    Question 5: Which PowerShell variable stores the path to the "Current User, Current Host" profile?

    > $profile
    Question 6: What command would you run to view the help for PowerShell Profiles?

    > get-help about_profiles
    Question 7: What command would tell you if there was a profile loaded for All Users All Hosts?
    Flag is the full command syntax

    > Test-Path -Path $PROFILE.AllUsersAllHosts
    Question 8: Challenge only allows ONE attempt
    Malware is running on the primary PowerShell profile on the File-Server. Based on PowerShell          profile order of precedence (what is read first), find the correct flag.
    The flag is the string after the #, without the preceding space.

    > I wasted my attemt.
#--------------------------------------------------------------------------------------------

# Linux_Basics
    Level 0:
    0.
    Level 5:
    Linux Basics(5)
    1.ls
    2.ls -hl
    3.| -pipe
    4.man -k
    Linux Basics LFS Hierarchy(5)
    _./ :(absolute path of the root(main) directory)
    2./etc :(absolute path to the default location for configuration files)
    3./bin :(Directory containing executable programs(binaries) needed in single user mode)
    4.
    5./sbin :(binaries only root can access)
    6.
    Level 10:
    Linux basics(10)
    5.
    6.
    Linux Basics LFS Hierarchy(10)
    7.
    Linux Basics users and Groups(10)
    1.
    2.
    3.
    4.
    Linux Basics Permisions(10)
    1.
    2.
    3.
    4.
    5.
    6.
    7.
    8.
    9.
    10.
    Linux Basics Regular Expressions(10)
    1.
    2.
    3.
    4
    Linux Basics Reformat(10)
    1.
    2.
    Linux Basics Bash Logic(10)
    1.
    2.
    Level 15:
    Linux Basics Regular Expressions(15)
    1.
    2.
#---------------------------------------------------------------------------------------------

# Windows_Registry
    Level 1:
    1.HKLM\HARWARE
    2.HKLM\SOFTWARE
    3.HKLM\SYSTEM\CurrentControlSet\Services 
    4.0x0
    5.HKLM\SYSTEM\CurrentControlSet\Services
    6.0x2
    7.0x3
    8.HKLM, HKU
    9.Get-PSDrive
    10.regedit
    Level 5:
    1.HKLM
    2.HKU
    3.HKCU
    4.HKEY_USERS\S-1-5-21-2881336348-3190591231-4063445930-1002 
    5.Get-ChilItem
    6.Get-Item
    Level 10:
    7.HKLM:\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN *All CAPS*
    8.HKCU:\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN
    9.HKLM:\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUNONCE
    10.HKCU:\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUNONCE
    Level 15:
    11.
    12.
    13.
    14.
    15.
    16.
    17.
#---------------------------------------------------------------------------------------------

# Start_Windows_Alternate_Data_Stream
    Level 1:
    1.file system
    2.Clusters
    3.MFT-(Master File Table)
    4..
    5.
    6.
    7.
    8.
    9.
    10.
    11.
    12.
    13.
    14.
    15.
    16.
    17
    Level 5:
    1.
    2.
    3.
    4.
    5.
    6.
    Level 10:
    7.
    8.
    9.
    10.
    11.
    12.
    Level 15:
    13.
    14.
#---------------------------------------------------------------------------------------------

# Start _Windows_Boot_Process

#---------------------------------------------------------------------------------------------
# Start_Linux_Boot_Process

#---------------------------------------------------------------------------------------------
# Start_Windows_Process

#---------------------------------------------------------------------------------------------
# Start_Windows_UAC

#---------------------------------------------------------------------------------------------
# Start_Windows_Services

#---------------------------------------------------------------------------------------------
# Start_Linux_Process

#---------------------------------------------------------------------------------------------
# Start_Windows_Auditing_and_Logging

#---------------------------------------------------------------------------------------------
# Start_Linux_Auditing_and_Logging

#---------------------------------------------------------------------------------------------
# Start_Windows_Analysis

#---------------------------------------------------------------------------------------------
# Start_Windows_active_Directory
