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
    Level 5:Codex_Heriticus
    Windows_PowerShell_Basics(5)
    1.verb-noun
    2.get-commandCreate a new branch for this commit and start a pull request Learn more about pull requests
    3.get-verb
    4.objects
    5.properties,methods
    6.get-member
    Windows_PowerShell_Alias(5)C:\Windows\SysWOW64WinEvt\Logs\System.evtx
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
    1.select-stringls -l /proc/1904
            ^use the key that was enumerated from the symmetric file
                Anwser: DeCrypt
    Windows_PowerShell_Basics(5)
        lects  the listing of files for processes executing the command that begins with the characters of c.  Multiple commands may be specified, using                 multiple -c            options.  They are joined in a
                single ORed set before participating in AND option selectio
    7.(C:\Users\)
    Windows_PowerShell_Basics(10)Create a new branch for this commit and start a pull request Learn more about pull requests
    8.> (get-process | get-member -membertype property).count
        display value: 52
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
    5. > Compare-Object -referanceobject (Get-Object old.txt) -differenceobject (get-content new.txt)
        Answer: Popeye
    6. > Get-Content words.txt | Sort-Object -descending | Selct-Object -index 21
        Answer: ZzZp
    7. > (Get-Content words.txt | Sort-Object | Get-Unique).count
        Answer: 456976
    Windows_PowerShell_Basics(10)
    9. > (Get-Process | Get-Member -membertype method).count
    Windows_PowerShell_Logic(10)
    8. > (Get-ChildItem -recurse | Where-Object {$_.PSIsContainer}).count
        Answer: 411
    Windows_PowerShell_REGEX(10)
    2.> (Get-Content words.txt |  select-string -allmatches "gaab").count
        Answer: 1
    3.> (Get-Content words.txt | Where-Object {$_ -match '(a|z)'}).count
        Answer: 160352
    4.> (Get-Content words.txt | Where-Object {$_ -match '(az)'}).count
        Answer: 2754
    Windows_PowerShell_Logic(15)
    9.
    Windows_PowerShell_REGEX(15)ps -elf | grep sshd
    ls -l /proc/1904
    /proc/1904/exe,/usr/sbin/sshd
        5.> (Get-Content words.txt | Where-Object {$_ -match '((aa)[a-g])'}).count
            Answer: 357
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

    > $profileAntecedent
    Question 6: What command would you run to view the help for PowerShell Profiles?

    > get-help about_profiles
    Question 7: What command would tell you if there was a profile loaded for All Users All Hosts?
    Flag is the full command syntax

    > Test-Path -Path $PROFILE.AllUsersAllHosts
    Question 8: Challenge only allows ONE attempt
    Malware is running on the primary PowerShell profile on the File-Server. Based on PowerShell profile order of precedence 
    (what is read first), find the correct flag.
    The flag is the string after the #, without the preceding space.

    > I wasted my attemt.
#--------------------------------------------------------------------------------------------
    *Fuck Linux
