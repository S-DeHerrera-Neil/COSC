#### Prompt in CTFD
Gorgas Reverse Engineering (GRE)
XX Sep 2025
Start Time: 1300
Duration: 4 hours

Type of Operation: DEVOPS

Objective: Intel has identified that the Donovian_Webserver (192.168.28.111) is hosting binaries via port 80 at the following URI /longTermStorage. 
We have been tasked with pulling the binaries back into blue space to conduct Reverse Enineering operations. Conduct Reverse Engineering (disassemble, debug) on collected files, determine functionality and methods to successfully execute files.

Tools/Techniques: Ghidra, IDA, and GDB.

Scenario Credentials: FLAG = R3V3R535t@rt0F@ct1v1ty

Prior Approvals:All files can be extracted from the known target "Donovian-Webserver". Only authorized to conduct task on Analyst Workstations.

```
T1 "conference.site.donovia"
Hostname: web.site.donovia
IP: 192.168.28.111
OS: Apache/2.4.29 (Ubuntu) Server 
Creds: comrade::StudentWebExploitPassword
HTTP Ports: 80, 8080
  - http-enum:
  /css/: Potentially interesting directory w/ listing on 'apache/2.4.29 (ubuntu)'
  /images/: Potentially interesting directory w/ listing on 'apache/2.4.29 (ubuntu)'
  /sites/: Potentially interesting folder
Last Known SSH Port: 2222
PSP: Unknown
Malware: Unknown
Action: Extract approved binaries under directory titled "longTermStorage".
```
# Action: Extract approved binaries under directory titled "longTermStorage".
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#### Question in CTFD
Entry.exe
5
Level II Challenge

Situation:
Various teams have extracted binaries from Donovian development networks. Analyze the given binaries to find weaknesses and create signatures.

Provided:
compiled executable: (entry.exe)
source code: (entry.c)
Task: Run the executable with expected input and retrieve success message.
Method: disassemble the executable and follow the program’s execution to discover its functionality, and expected input.

Ensure that before you move on from this challenge that you have fully understood what you have done to disassemble and reverse engineer this binary and how it is related to the provided source code.

What is the key for this binary?
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# On lin-ops

## Recon the device:
```
proxychains nmap 192.168.28.111
```
#### results:
```
Nmap scan report for 192.168.28.111
Host is up (0.00051s latency).
Not shown: 997 closed ports
PORT     STATE SERVICE
80/tcp   open  http
2222/tcp open  EtherNetIP-1
8080/tcp open  http-proxy

Nmap done: 1 IP address (1 host up) scanned in 0.71 seconds
```
```
proxychains nc 192.168.28.111 80
proxychains nc 192.168.28.111 8080
proxychains nc 192.168.28.111 2222
```

#### results:

```
proxychains nmap --script http-enum 192.168.28.111
```
#### results:
```
Nmap scan report for 192.168.28.111
Host is up (0.00059s latency).
Not shown: 997 closed ports
PORT     STATE SERVICE
80/tcp   open  http
| http-enum: 
|   /css/: Potentially interesting directory w/ listing on 'apache/2.4.29 (ubuntu)'
|   /images/: Potentially interesting directory w/ listing on 'apache/2.4.29 (ubuntu)'
|_  /sites/: Potentially interesting folder
2222/tcp open  EtherNetIP-1
8080/tcp open  http-proxy
| http-enum: 
|   /css/: Potentially interesting directory w/ listing on 'apache/2.4.29 (ubuntu)'
|   /images/: Potentially interesting directory w/ listing on 'apache/2.4.29 (ubuntu)'
|_  /js/: Potentially interesting directory w/ listing on 'apache/2.4.29 (ubuntu)'

Nmap done: 1 IP address (1 host up) scanned in 2.15 seconds
```

```
proxychains nikto v -h 192.168.28.111
```
#### results:
```
+ OSVDB-3233: /icons/README: Apache default file found.
-----------------------------------------------------------
```
```
ssh -S /tmp/jump jump -O forward -L 127.0.0.1:1111:192.168.28.111:80
```
```
firefox
```
# JUST wget the file ^

```
 proxychains wget -r http://192.168.28.111/longTermStorage
```

* then scp to your windows device

```
scp entry.exe entry.c student@10.50.39.134:C:/users/student
```
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# On win-ops



