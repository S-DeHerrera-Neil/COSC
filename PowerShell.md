Student Guide:
https://cted.cybbh.io/tech-college/pns/public/pns/latest/guides/ps_sg.html

# Date 07/26
  - objectives
![img_8214.jpg](https://github.com/user-attachments/assets/aa39370b-d107-4e8a-9326-4496d911012e)


# Getting Help (Asking for help via supported CLI inputs:)
    - PWSH: Get-Help(Displays help)
    - BASH: man(Same as Get-Help)
    - CMD: cmd /c help(Display cmd commands)
  ## Cmdlet syntax:
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
  ## Getting Data Types
    Command:                        Result:
    ("Hello").gettype().name        String
    (77.564).gettype().name         Double
    (0xFF).gettype().name           Int32
  ## Casting
    Command:            Result:
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
  ## Mutlidimensional Arrays
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
    Cmdlet:                  Description:
    Compare-Object
    ConvertTo-Html
    Export-Csv
    ForEach-Object
    Format-list
    Format-Table
    Format-Wide
    Get-Unique
    Group-Object
    Measure-Object
    Out-File
    Out-Host
    Out-Null
    Out-String
    Select-String
    Sort-Object
    Tee-Object
    Where-Object

## Pipeline Examples
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
  ## While Loop
  ## Do While
  ## Do Until Loop
  ## ForEach Loop
  ## ForEach-Object


# Conditional Statements
  ## If/Else
  ## If/Elseif/Else
  ## Switch

  
# Flow Control
  ## Break
  ## Continue
  

# RegEx
  Escape Sequence:    Special Characters:
  --------------------------------------------------------------------------------------------------------------------------------------------------------------

  Placeholder:        Description:
  --------------------------------------------------------------------------------------------------------------------------------------------------------------

  Quantifer:          Description:
  --------------------------------------------------------------------------------------------------------------------------------------------------------------

  Anchor:             Description:
  --------------------------------------------------------------------------------------------------------------------------------------------------------------
  

# String Operators
  Operator:       Definition:
----------------------------------------------------------------------------------------------------------------------------------------------------------------


# String Methods
# Functions