# Linux_Basics
    
    Level 0:
    0.
    Level 5:
    Linux Basics(5)
    1.ls
    2.ls -hl
    3.| -pipeps -elf | grep sshd
    ls -l /proc/1904
    /proc/1904/exe,/usr/sbin/sshd
        4.man -k
        Linux Basics LFS Hierarchy(5)
        _./ :(absolute path of the root(main) directory)
        2./etc :(absolute path to the default location for configuration files)
        3./bin :(Directory containing executable programs(binaries) needed in single user mode)
        4./usr/bin
        5./sbin :(binaries only root can access)
        6.> man --path cat
            Answer: /usr/share/man/man1/cat.1.gz
        Level 10:
        Linux basics(10)
        5.
        > man -k digest
        > echo "OneWayBestWay" | sha512sum
            Answer: a81bc463469ee1717fc9e388e3799c653f63a3de5e9496b5707b56488b046cbf75665235d316c
            5c0053a597dc7d40c917a2d9006fe35e9cb47766c05ac71989b
        6. 
        $ file Encrypted
        $ unzip Encrypted
        $ file cipher
        $ file symmetric
        $ cat cipher
        $ cat symmetric
            gives you the key & the Hashing Algoritm
        $ openssl AES128 -d -in cipher
            ^use the key that was enumerated from the symmetric file
                Anwser: DeCrypt
        Linux Basics LFS Hierarchy(10)
        7.
        Linux Basics users and Groups(10)
        1. 
        $ cat /etc/passwd | cut -d: -f5-6 | sort
            answer: Traitor 
        2.
        $ cat /etc/group | grep "lodge"
        answer: aximand,erebus,ezekyle,garviel,sejanus,tarik
        3.
        $  cat /etc/passwd | cut -d: -f7 | sort | uniq
        $ cat /etc/passwd | grep "/bin/sh"
            answer: nobody
        4.
        Linux Basics Permisions(10)
        1.
        $ find / -type d -name "Bibliotheca" 2>/dev/null
            Answer: /media/Bibliotheca
        2.
        $ cd /media
        $ ls -l
        $ cat /etc/passwd | grep "sh"
        $ cat /etc/passwd | grep "bash"
           Then count 
           answer: 15 
        3.
        $ cat /etc/group | grep "chapter"
        $ cat /etc/group | grep "chapter"
            mephistonAuditing
        Just look in every dir till you see a file that homie has write permissions on
            answer: Codex_Astartes
        4.
        Codex_Heriticus
        5. 
        Codex_Imperium
        6. GHOSTS
        7. execute
        8. 
        9. Expand your mind
        10. Ph'nglui mglw'nafh Cthulhu
        Linux Basics Regular Expressions(10)
        1. 
        $ ls -l /etc | grep '^d.*\.d$'
            answer: 28
        2.
        $ cat /home/garviel/numbers 
        $ grep '^[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}$' numbers | wc -l
            Answer: 78
        
        3.
         $ cat numbers | grep -oP '\b(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(?:25[0-5]|2[0-4][0-9]|            [01]?[0-9][0-9]?)\b' | wc -l
                Answer: 18
        
        4
        Linux Basics Reformat(10)
        1.
        Linux Basics LFS Hierarchy(10)
        7.
        Linux Basics users and Groups(10)
        1. 
        $ cat /etc/passwd | cut -d: -f5-6 | sort
            answer: Traitor 
        2.
        $ cat /etc/group | grep "lodge"
        answer: aximand,erebus,ezekyle,garviel,sejanus,tarik
        3.
        $  cat /etc/passwd | cut -d: -f7 | sort | uniq
        $ cat /etc/passwd | grep "/bin/sh"
            answer: nobody
        4.

        Linux Basics Bash Logic(10)
        1.
        $ awk 'NR>=420&&NR<=1337' /home/garviel/numbers | sha512sum
            ^ command for the sha512 hash.
        2.
        Level 15:
        Linux Basics Regular Expressions(15)
        1.
        
        2.
#---------------------------------------------------------------------------------------------

# Windows_Registry
    Level 1:
    1.HKLM\HARWARE
    2.HKLM\SOFTWARErequireAdministrator
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
            *As andy.dwyer
     > reg query hklm\software\microsoft\windows\currentversion\run
     Answer: malware.exe
    12.
        *As student
     > reg query hkcu\software\microsoft\windows\currentversion\run
     Answer: C:\botnet.exe
    13. 
    > reg query HKLM:\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUNONCE
    C:\virus.exe
    14. 
    *As student
     > reg query hkcu\software\microsoft\windows\currentversion\runonce
     Answer: C:\worm.exe
    15.
        *As student
    > reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USBSTOR
        Answer: SanDisk9834
    16.
    17.
#---------------------------------------------------------------------------------------------

