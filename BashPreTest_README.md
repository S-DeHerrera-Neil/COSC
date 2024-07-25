## 01
Create a script that will perform the following actions:

Replace every instance of 'cat' in "infile" with 'dog'.

Replace every instance of 'Navy' in "infile" with 'Army'.

Replacements are case-sensitive.

Write the output to the file specifed by the variable 'outfile'.

function q1()

{

  #Valid Variables are:
  
  infile=$1
  
  outfile=$2
  
  #Your code here

}

### Script

sed -e "s/cat/dog/g" -e "s/Navy/Army/g" $1 >> $2

    * instructor:
sed -e "s/cat/dog/g" -e "s/Navy/Army/g" $1 >> $2



## 02

Create a script that will print to standard output all user names from the /etc/passwd file.

function q1()

{

  #Valid Variables are:
  
  #none
  
  #You code here
no tax at commissary" fi '''
}

### Script

awk -F: '{print $1}' /etc/passwd names.txt

    * instructor:
cut -d':' -f1 /etc/passwd 



## 03

Create a script that will perform the following actions:

Print to standard output all usernames from the file path specified by the parameter filename sorted ascending numerically by user id.

The file will be in the format of /etc/passwd

function q1()

{

  #Valid Variables are:
  
  filename=$1
  
  #Your code here

}

### Script


*
sort -n -t: -k3 $filename | cut -d':' -f1



## 04

Create a script that will perform the following actions:

Print to standard output the total number of files in the directory specified by dirname.

If the directory does not exist, print 'Invalid Directory'

The count excludes the '.' and '..' pseudo-directories.

function q1()

{

  #Valid Variables are:
  
  dirname=$1
  
  #Your code here

}

### Script


    * instructor:
ls -1 $dirname | wc -l

## 05

Create a script that will perform the following actions:

Delete all files contained in the directory specified by dirdel

Also delete the directory specified by dirdel

function q1()

{

  #Valid Variables are:
  
  dirdel=$1
  
  #Your code here

}

### Script


    * instructor:
rm -r $dirdel


## 06
Create a script that will perform the following actions:

Create a file specified by the name newfile.

Set the file modified date to the value specified in filedate and time to '1730'. NOTE: filedate contains only a valid date in YYYYMMDD format, not a time.

function q1()

{

  #Valid Variables are:
  
  newfile=$1
  
  filedate=$2
  
  #Your code here

}

### Script

      * Instructor:
touch -t "$filedate"1730 $newfile


## 07

Read the file specified by fname and perform an action based on the contents of the file:

If contents are 0 to 9, print "single digit" to standard output.

If contents are 10 to 99, print "double digit" to standard output.

If contents are 100 to 999, print "triple digit" to standard output.

Otherwise, print "Error" to standard output.

NOTE: There will only be one line of content in the file specified by fname.

function q1()

{

  #Valid Variables are:
  
  fname=$1
  
  #Your code here

}

### Script

cont='cat $fname'
if [[ $cont -lt 10 ]]; then 
  echo "single digit" 
elif [[ $cont -lt 100 ]]; then 
  echo "double digit" 
elif [[ $cont -lt 1000 ]]; then 
  echo "triple digit" 
else 
  echo "Error"


## 08

Copy all lines from the file specified by src variable to the file specified by dst variable which DO NOT contain the text specified by match variable.

function q1()

{

  #Valid Variables are:
  
  src=$1
  
  dst=$2
  
  match=$3
  
  #Your code here

}
### Script


cat $src | grep -v $match > $dst


## 09

Terminate the process that has the randomly assigned name specified by procname variable. procname does not contain path information.

function q1()

{

  #Valid Variables are:
  
  procname=$1
  
  #Your code here

}

### Script


killall $procname

  or

pkill $procname


## 10

Create a sorted full-path list of all files in the directory dirpath that were modified within the previous day. Directories should not be included in the output. Print the list to the screen, one item per line.

NOTE: The full paths to files should be in your output. (i.e. /etc/passwd would be included)

NOTE: Directory entries should not be included. (i.e. /etc would NOT be included)

function q1()

{

  #Valid Variables are:
  
  dirpath=$1
  
  #Your code here

}

### Script
