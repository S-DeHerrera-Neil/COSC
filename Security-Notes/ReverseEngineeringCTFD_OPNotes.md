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
T1
Hostname: web.site.donovia
IP: 192.168.28.111
OS: Apache/2.4.29 (Ubuntu) Server 
Creds: comrade::StudentWebExploitPassword
Last Known SSH Port: 2222
PSP: Unknown
Malware: Unknown
Action: Extract approved binaries under directory titled "longTermStorage".
```
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

```
scp student@WinIP:C:/users/student
```

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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