# Start_Windows_Alternate_Data_Stream
    Level 1:
    1.file system
    2.Clusters
    3.MFT-(Master File Table)
    4.attributes
    5.$DATA
    6.$LOGGED_UTILITY_STREAM
    7.$SECURITY_DESCRIPTORlast five characters 
    8.0x80
    9.1024 bytes
    10.Explicit
    11.Inherited
    12.read
    13.List Folder Contents (folders only)
    14.modify
    15.full control
    16.$STANDARD_INFORMATION
    17.fsutil fsinfo drives
    Level 5:
    1.directory
    2.hidden#count
    3.Get-ChildItem -Force
    4.Get-FileHash -Algorithm sha512
    5.Get-Acl
    6.hostsCreate a new branch for this commit and start a pull request Learn more about pull requests
    Level 10:
    7.BUILTIN\Users
    8. 
    > Get-ChildItem -Path C:\ -Filter hosts* -Recurse
    > cd [the appropriate directory]
    >  Get-Content hosts
    >  Get-FileHash -Path hosts -Algorithm MD5
        Answer: LAST 5 of the hash
    9. 
    > cd c:\Users\CTF
    > Get-ChildItem -path readme* -Recurse -Force
    > cd [to the path specified]
    > Get-Content .\README
        answer: the output
    10.
    > Get-ChildItem -path c:\users\ctf -hidden -Recurse -Force -directory
    > cd [specified DIR]
    > get-content [""]
        answer: in ^there
    11.
    12.
    Level 15:
    13.
    14.
#---------------------------------------------------------------------------------------------

# Windows_Boot_Process
    Level 1:
    Primer_Boot_Process(1)
    1.sector
    2.partition
    3.volume
    4.diskpart
    5. ?(multiple choice)
    6.HAL(multiple choice)
    7.driver
    8.UEFI and BIOS
    9.ntoskrnl.exe
    10.bootmgr and winload.exe
    11.bootmgr
    12.BCD
    13.TPM
    14.Winload.exe
    15.Ntoskrnl.exe
    16.0x2
    17.smss.exe
    18.session 0
    19.secure boot
    20.hibernation
    21.HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices
    22.local logon
    23.userinit.exe
    24.Winlogon.exe
    25.Lsass.exe
    26.Last Known Good Configuration
    27.Kerberos
    28.Key Distribution Center
    29.logon
    Primer_Kernel(1)
    1.hybrid
    2.monolithic
    3. 6.1
    4. 10
    5. 
    > systeminfo | findstr /C:"OS Version" /C:"BIOS Version"
    Level 5:
    Windows_Boot_INIT(5)
    1.System
    2. 4
    3.smss
    4. 0
    5.lsass
    6.services
    7.winlogon
    8.userinit
    9.winload.exe
    10.BIOS
    11.hiberfil.sys
    12.winresume.exe
    Level 10:
    windows_Boot_Remediate(10)
    1.
    > bcdedit
        Anwser: 1RF5Zgf9P
    2.
    > bcdedit /deletevalue {default} safeboot
    > shutdown /r
    > shutdown -a    #run until it aborts the shutdown
        Awnser: 76Drp6hB
    3.
    4.
    5.
#---------------------------------------------------------------------------------------------
# Start_Linux_Boot_Process
    Level 5:
    linux Boot Hex(5)What is the numerical code assigned to the facility dealing with authorization?
    1.0xFF
    Linux Boot Bits and Bytes(5)
    1. 4,8
    2. 4
    3. 17
    Linux Boot MBR(5)
    1.
    Linux Boot SysV(5)
    1. Minas_Tirith
    linux Boot Hex(5)
    2. 0x0-0xF
    3. 0-15
    4.0x35D
    Level 10:
    Linux Boot Bits and Bytes(10)
    4. 
    $sudo cat /dev/vda | xxd -l 32 -c 0x10 -g 1
        Answer: 63,90,8e,d0,31,e4,8e,d8#count
    Linux Boot MBR(10)
    2. assembly language
    3. 
    $ xxd -l 120 -ps -c 20 xxd.1
    $ dd -ibs 16 
    $ dd bs=1 skip==446 count=16 if=mbroken of=linuxsucks
    $ md5sum linuxsucks
        Anwser: 2a5948fad4ec68170b23faaa2a16cef8
    4.
    $ dd bs=1 skip=392 count=4 if=mmbroken of=linuxsucks
    $ md5sum linuxsucks
        Anwser: 5fa690cb0f0789cbc57decfd096a503e
    5.
    
    Linux Boot SysV(10)
    2. 2
    3. /etc/init.d/reboot
    4. 2,3,4,5
    Linux Boot SysD(5)
    1. 
    2.
    3.
    4.
    5.
    6.
    Linux Boot GRUB
    _.

