# Finding Executables
get-ChildItem -path C:\Windows -filter *.exe -recurse -name

# Finding the size of ChildItems
$cols =@{Label="KB"; Expression = { [int] ($_./Length/1KB) }}
Get-ChildItem _ Format-Table name, $cols

# Finding Running Services
get-service | where-object {$_.status -eq "running"}

# Finds stopped services
get-service | where-object {$_.status -eq 'stopped'}

# Write-Host does not send data down the line
# function 
function fruit-host {
Write-Host "Apple"
Write-Host "Orange"
Write-Host "Bannana"
Write-Host "Pear"
}

#
function fruit-Output {
Write-Output "Apple"
Write-Output "Orange"
Write-Output "Bannana"
Write-Output "Pear"
}

fruit-host | sort
fruit-output | sort

#function fruit-Output {
Write-Output "Apple"
Write-Output "Orange"
Write-Output "Bannana"
Write-Output "Pear"
}

fruit-host | sort
fruit-output | sort

$x = 10
Get-Variable x
Get-ChildItem variable:x`

# 
$x, $y, $z = "this", "that", "third"
test-path variable:xPart 1

<# 
Use an array to iterate and open the following
Notepad
MS Edge
MSpaint
Query the processes
Kill the processes from PowerShell
Part 2
Use an array to iterate and open the following
Notepad
MS Edge
MSpaint
Query the processes
Save the ProcessIDs to a text file called procs.txt
Iterate through the ProcessIDs in the text file and kill them
Part 3
Use an array to iterate and open the following
Notepad
MS Edge
MSpaint
Query the processes and display only the following information in order by process ID
Process ID
Process Name
The time the process started
The amount of time the process has spent on the processor
The amount of memory assigned to the process
#>
#IDK where this belongs
remove-variable x
del variable:x

#
$var1 = "Jon"
write-host "Hello $var1"
write-host 'Hello $var1'

# Hash Tables
$employee1 = [ordered]@{}
$employee2 = [ordered]@{}

$employee1.First = "Mary"
$employee1["Last"] = "Hopper"
$employee1.ID = "001"
$employee1["Job"] = "Software Developer"

employee1

$employee2.First = "John"
$employee2["Last"] = "Williams"
$employee2.ID = "002"
$employee2["Job"] = "Web Developer"

employee2

employee1.Username = "mhoppper001"
employee2["Username"] = "jwilliams002"

$employee1
$employee2

employee1.job = "software lead"

$employee3 = [ordered]@{}
$employee3.First = "Bob"
$employee3["Last"] = "Marley"
$employee3.ID = "20"
employee2["Username"] = "jwilliams002"
$employee3["Job"] = "accountant"

#System Enumeration
# Coloring groups and group members
foreach ($grp in (get-localgroup).name) {
Write-Host "`n$grp" - ForegroundColor red
'======================================='
(Get-LocalGroupMember -Name $grp).name`
-replace("$env:computername\\",'')
}

# pipping exercise
get-ciminstance win32_service | Sort-Object -Property state | ft -Poperty ProcessID,Name,State,pathname

# 07/30

# F8 whole script
# F5 just the line

# Script block into variable
$myblock = {get-service | format-table name, status}
& $myblock
# ^dot-sourcing?
invoke-command $myblock
# ^invoking a command$Age = Read-Host "Please enter your age"

# Gets items{from specified path} and sorts them descending by size
get-childitem  | sort-object -Property length -Descending | ft -GroupBy Extension
            # ^ <Insert Path Here> outputs as:
# Mode            LastWriteTime            Length (measurement in Bytes)            Name
------            -------------            -----------------------------            -----

# Get ChildItem, then groups the objects (script block for grouping with length < 1KB = True, length < 1KB = False)
Get-Childitem | Group-Object {$_.length -lt 1kb}

# Like head in bash
Get-Process | Select-Object -First 10
# Like tail in bash 
Get-Process | Select-Object -Last 10
# Like ps -elf in bash
Get-Process

# Does something I'm sure
Get-Process | select-object -ExpandProperty name

#
get-service | where-object{$_.status -eq 'running'}

#
get-childitem *.txt 'C:Windows' | where-object{$_.length -gt 1000}

#
Get-process | where-Object {$_.company -like 'micro*'} | format-table name, description, company

#
Get-process | where-Object {$_.Name -notlike 'powershell*'} | Sort-Object id -Descending

#
Get-process | where-Object processname -ne "Idle" | Sort-Object starttime | select-object -last 10 | format-table processname, starttime

1,2,3,1,2,3,1,2,3,1,2,3,1,2,3 | Sort-Object | Get-Unique

Get-Childitem C:\ | Measure-Object Length

#Mid example
'what is the awnser to life, the universe, and everything?' > test.txt
$before = Get-ChildItem

'42' > test.txt
$after = Get-ChildItem

compare-object $before $after -Property Length, Name
#------------------------------------------------------------------------------
$Mytruck  = New-Object object
Add-Member -MemberType NoteProperty -Name Color -Value White -InputObject $MyTruck
Add-Member -Me NoteProperty -in $Mytruck -Na Make -Value Toyotas

Add-Member -InputObject $MyTruck NoteProperty Model "sr5technically"
$Mytruck

#Properties
$Mytruck | Add-Member NoteProperty Cab doublecab
$Mytruck.color
#--------------------------------------------------------------------------------------------------
#Methods
#method .drive
Add-Member -MemberType ScriptMethod -InputObject $MyTruck -Name Drive -Value {"Going on a roadtrip"}
$Mytruck.Drive
#method .Accelerate
Add-Member -InputObject $MyTruck ScriptMethod Accelerate {"Skinny Pedal on Right"}
$Mytruck.Accelerate
#method .park$Age = Read-Host "Please enter your age"
Add-Member -MemberType ScriptMethod -InputObject $MyTruck -Name Drive -Value {"Going on a roadtrip"}
#method .park
$Mytruck | Add-Member ScriptMethod park {"Finding a spot is impossible"}
$Mytruck.park
#-------------------------------------------------
#
2 -eq 3
"abc" -eq "abc"
"abc" -ne "abq"
# Outputs the value that is greater than 8
7, 8, 9, -gt 8
#------------------------------------------------
"powershell" -like "*shell"
$fruit = 'mango', 'watermelon', 'tomatoes'
$fruit -contains 'tomatoes'
#-----------------------------------------------
regex
$text = "Your account username is ACE4495"
$pattern = '([A-F]{3}(\d{4}))'
$text -match $pattern
#-----------------------------------------------
#Conditionals
$x = 11
if($x -gt 10){"$x is larger than 10"}
else{"11 is larger than 10"}

#conditional example
$x = 6
if($x -eq 5){
            Write-Host "Bob"
}
elseif($x -eq 4){
            Write-Host "Sue"
}
elseif($x -eq 2){
            Write-Host "Tom"
}
elseif($x -eq 6){
            Write-Host "Mary"
}
else{
            Write-Host "Who Am I?"
#---------------------------------------------
#Foreach
#Foreach Example
$nums = 1, 2, 3, 4, 5
$nums | foreach-object{$_ * 2}

$list = 'a', 'b', 'c', 'd'
$list | Foreach-Object{$_.toupper()}

$list = 'A', 'B', 'C', 'D'
$list | Foreach-Object{$_.tolower()}

$nums = 1, 2, 3, 4, 5
$sum = 0
$nums | ForEach-Object { $sum += $_ }
$nums

#ForEach example
ForEach ($item in Get-Childitem C:\ -recurse){$item.name}

#ForEach example
#appends sportsball to the front of every item in the list
$teams = 'Yankees', 'FSU', 'Tigers', 'GreenJackets'
ForEach($teams in $teams){"sportsball $teams"}
#--------------------------------------------------
#pipelining
#pipeline example
Get-Process | Select-Object -First 10 | ForEach-Object {$_.Name} | `
ForEach-Object {$_.toupper}
#-------------------------------------------------------------------------------------------------------------------------
#Pipelining Exercise
# 1
get-process | sort-object -Property Starttime | select-object -First 1 -Last 1
get-process | sort-object -Property time | select-object -Last 1
# 2
get-date | select-object -expandproperty dayofweek
# 3
get-hotfix
# 4
get-hotfix | format-list InstallOn,HotFixID
get-hotfic | sort-object -property installedon | format-table installedon, hotfixid, description
# 5
get-hotfix | format-description InstalledOn,HotFixID,Description | sort description

