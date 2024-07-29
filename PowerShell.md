Student Guide:
https://cted.cybbh.io/tech-college/pns/public/pns/latest/guides/ps_sg.html

Good URLs:
https://www.red-gate.com/simple-talk/sysadmin/powershell/when-to-qoute-in-powershell/


# Date 07/26
  - objectives
![img_8214.jpg](https://github.com/user-attachments/assets/aa39370b-d107-4e8a-9326-4496d911012e)


# Getting Help (Asking for help via supported CLI inputs:)
    - PWSH: Get-Help(Displays help)
    - BASH: man(Same as Get-Help)
    - CMD: cmd /c help(Display cmd commands)
  ### Cmdlet syntax:
    - (indicates a parameter)
    <> (Indicates Arguments)
    [] (Argument accepts multiple values)


# Aliases
    - Get-Alias (display full list of alaises)
    - Set-Alias (Creates a new alias)
    - del alais (Deletes the alias)
  

# Variables
    $False (False)
    $True (True)
    $Null (Empty value)
    $$ (Last Token used)
    $? (Execution status of last operation)
    $^ (First token in last line recieved)
    $_ or $PSItem (Object in current pipeline)
    $ Args (Array of undeclared parameters and/or values)
    $ Error (Most recent error)
    $ Home (full path of user's home directory)
    $ Host (Current host application)
    $Input (Enumerator that enumertes all input to a function)
    $LastExitCode (exit code of the last Windows-based program that was run)
    $Matches (Hash Table of RegEx matches)
    $PID (PID of current PS session)
    $Profile (Full path of current user and host application)
    $PSVersionTable (Details about Windows PowerShell)
    $PSHome (the full path of the installation directory for Powershell)
    $Pwd (Full path of current directory)
    

# Data Types
    - [string] (Fixed-length string of unicode characters)
    - [char] (16-bit unicode character)
    - [byte] (8-bit unsigned character)
    - [int] (32-bit signed integer)
    - [long] (64-bit signed integer) 
    - [single] (32-bit floating point number)
    - [double] (64-bit floating point number)
    - [datetime] (Date and Time)
    - [array] (array of values)
  ### Getting Data Types
    Command:                        Result:
    ------------------------------------------------------------------------------------------------------------------------------------------------------------
    ("Hello").gettype().name        String
    (77.564).gettype().name         Double
    (0xFF).gettype().name           Int32
  ### Casting
    Command:            Result:
    ------------------------------------------------------------------------------------------------------------------------------------------------------------
    [int](5.5)          6
    [float](5.5)        5.5
    [int](0xFF)         255
*Note:
  0xFF is hexadecimal for 255


# Arrays
  ## Arrays
      $myarray = 'Hello' , 12, (Get-Date), $true, 77.65
      $myarray.count  5
      $myarray[0]  Hello
      $myarray[-1]  77.65
      $myarray += 'new elemant'
  ### Mutlidimensional Arrays
    $multiarray = @((1,2,3,4),(5,6,7,8))
    $multiarray[0][1]  2
    $multiarray[1][3] 8
    $nonjaggedarray = New-Object "int32[,]"  2,4
    $nonjaggedarray = 2
    $nonjaggedarray = 8
    $nonjaggedarray    2
    $nonjaggedarray    8
    $multiarray = @(); $multiarray += , @(1,2,3)

    
# The Pipeline
    Cmdlet:               Description:
    ------------------------------------------------------------------------------------------------------------------------------------------------------------
    Compare-Object      Compares two objects and marks their differences          
    ConvertTo-Html      Converts object into HTML
    Export-Csv          Saves object in a csv file
    ForEach-Object      Returns each pipeline object one after the other  
    Format-list         Outputs results as a list
    Format-Table        Outputs resultas as a table
    Format-Wide         Outputs results in several columns
    Get-Unique          Removes duplicates from a list of values
    Group-Object        Groups results according to a criterion
    Measure-Object      Calculates the statistical frequency distribution of object values or texts
    Out-File            Writes results to a file
    Out-Host            Outputs results in the console
    Out-Null            Deletes results
    Out-String          Converts Converts results to plain text
    Select-String       Filters properties of an object and limits number of results as requested
    Sort-Object         Sorts results
    Tee-Object          Copies the pipeline's contents and saves it to a file or a variable
    Where-Object        Filters results according to a criterion
  ### Pipeline Examples
    gci * .txt | ?{$_.length -lt 100} | ft name
    ps | ft PSResources
    ps | gm -Membertype PropertySet
    gs | Group Status
    gci | Sort Length, Name -descending
    gs | ?{$_.status -eq "Running"}
    gci | Sort Length -descending | Select -first 5
    ps | Sort StartTine | Select -first 5 | ft ProcessName, StartTime
    1,2,3,1,2,3,1,2,3,1,2,3 | Sort | Get-Unique
    gci | Measure-Object Lentgh
    gcm -Type Cmdlet | %{$_.Parameters} | %{$_.Keys} | group -NoElement | Sort Count, Name -Descending | Select -Skip 11 | ?{$_.Count -gt 1} | Out_Grindview
      
    
# Comparison Operators
    Operator:      Description:
    ------------------------------------------------------------------------------------------------------------------------------------------------------------
        -eq            Equals
        -ne            Not Equal
        -gt            Greater Than
        -lt            Less Than
        -ge            Greater Than or Equal To
        -le            Less Than or Equal To
        -contains      Contains (used for a collection of items)
        -match         Matches anywhere in the string
        -like          Both sides of expression are identical
        -in            Returns true when value is contained within a collection
        -replace       Replaces a string pattern
        -is            Returns true if both objects are the same type


# Loops
  ### While Loop
    $x = 0
    while($x -lt 10) {
      Write-Host $x
      $x++
    {
  
  ### Do While
    $x = 0
    Do {
      Write-Host $x
      $x++
      }while ($x -lt 10)
  
  ### Do Until Loop
    $x = 0
    Do {
      Write-Host $x
      $x++
      }until ($x -gt 10)
  
  ### ForEach Loop
    $teams = "Lions", "Tigers", "Red Wings", "Pistons"
    ForEach($team in $teams){
    $team.insert(0, "Detroit ")
    }
  
  ### ForEach-Object
    gci | % -process {$_/Length / 1024}


# Conditional Statements
  ### If/Else
    $x = 6
    if (4x -le 5) {
      Write-Host "Less than 5"
    } else {
      Write-Host "Greater than 5"
  ### If/Elseif/Else
    $x =5
    if ($x -lt 5) {
      Write-host "Less than 5"
    } elseif ($x -eq 5) {
      Write-host "It is 5"
    } else {
      Write-Host "Greater then 5"
    }
  ### Switch
    $time = 12
    Switch($time) {
    6 {"Morning"; break}
    12 {"Noon"; break}
    18 {"Evening"; break}
    22 {"Night"; break}
    }

  
# Flow Control
  ### Break
    $x = 0
    while($x -lt 10) {
    $x += 1
    if($x -eq 5) {break}
    Write-Output $x
    }
  ### Continue
    $x = 0
    while ($x -lt 10) {
    $x += 1
    if ($x -eq 5) {continue}
    Write-Output $x
    }
  

# RegEx
  Escape Sequence:    Special Characters:
  --------------------------------------------------------------------------------------------------------------------------------------------------------------
        `n              New Line
        `t              Tabulator
        `b              Backspace
        `'              Single Quotation Mark
        `"              Double Quotation Mark
        `0              Null
        ``              Backtick Character
  
  
  Placeholder:        Description:
  --------------------------------------------------------------------------------------------------------------------------------------------------------------
          .            Any character except newline            
          [^abc]       All characters except one specified 
          [a-z]        All characters except one in range specified
          [abc]        One of the characters
          [a-z]        One of the characters in range
          \d           Any number [0-9]
          \D           Any non-number
          \n           Line breaker
          \r           Carriage return
          \s           Any whitespace(space,tab,newline)
          \S           Any non-whitespace
          \t           tab
          \w           Letter, number or underline
          W            Non-letter, number, or underline
  Quantifer:          Description:
  --------------------------------------------------------------------------------------------------------------------------------------------------------------
          *            Any                
          ?            None or one occurance
         {n,}          At least n occurances
         {n,m}         At least n occurances, maximum m occurnaces
         {n}           Exactly n occurnaces
          +            One or many occurances
  Anchor:             Description:
  --------------------------------------------------------------------------------------------------------------------------------------------------------------
          $            End of text
          ^            Start of Text
          \b           Word boundary
          \B           No word boundary
          \G           After last match 


# String Operators
  Operator:       Definition:
----------------------------------------------------------------------------------------------------------------------------------------------------------------
      -f          Format String Expression
      -replace    replaces strings
      -split      Splits a string
      -join       Joins multiple strings


# String Methods
  Method:          Definition:
  --------------------------------------------------------------------------------------------------------------------------------------------------------------
    .Split()        splits strings
    .Replace()      replaces strings
    .StartsWith()   Detrmines weather this string instance starts with the specified character
    .EndsWith       Determines wether the end of this string instance matches the specified character
    .ToLower()      Convert string to lower case
    .ToUpper        Convert String to upper case
      

# Functions
  ### Basic Function
      functon get-sum($num1, $num2){
        $num1 + $num2
      }
      get-sum 5 5
  ### Function with Optional Parameters
      function get-test {
      param($param1='some value',$param2='some value')
      "The value $param1 and $param2 are parameters"
  ### Function with Mandatory Parameters
      function get-test {
        param(
          [Parameter(Mandatory=$true)]
          $name
          )
          "Hello, $name"
      }
  ### Function with Help Message
      function get-test {
        param(
          [Parameter(Mandatory=$true, HelpMessage='Enter your name')]
          $name
          )
          "Hello, $name"
      }
  ### Function with Strongly-Typed Mandatory Parameters
      function get-conversion
        [parameter(Mandatory-$True, HelpMessage='Enter weight')]
        [double]
        $pounds
        )
        $kilos = $pounds * (1/2.2)
        $kilos
  ### Function with Switch Parameter
      function get-switch
        param(
        [Switch]
        $special
        )
        if ($special) {
          'This is the switch'
        } else {
          'This is not the switch'
        }
      }
   ### Advanced Function
      function Get-compinfo {
      [CmdletBinding()]
      BEGIN {
        $name = $env:COMPUTERNAME
      }
      PROCESS {
        Write-Verbose -Message "$name"
        $system = gwmi -class Win32_computerSystem -ComputerName $name
        $os = gwmi -class Win32_OperationSystem -ComputerName $name
        $bios = gwmi -class win32_BIOS -ComputerName $name
        $properties = @{
          ComputerName = $name
          Model
          OS
          SerialNumber
        }
      }
      End {
        New-Object -TypeName PSobject -Property $properties
      }
    }
  ### Filter
      filter namedthis {
        if ($_.name -match "file.txt") {$_}
      }
      gci | gc | ?{$_ | namedthis}


# Date: 07/29

get-ChildItem -path C:\Windows -filter *.exe -recurse -name

From Ubuntu terminal:
   $ xfreerdp /u:student /v:10.50.39.134 -dynamic-resolution +glyph-cache +clipboard
  * Find Cmdlets

  ## Excercises 
    1.Ensure that you have the latest copy of help by updating your help system.
      > update-help
    2.Which cmdlets deal with the viewing/manipulating of processes?
      > get-process or show-process or get-command -noun process get-help *process*
    3.Display a list of services installed on your local computer.
      > Get-Service or get-help *service*
    4.What cmdlets are used to write or output objects or text to the screen?
      > get-help *write*
      > Write-Host 
    5.What cmdlets can be used to create, modify, list, and delete variables?
      > get-help -noun variable
      > get-command -noun variable
    6.What cmdlet can be used, other than Get-Help, to find and list other cmdlets?
      > get-command 
    7.Find the cmdlet that is used to prompt the user for input.
      > read-host
        
      * Exercise Running Cmdlets
    
    1.Display a list of running processes.
       > get-process 
    
    2. Display a list of all running processes that start with the letter "s".
       > get-process -name s*
    
    3. Find the cmdlet and its purpose for the following aliases:
       gal alias= 
       > Get-Alias 
       dir alias=
       > Get-ChildItem
       echo alias=
       > Write-Output
       ? alias=
       > Where-Object
       % alias=
       > ForEach-Object
       ft alias=
       > Format-Table
    
    5. Display a list of Windows Firewall Rules.
       > Get-NetFirewallRule 
    
    6. Create a new alias called "gh" for the cmdlet "Get-Help"
       > New-Alias -name "gh" get-help

> Get-ChildItem or gci
  same as dir or ls

$cols =@{Label="KB"; Expression = { [int] ($_./Length/1KB) }}
Get-ChildItem _ Format-Table name, $cols

# Variables
1. Create a variable called "var1" that holds a random number between 25-50.
   *> $var1 = get-random -minimum 25 -maximum 50
2. Create a variable called "var2" that holds a random number between 1-10.
  *> $var2 = get-random -minimum 1 -maximum 10
3. Create a variable called "sum" that holds the sum of var1 and var2.
  *> $sum = $var1 + $var2
4. Create a variable called "sub" that holds the difference of var1 and var2.
  *> $sub = $var1 - $var2
5. Create a variable called "prod" that holds the product of var1 and var2.
  *> $prod = $var1 * $var2
6. Create a variable called "quo" that holds the quotient of var1 and var2.
  *> $quo = $var1 / $ var2
7. Replace the variables in text with their values in the following format:
   "var1" + "var2" = "sum"
        > "$var1 + $var2 = $sum"
        {0} + {1} = {2}" -f $var1, $var2, $sum
9. Replace the variables in text with their values in the following format:
   "var1" - "var2" = "sub"
        >"$var1 + $var2 = $sum"
        {0} + {1} = {2}" -f $var1, $var2, $sum
10. Replace the variables in text with their values in the following format:
   "var1" * "var2" = "prod"
        >"$var1 + $var2 = $prod"
        {0} * {1} = {2}" -f $var1, $var2, $prod
11. Replace the variables in text with their values in the following format:
  "var1" / "var2" = "quo"
        >"$var1 + $var2 = $quo"
        {0} / {1} = {2}" -f $var1, $var2, $quo

  # You can highlight lines of code and press F8, which will run that specified line of code

# Reverse Array
$revarray = -3..15:3
$reverse = $revarray[($revarray.length-1)..0]
$reverse 