#---------------------------------------------------------------------------------------------
# Windows_Process_Validity
    Level 1:reg query 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList'
    Primer_Process(1)
    1. C:\Windows\SysWOW64
    2. smss.exe
    3. lsass.exe
    4. *Multiple choice: User-mode service
    5. *Multiple choice: Server-mode service
    6. MS Internet Information Server (IIS)
    7. *Multiple choice: user pc
    8. Client
    9. System Call
    10. Baselining
    11. thread
    12. 32 process priority levels 
    Level 5:
    Windows)_Process_Basics(5)
    1. Autoruns
    2. Process Explorer
    3. TCPView 
    4. AccessChk
    5. Handle
    6. downloads
    7. C:\users\public\downloads
    8.LoadOrder
    9.MpsSvc
    10.ListDLLs
    Level 10:
    Windows_Hidden_Processes(10)
    1. libmingwex-0.dll
    2. McAfeeFireTray.exe
    3. McAfeeFireTray.exeGet-Itemproperty 'HKLM:\SYSTEM\CurrentControlSet\Services\bam\State\UserSettings\S-1-5-21-1584283910-3275287195-1754958050-1005'
    4. 
    5. GwlkK3sa
    6. StrongBad
    WIN_Process_Sistuational_Awareness
    1.
    2.
    3.
    4. 76aGreX5 | ntdll.dll
    5.
    Windows_Hidden_Processes(10)
    7. 6666
    8.
    9.
#---------------------------------------------------------------------------------------------
# Start_Windows_UAC
    Level 5:
    Windows_UAC_Basics(5)
    1. sigcheck
    2. asInvoker
    3. requireAdministrator
    4. HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
    Level 10:
    Windows_UAC_Basics(10)
    5. asInvoker
    6. 
    
    7.
    
    8.
#---------------------------------------------------------------------------------------------
# Windows_Services
    Level 5:Monitoring
    Windows_UAC_Basics(5)
    1. sc querylast five characters 
    2. sc queryex type=service state=all
    3. Get-Service
    4. HKLM\System\CurrentControlSet\Services
    5. parameters
    Level 10:
    Windows_UAC_Basics(10)
    6.
    > get-services
    >  get-service Totally-Legit | Format-list *
        Anwser: Legit
    7. 
