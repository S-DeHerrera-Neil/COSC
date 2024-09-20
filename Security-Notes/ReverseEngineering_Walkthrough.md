
## Step1: static anlysis
- In file Explorer map "live.sysinternals.com" to z Drive.
  - Via powershell
```
cd .\downloads
```
  * check contents w/ strings
```
  z:\strings.exe .\demo_new.exe
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

-----------------------------------------------------------------------------

static analysis:
 - run stings on demo2_new.exe
   - look for keywords: keys, mz, "!This program cannot be run in DOS mode."
   - get-content
   - Open up Ghidra
   - 