# Instructor answers

#1
get-process | where-object Starttime | sort-object -proprty starttime | select-object -first 1 -last 1 -property starttime
#2
Get-Date
#3
get-hotfix
#4
get-hotfix | sort -Property installedon | select installedon, hotfixid
#5
#------------------------------------------------------------------------------------------------------------------------------------
#While
#while example
While
$var = ''
while($var -ne "MUHRINS"){
            $var = Read-Host "Which branch is the best?"
}
#-------------------------------------------------------------------
#until
#until example(til false)
$num = 0
do {
    $num
    $num++
}until($num -gt 3)

#while example
$num = 0
do {
    $num
    $num++
}while($num -le 10)

#while example
$num = 40
do {
    $num
    $num++
}while($num -gt 50 -and $num -lt 40)
#------------------------------------------
#For loop
#for loop example
for($num = 1; $num -le 3; $num++){$num}

#for loop exapmle IPs
for($i = 0; $i -le 255; $i++){
            Write-Host 192.168.0.$i
}
#--------------------------------------------
#Flow Control (Break/Continue)
#break example
$num = 0
While($num -lt 4){
     $num += 1
     if(){
  break
 }
}
#continue example
$num = 0
While($num -lt 4){
     $num += 1
     if(){
  continue
 }
}
#---------------------------------------------
#Set/Get/Add-Content
#Set-Content example
Set-Content -Path C:\Users\Student\example.txt -value "a string"