#---------------------------------------------------------------------------------------------
# Linux_Process_Validity
    Level 5:How many severity codes are defined in the standard that defines syslog?


    Linux_Processes(5)
    1. 1
    Level 10:
    Linux_Processes(10)
    2.
    $ htop
        - sort by ppid
        - count
    answer: 24
    #count
    3.
    $ ps -elf | grep ntpd
    answer: -p /var/run/ntpd.pid -g -u 105:109
    4.
    $ ps -elf | grep bash
        Grab the PID for the Parent Process(PPID) 
    $ ps -elf | grep <PPID>
        match IDs
      answer: sshd
    5.
    $ sudo lsof | grep cron | sort
    $ ls -l /run/crond.pid
    6.
    $ sudo lsof | grep cron | sort
    $ ls -l /run/crond.pid
    7.
    $ htop
    Aragorn,BruceWayne,Eowyn,Tolkien
    8.How many severity codes are defined in the standard that defines syslog?


    $ htop
    bin/funk
    9.
    $ htop
    /bin/netcat -lp 9999
    Linux_Process_Proc_Dir
    1.
    $ ps -elf | grep sshd
    $ ls -l /proc/1904
        answer: /proc/1904/exe,/usr/sbin/sshd
    2.
    $ sudo lsof | grep UDP 
        answer: ntp,17,u
    Level 15:
    Linux_Processes(15)
    10.
    Linux_Process_Proc_Dir(15)
    3. and in the darkness bind them
    Linux_Process_Find_Evil(15)
    1. find / -name *chant*
        sudo lsof | grep chant
        #output
        offering  17496           Balrog    9w      REG              254,1        0     142174                 
        /home/Balrog/chantlock
        netcat    17538           Balrog    9w      REG              254,1        0     142174                              /home/Balrog/chantlock
        sudo lsof | grep offering
        sudo cat /home/The_Eye/chant
        #output
        Mausan ukoul for avhe mubullat goth
        htop
        # to find /home/witch_king
        ls -l /home/witch_king
        cat /home/witch_king/camlindon
        #output
        #!/bin/bash
        (
         flock -n 9 || exit 1
         echo "beaconing"
         for i in $(seq 1 5); do nc -lw10 127.0.0.1 -p 1234 2>/dev/null  ; sleep 10; done
         echo "done beaconing"
        ) 9>/tmp/mylockfile
        
            Anwser: Mausan ukoul for avhe mubullat goth,witch_king,127.0.0.1:1234

    2.  
    
    3. 
        systemctl
        whatischaos.service
        ls -l /lib/systemd/system | grep chaos
        cat /lib/systemd/system/whatischaos.service
        cat /lib/systemd/system/whatischaos.timer
            Anwser: netcat -lp 3389 < /tmp/NMAP_all_hosts.txt,whatischaos.timer
    4.    
        $ htop
        $ /bin/apache3 -lp 443
        $ find / -name *apache3* | grep apache3
        $ cat /lib/systemd/system/apache3.service
            Anwser: DOS,/bin/apache3 -lp 443 < /dev/urandom

    5.
        $ ls -la
        $ cat .bash_logout
            Awnser: /home/garviel/.bash_logout,12.54.37.8:12000

#-------------------------------------------------------------------------------------------        -How many severity codes are defined in the standard that defines syslog?


# Windows_Auditing_and_Logging
    Level 1:
    Primer_Auditing(1)
    1. Monitoring
    2. Auditing
    3. WinEvt\Logs\System.evtx
    4. Security
    5. SYSTEM
    6. SACL
    7. HKLM\SECURITY\Policy\PolAdtEv
    8. PsLogList
    Level 5:
    Windows_Browser_Artifacts(5)
    1. Strings
    Windows_Recent_Files(5)
    1. HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs
    Windows_BAM(5)
    1. 1803
    Last_Access(5)
    _. 
    > (Get-Item "C:\Windows\System32\drivers\etc\hosts").LastAccessTime
            Output - Wednesday, August 14, 2024 12:11:09 PM
        Answer : 08/14/2024
    Prefetch(5)
    1. C:\Windows\Prefetch
    Recycle_Bin(5)
    1. $R
    2. $I
    UsserAssist(5)
    1. CEBFF5CD
    2. ROT13
    Logs(5)google
    1. Security
    2. System
    3. -wrap
    Level 10:
    Browser_Artifacts(10)How many severity codes are defined in the standard that defines syslog?


    2.
      > get-content 'C:\users\student\AppData\Local\Google\Chrome\User Data\Default\History'
      Answer: https://www.exploit-db.com
    Recent_Files(10)
    2.
    > reg query hkcu\software\microsoft\windows\currentversion\explorer\recentdocs
    > get-item 'Registry::\HKEY_USERS\*\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.*'
        - [System.Text.Encoding]::Unicode.GetString((gp "REGISTRY::HKEY_USERS\*\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.txt")."6")
            Anwser: Flag, Found A.
    BAM(10)
    2.
    > Get-Item HKLM:\SYSTEM\CurrentControlSet\Services\bam\UserSettings\*
        Aswer: C:\Windows\Temp\bad_intentions.exe 
    Prefetch(10)
    2.
    > get-childitem -Path 'C:\Windows\Prefetch' -ErrorAction Continue
        Anwsers: DARK_FORCES-8F2869FC.pf
    3. 2/23/2022
    Recycle_Bin(10)
    3. 
    > Get-Childitem 'C:\$RECYCLE.BIN' -Recurse -Verbose -Force | select FullName
    > get-content 'C:\$RECYCLE.BIN\S-1-5-21-2881336348-3190591231-4063445930-1003\$RZDAQ4U.txt'
        Anwser: $RZDAQ4U.txt,DontTrashMeyo
    Jump_Lists(10)
    _.
    > Get-ItemProperty -Path "C:\Users\<Username>\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations\*" | Select-Object Name, LastWriteTime
    Level 15:
    Logs(15)
    4.
