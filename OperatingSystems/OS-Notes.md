Operating Systems discussed: Linux & Windows

Test is open Internet

This command will login to our linops as student:
# 10.50.27.61(linux/lin-ops) 10.50.39.134(Windows/)
# command: terminator (opens a terminal that allows you to split screens)
## SSH Command ##
'ssh student@10.50.27.61 -X'

CTF URL:
http://10.50.22.197:8000/

Student Guide:
https://os.cybbh.io/public/os/latest/index.html

Need a 70% 

admin_station: (Stack Number 1) 10.50.40.106
  
    *andy.dwyer
    *BurtMacklinFBI

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