#Get-Content example
Get-Content -Path C:\Users\Student\example.txt

#Add-Content example
Add-Content -Path C:\Users\Student\example.txt -value "another one!"
#------------------------------------------------------------------------
<#
Important Concepts:
For Each
Do
Until
While
If, Elseif
Conditionals
Write To File
#>
#-----------------------------------
#Comparison & Conditions exercise

$line1 = "Do you have model number: MT5437 for john.doe@sharklasers.com?"
$line2 = "What model number for john.doe@sharklasers.com"
$pattern = '[A-Za-z]{2}\d{2,5}'

$line1, $line2 | ForEach-Object {
            if('[A-Za-z]{2}\d{2,5}'){
                        Write-Host $matches[0]":$_;
                        ================================================================================================="
            }
            else{
                        Write-Host "No matches found on:$_;
                        ================================================================================================="
                        }
}
#---------------------------------------------------------------------------------------------------------------------------
#Looping & Iterantions example
#step 1
$array = "notepad", "msedge", "mspaint"
$array | ForEach-Object {Start-Process $_}

#step 2
Get-Process

#step 3
$array = "notepad", "msedge", "mspaint"
$file = "$pwd\procs.txt"
foreach($proc in $array){
            Get-Process | Where-Object{$_.name -like $proc} | `
            Format-Table -Property id, name, StartTime, TotalProcessSortTime, VirtualMemorySize, WorkingSet64 }

#step 4
$array = "notepad", "msedge", "mspaint"
$array | ForEach-Object {Stop-Process -name $_}

#step 5
foreach($array in $array){
            Get-Process | Where-Object{$_.Name -like $array} | `
            Format-Table -Property id, name, starttime, totalprocesssorttime, virtualmemorysize, workingset64 }

#----------------------------------------------------------------------------------------------------------------------------
#gets process where th
get-process | where-object -Property Name -like *MS*
<#
.name gets the value out of the "name" property 
-like(case insensative) 
-c(case sensative) -clike(case sensative like)
#>
-like (strings) -match(based on expressions)
get-process | where-object{$_.name -like Powershell}