#---------------------------------------------------------------------------------------------
# Linux_Auditing_and_Logging
    Level 5:
    XML(5)
    1. scaninfo
    2. protocol="tcp"
    Standards(5)
    1. 5424
    2. 4-(security/authorization messages)
    3. 8(sevirity 0-7)
    4. 0(system unusable, "instability messages", )
    Syslog(5)
    1. kern
    2. 8(priorities)
    3. (line 10) 4.4 -/var/log/4min.log
        -(0,1,2,3,4)
        Answer: Emergency,Alert,Critical,Error,Warning 
    4. (line 11)4.!4 -/var/log/4sig.log
        -(5,6,7) 
        Answer:  Notice,Informational,Debug 
    5. (line 12)2,9,12.=5 /var/log/not.log
        -(mail system{2},clock daemon{9},ntp subsystem{12},notice{.=15})
        Answer: mail,clock,ntp,notice    
    6. auth,authpriv,8,10.30.0.1
    7. Yes
    8. 0,7,UDP
    Level 10:
    XML(10)
    3. 
    $ xpath -q -e '//host/address/@addr' output.xml | md5sum
        Anwser: 0e850f14fc192c5105955ec094287bd2
    4.
    $ xpath -q -e '//host/address/@addr | //host/ports/port/@portid' output.xml | md5sum
        Anwser: ff7990139b6d09aa65afb6e069db0dec
    JSON(10)
    1.
    $ cat conn.log | jq .
    $ cat conn.log | jq . | md5sum
        Anwser: 25ebedf7442e470eaaa48b5f7d5b96f4
    2.
    
    3.
        cat conn.log | jq 'select(.resp_bytes >= 40).ts' | wc -l
            Anwser: 177
    Syslog(10)
    9. 7
    10. 10.24.0.1
    WHUT(10)
    1.
    2.
    3.
    Level 15:
    XML(15)
    5.
    WHUT(15)
    4.
    5.

    # Oof. Long Day.
