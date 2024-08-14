Operating Systems discussed: Linux & Windows

Test is open Internet

This command will login to our linops as student:
# 10.50.27.61(linux/lin-ops) 10.50.39.134(Windows/)
# command: terminator (opens a terminal that allows you to split screens)

## command to run OpenVPN via debian CLI
    - no path in the command because it is being run from the directory that the configration file is currently in.
'''
syntax sudo <VPN> <configuration file path,> 
$ sudo openvpn config.ovpn
'''
## SSH Command ##
'ssh student@10.50.27.61 -X'

CTF URL:
http://10.50.22.197:8000/

Student Guide:
https://os.cybbh.io/public/os/latest/index.html

Need a 70% 

admin_station: (Stack Number 1) 10.50.40.106
  
    *User:
    andy.dwyer
    *Pass:
    BurtMacklinFBI

To access any of the workstations on the network map, you need to use the admin_station.

# Powershell profiles(saves enviromental variables)
  saves in 4 places:
    
    1.All Users, All Hosts            $PsHome\Profile.ps1
    2.All Users, Currnet Host         $PsHome\Microsoft.PowerShell_profile.ps1
    3.Current User, All Hosts         $Home\[My]Documents\Profile.ps1
    4.Current User, Current Host      $Home\[My ]Documents\WindowsPowerShell\Profile.ps1

#--------------------------------------------------------------------------------------------------

# Failure to RDP via Rasberry Pi (Debian)

      sudo xfreerdp /u:andy.dwyer /v:10.50.40.106 /dynamic-resolution +glyph-cache +clipboard
    [19:33:37:238] [2949:2950] [INFO][com.freerdp.core] - freerdp_connect:freerdp_set_last_error_ex resetting error state
    [19:33:37:238] [2949:2950] [INFO][com.freerdp.client.common.cmdline] - loading channelEx rdpdr
    [19:33:37:238] [2949:2950] [INFO][com.freerdp.client.common.cmdline] - loading channelEx rdpsnd
    [19:33:37:238] [2949:2950] [INFO][com.freerdp.client.common.cmdline] - loading channelEx cliprdr
    [19:33:37:238] [2949:2950] [INFO][com.freerdp.client.common.cmdline] - loading channelEx drdynvc
    [19:33:37:449] [2949:2950] [INFO][com.freerdp.primitives] - primitives autodetect, using generic
    [19:33:37:455] [2949:2950] [INFO][com.freerdp.core] - freerdp_tcp_is_hostname_resolvable:freerdp_set_last_error_ex resetting error state
    [19:33:37:456] [2949:2950] [INFO][com.freerdp.core] - freerdp_tcp_connect:freerdp_set_last_error_ex resetting error state
    [19:33:52:471] [2949:2950] [ERROR][com.freerdp.core] - freerdp_tcp_connect:freerdp_set_last_error_ex ERRCONNECT_CONNECT_FAILED [0x00020006]
    [19:33:52:471] [2949:2950] [ERROR][com.freerdp.core] - failed to connect to 10.50.40.106
#------------------------------------------------------------------------------------------------------------------------------------------------

# Failure to connect to the CTFs via Chromium/Firefox

# Firefox
    The connection has timed out
    
    The server at 10.50.22.197 is taking too long to respond.
    
        The site could be temporarily unavailable or too busy. Try again in a few moments.
        If you are unable to load any pages, check your computer’s network connection.
        If your computer or network is protected by a firewall or proxy, make sure that Firefox is permitted to access the web.
    
                                                                                                   [Try Again]
 # Chromium                                                                                               

    This site can’t be reached10.50.22.197 took too long to respond.
    Try:
    
    Checking the connection
    Checking the proxy and the firewall
    ERR_CONNECTION_TIMED_OUT
    
    (Details)                              (Reload)
#--------------------------------------------------------------------------------------------------------------------------------------------


# Day 2 (Date 08/06/2024)

Registry Hive Keys: HKLM, HKU, HKCU
Less Important Registry Hive Keys: HKCC, HKCR
  
    *Command in PWSh to disable Microsoft Defender:
    Set-MpPreference -DisableRealtimeMonitoring $TRUE

    *Command to run the End User License Agreement:
    Type *autoruns -accepteula*

    *Adding an alternate Data Stream (ADS) to a file will not affect the Hash of a file. 

# Day 3 (Date 08/07/2024)

Sticky bit can be set, only the owning user/group can modify the file.

    grep -R '<string>' :(greping recursively)
    awk :(allows you to reformat or select selections of text based on delimiters)
    sed :(allows you to edit strings(s) in text)
    