msedge -like '*MS*'
msedge -clike '*MS*'
'msedge' -match '*MS*'
'msedge' -match '^m.*$'
        #'msedge' -match (^m.*$|^$)

Where-Object: for filtering
Select-Object: selecting objects
Measure-Object: gives you the count, use the . to see the value
#---------------------------------------------------------------
1, 2, 3, 4, 5 |measure-object -average
    #outputs as:
Count    : 5
Average  : 3
Sum      : 
Maximum  :  
Minimum  : 
Property :

<#Per the last example^. We are looking at the value in the property called average with the .average command; 
as well as using the GetType() Method
#>
((1, 2, 3, 4, 5 |measure-object -average).Average).GetType()
#----------------------------------------------------------------
#` back tick + enter is like newline
    #Get-Process |`
    #Select-Object Name
#F5 runs script, F8 runs line

#"If you see elements provided on the pipeline"

#Ask for help!!!!!
#function Get-Sum{
    #Begin {$sum = 0}
    #Process {$sum += $_; $_}
    #End {$sum = 5}
#}

function Print-PSitem{
    Begin/End optional
Begin {}
Process {foreach($i in $PSitem){$i}}
End {}
}

function Print-Input {
    Begin {}
    Process {foreach($i in $input){$i}}
    End {}
}

#$matches

function get-sum($num1, $num2) {
  $num1 + $num2
}
get-sum 5 5
#--------------------------------------------------------

function Get-longestName{
    #Begin: for declaring variables
    Begin{
            #keep track of how many states are entered
        $count = 0
            #make an array to store the states
        $states = @() 
    }
    Process{
              #Trap the user to type 3 states
        while($count -lt 3){
                #variable $usr Storing user input    
            $usr = Read-Host "Enter a U.S. State"
                #Appendsthe user input to the list
            $states += $usr
                #Adds 1 to our count of states
            $count += 1
        }

    }
    End{
            #Stores the sorted array to $list
       $list = $states | sort -Property Length -Descending 
       foreach($state in $list){
            #prints the state and number of characters
        "$state`:" + $state.length
        }

    }
}

<#
Insert the following into the CLI below.
PS> Get-LongestName
#>

function Get-NetInfo {
        #Regex pattern
    $pattern = '.*?((\d{1,3}\.){3}\d{1,3})'
    $netinfo = ipconfig
    
    ### Create the matches for IP, Subnet, and gateway
    $ip = $netinfo -match "IPV4$pattern" | `
    
    #Matching with IPV4 and Pattern; Checking the match for the specific pattern
    ForEach-Object{if($_ -match $pattern){$matches[1]}}
    
    #Matching with Subnet and Pattern; Checking the match for the specific pattern
    $subnet = $netinfo -match "Subnet$pattern" |`
    ForEach-Object{if($_ -match $pattern){$matches[1]}}
    
    #Matching with Gateway and Pattern; Checking the match for the specific pattern
    $gateway = $netinfo -match "Gateway$pattern" | `
    ForEach-Object{if($_ -match $pattern){$matches[1]}}
    
    #Format string; Every element in the array gets matched at their respective index position(on a new line).
    "IP: {0}`nSubnet: {1}`nGateway: {2}" -f $ip, $subnet, $gateway
}

Function Get-UrlInfo{
$file = Get-Content .\dns.txt
$regex = '(www\.[a-zA-Z0-9\-\._]\+\.(com|org|net))'
#$regex = (w{3}\.)(?<=[a-z]\.)(c-m){3}
    foreach($line in $file){
        if($line -match $regex){
        $matches[1]
        }
    }
}

Add-Content .\dns.txt -value 'www.blah_blah_wah.com'

<#
Insert the following into the CLI below.
PS> Add-Content -path .\dns.txt -value battle.com
#>

#split example
'8.8.8.8'.split(".")

#split example 2
'1.8.2.44'.split(".")[0]

#join example
1,2,3,4,5 -join ""
