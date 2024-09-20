
## Step1: static anlysis
- In file Explorer map "live.sysinternals.com" to z Drive.
  - Via powershell
  > cd .\downloads
  * check contents w/ strings
  > z:\strings.exe .\demo_new.exe
  * validate file type another way.
  > get-content -First 2 .\demo1_new.exe
  * use dissassembler
  * search in start menu, for GHIDRA
  - Make a new project
    - File: upper left hand corner
      - New Project: Leave on defualt settings, so just hit next.
      - Name project: I named demo1_new.exe "SpicyBoy"
      - 