# Day 4 (Date 08/08/2024)

      * winload.efi (UEFI)
      * winload.exe (BIOS)

      * How to tell if your machine is running BIOS or UEFI
    findstr /C:"Detected boot environment" "C:\Windows\Panther\Setupact.log"
    Get-Content C:\Windows\Panther\Setupact.log | Select-String "Detected boot     
    environment"

    * bcedit command to see if machine is running BIOS or UEFI
    bcdedit | findstr /i winload

    * checking the GUI
    Msinfo32.exe

  # Day 4 (Date 08/09/2024)
  
              BIOS        UEFI
              MBR^        ^GPT
            grub^          ^grub.efi
                Linux Kernel
                    Init
            SysV Init^  ^Systemd Init
                  
# First Stage Boot loaders
    MBR 512 bytes
      55 aa(magic number, if it is not 55 aa something is wrong)
    GPT Partition Table is not in the first 512 bytes *redundancy

VDA (Virtual Drive)
SDA (Sata Device)

0-9a-f(hex) 0x0-0xF

MBR 6 partitions. Has dependencies
Locate the hard drive and partition in Linux
lsblk
Examining the contents of the MBR with xxd
sudo xxd -l 512 -g 1 /dev/vda

Making a copy of the MBR with dd — Run this on Ops Station
dd if=/dev/vda of=MBRcopy bs=512 count=1 

GPT 128 partitions, up to 9 Zettabytes. Doesn't have dependencies.

Linux Kernel (Mololithic)
  Every System goes to the Kernel
  ^Moduals: work directly with the kernel (extensions to base functionality of the Linux Operating System)

# Systemv (loads sequentially)
     -> is a symbolic link.
       $ls -l
    
      If a symbolic link is going anywhere but init.d/.. NOT good

  # Systemd (loads simultaneously)
    
    Wants & Requires
    Wants(will run w/out, may be degraded)
    Requires(Cannot run w/out)

    /sbin/init/
    /etc/init
    /etc/inittab

    etc/profile
      -interactive shell
      -noninteractive shell
  
    .bash_profile & .bashrc (like PowerShell Profile)
    
Day 5 (Date 08/12/2024)

# Windows Prrocess Validity
- Scheduled Tasks: Good way to establish Persistance.
- Autoruns: can be very helpful
- Base64: ends in an "="
- Repeating/Sequntial ports are suspicious
- What directory are processes running out of?
- Multiple processes with same name
- System proccesses with high PID
-  Windows machine w/ GUI port:3389 RDP

# User Account Control
- Multiple Color-coded consent prompts
- File manifest
- 3 Levels of execution levels in a File's Manifest
  - asInvoker
  - requireAdministrator
  - highestAvailable
- Autoelevate setting
- Sysinternals (suite)
- Procmon (Process Monitor)
- Autoruns
- Procexp (process Explorer)
- TCPView: Allows you to view TCP/UDP connections
- PsExec (): Analyze privileges
- PsLoggedon: Analyze Windows logon using PsLoggedon
- LogonSessions: Shows who is logged on and what thime they're logged on, loggonsessions shows how the user logged on.
- PsList: Analyze Windows processes using PsList on local or remote systems
- PsInfo: Analyze Windows system information using Psinfo
- Strings: Analyze Windows files using Strings
- Handle: Analyze Windows hanfles process using Handle
- 

- ProcMon

Day 6 (Date 08/13/2024)
# Linux Process Validity

  ## Finding Evil is option
ps: Unix/Linux utility for viewing information about running processes
'''
$ ps
'''
top: provides dynamic real-time view of running system
'''
$ top
'''
htop: human friendly variant of top^
'''
$ htop
'''

"deamon's are orphans" - Sgt. landry

2 Primary processes after setup
  - user-space processes /sbin/init(systemv)            (PID=1)
                       or /lib/systemd/systemd(systemd) (PID=1)
  - kernel-space processes [kthreadd] (PID=2)

# Concepts of Virtual Memory
  ### Kernel Space
  ### User Space

 ### UIDs
  100-999(system)
  1000-60000(user)

  EUID(Effective User ID) and RUID(Real User ID) are the same thing

 ### System Calls
  Fork() and Exec()
  - Fork(): Creates a new process by duplicating the calling process
  - Exec(): The kernel starts program, replacing the current process

### Signals (Sending information to a process) 1-30
  * Key Points kill -9 <> or pkill -9 <process name>
Listing the singal variations
'''
$ kill -l
'''
- 1
- ...
- 30

Orphan Process vs Zombie Process
Orphan Process: live, parent process is gone but still requesting resources
Zombie Process: Idle waiting to be terminated. Holds PID.

### Daemons: intentionally orpahaned "all Daemons are orphans, not all orphans are Daemons"
 *** 
  '''
$ man cron
  '''
***
  '''
  ps --ppid 1 -lf
  '''

  ### Job Control (user jobs)
  **
  '''
  fg
  '''
  **
  '''
  $ jobs
  '''
  **
  '''
  $ kill -9 %1
  '''

  ## Cron Jobs
  