#---------------------------------------------------------------------------------------------
# Windows_Analysis
    Level 1:
    Primer_Networking
    1. NDIS
    2. netstat -r
    3. Well Known Ports
    4. Ephemeral ports
    5. Name Resolution
    6. DNS
    Primer_Security
    1. SID
    2. /user
    3. 1000
    4. 500
    5. 
    6.
    7. Backup
    8. faster
    9. Descriptors
    10. DACL 
    11. Get-acl
    12. Net localgroup
    13. icacls
    14. DEP
    15. ASLR
    16. shim
    17. Credential Guard
    18. Windows Defender
    19. SEHOP
    20. 
    21. Windows Resource Protection
    22. /scannow
    23. \WinSxS\Backup
    Primer_Networking
    7. nslookup
    8. System32\drivers\etc\hosts
    9. DNS
    10. nbtstat
    Primer_Surveys
    1. Red
    2. Blue
    3. Incident response
    Level 5:
    Windows_Memory_Analysis_Plugin
    1.
    2.
    3.
    Windows_Memory_Analysis_Basics
    1. imageinfo
    2. -h
    Windows_Volitility_Data
    _. Registers, Cache
    Level 10:
    Windows_Memory_Analysis_Basics
    3. cmdscan
    4. WinXPSP2x86
    Windows_Malware
    1. sc query malware
    >
    2. 1a498b8
     >
    3. 
    > Set-MpPreference -ExclusionPath 'C:\Users\andy.dwyer\Desktop\Memory_Analysis\'
    > cd C:\Users\andy.dwyer\Desktop\Memory_Analysis
    > .\volatility_2.6_win64_standalone.exe -f ".\0zapftis.vmem" --profile=WinXPSP2x86 procdump -p 544 -D .
    > Get-FileHash -Algorithm md5 .\executable.544.exe
        Answer: 6CEE14703054E226E87A963372F767AA
    4.
    > .\volatility_2.6_win64_standalone.exe -f ".\0zapftis.vmem" --profile=WinXPSP2x86 connscan
        Anwser: 172.16.98.1:6666
#---------------------------------------------------------------------------------------------
# Windows_active_Directory
    Level 1:
    Active_Directory(1)
    1. Active Directory
    2. Objects 
    3. schema
    4. LDAP
    5. Administrator
    6. Disable
    7. Get-ADUser
    8. DS
    Level 5:
    Active_Directory_Basics(5)
    1. 21-1004336348-1177238915-682003330
    2. Get-ADGroup
    3. Get-ADUser -filter *
    4. Search-ADAccount
    Level 10:
    AD_Search_Accounts(5)
    _.
    > Get-ADUser -Filter {Enabled -eq $true} -Properties AccountExpirationDate | Where-Object {$_.AccountExpirationDate -lt (get-date) -and $_.Enabled -ne $null} | select-object GivenName
        Awnser: Krause,Page
    AD_Search_Emails(5)
    _.
    > get-aduser -filter * -properties EmailAddress | where-object {$_.emailaddress -notlike "*mail.mil"} | select-object EmailAddress
        Awnswer: CharlieB@ashleymadison.com
                 Skyler01@ashleymadison.com
    AD_Seach_Files(10)
    _.
    > get-childitem -force -recurse -erroraction SilentlyContinue | select Mode, LastWriteTime, Fullname
        Answer: lulz.pdf
    AD_Search_Insider(10)
    1.last five characters 
    > net use * "\\file-server\warrior share"
        Answer: 14287.pdf
    2.
    > Get-ADUser -Filter * -Properties telephoneNumber | where-object {$_.telephoneNumber -like "*336-6754"}
    Answer: Karen.Nance
    AD_Search_Naming(10)
    _.
    > Get-ADUser -Filter * -Properties Description | select Description
    > Get-ADUser -Filter * -Properties Description | where-object {$_.Description -notlike "*PLT Soldier"} | select-object Description
    > Get-ADUser -Filter * -Properties Description | where-object {$_.Description -like "*description"}
        Answer: Ibarra,Lee
    AD_Search_Passwords(10)
    _.
    AD_Search_PII(10)
    _.
    > get-childitem -force -recurse -erroraction SilentlyContinue | select Mode, LastWriteTime, Fullname
        Answer: phone_matrix.xlsx
    Active_Directory_Basics
    5.
    > get-addomaincontroller -filter *
        answer: army
    6.
    > Get-ADUser -Filter * -Properties * | where-object {$_.name -like "*krbtgt"}
        Answer: 502
    7.
    8.
    Level 15:
    AD_Follow_Insider_Trail(15)
    1.
    2.
    3.
    4.
