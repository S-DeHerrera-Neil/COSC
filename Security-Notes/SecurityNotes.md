## Offensive "Security"
  Techniques are outdated, but focus on the methodology.

### SSgt Dow's note taking process:
```
context
command
output
```

Understand the How?
----------------------------------------------------------------------------------
# Day 1 (20240917)
  


## Environment Information:

### Jumpbox Information:
```
Jump Box Website:
  10.50.36.14/classinfo.html
Username format:
  NEDE-006-M
Stack Number:	  	      	          
  * 6
Username:
  * NEDE-006-M
Password:
  * v0cEcUbwIzY878p
JumpBox:
  * 10.50.37.98
```
### vta instances:
```
  windows_opstation_QiJd (win_ops):
10.50.39.134
  Commands:
xfreerdp /v:10.50.39.134 /u:student /p:password /size:1920x1000 +clipboard
  Credentials:
Username:
  student
Password:
  password

  linux_opstation_QiJd (nix_ops):
10.50.27.61
    Commands:
ssh student@10.50.27.61 -X
  Credentials:
Username:
  student
Password:
  password
```
### CTFD Server:
```
10.50.20.30:8000
  Username:
NEDE-006-M
  Password:
v0cEcUbwIzY878p
```

## Tunnels!!!! is Security's better?
  MS(Master Socket)
```
## set up connection jump box

  lin-ops:
$ ssh -MS /tmp/jump student@10.50.37.98
  password: v0cEcUbwIzY878p
  student@jump:
$ for i in {1..254}; do (ping -c 1 192.168.28.$i | grep "bytes from" &) ; done
  * Copy the IPs that were ping sweeped against.
-

  lin-ops:
$ ssh -S /tmp/jump jump -O forward -D9050
  student@jump:
$ ss -ntlp
  * Port Enumeration
$ proxychains nmap {IPs enumerated}  
  * Port Validation (Interrogation)
$ proxychains nc {IP} {port}
-

      *Port Forward*
  lin-ops:
$ ssh -S /tmp/jump jump -O cancel -D9050
$ ssh -S /tmp/jump jump -O forward -L127.0.0.1:2222:192.168.28.100:80 -L127.0.0.1:3333:192.168.28.100:2222 -L127.0.0.1:5555:[DifferentIP]:DifferentPort
$ ss -ntlp
$ firefox
  * In Firefox URL: 127.0.0.1:2222 ^as specified above *

$ ssh -MS /tmp/tgt1 creds^@127.0.0.1 -p 3333 


```


## Admin Tools:
```

```





--------------------------------------------------------------------------------
