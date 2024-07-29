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
test-path variable:x
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
$employee3.ID = "003"
employee2["Username"] = "jwilliams002"
$employee3["Job"] = "accountant"
