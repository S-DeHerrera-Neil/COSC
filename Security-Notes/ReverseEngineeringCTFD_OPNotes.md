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
--------------------------------------------------------------------------------------------------------------------------------------------------------
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
# On win-ops

## Step1: static anlysis

### Pre-Req's:
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

- In file Explorer map "live.sysinternals.com" to z Drive.   
  - Via powershell
```
cd .\downloads
```
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  * check contents w/ strings
```
  z:\strings.exe .\entry.exe
```
  * validate file type another way.
```
 get-content -First 2 .\demo1_new.exe
```
* use dissassembler
  * search in start menu, for GHIDRA
  - Make a new project
    - File: upper left hand corner
      - New Project: Leave on defualt settings, so just hit next.
      - Name project: I named project "SpicyBoy" for the demo1_new.exe.
      - Open the Project, and click analyze.

      - Top of page:
        - search
          - search for string 
          - search on term you have seen ^ from string analysis "sucess", via filter.
          - When it takes you to the keyword, click on "FUN_" function
            - This will open up the Decompile function.
           
      - In decompile window:
        - Convert the hex value to decimal.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

static analysis:
 - run stings on demo2_new.exe
   - look for keywords: keys, mz, "!This program cannot be run in DOS mode."
   - get-content
   - Open up Ghidra
     - Look at condition that the "sucess" statement. Convert Hex to Decimal.
     - 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

patch the code.
- value of 65664 or 12
```
  if (iVar1 == 0) {
    uVar2 = 65664;
  }
  else {
    uVar2 = 12;
```
For patching go to the other condition in the boolean structure above ^
- click on the other variable, change that value to '65664'
- so that reguardless of the input, you will get a success.
  - export the file, rename, and test. 



* software doing software things 2
* software doing software things 2
No assistance.



