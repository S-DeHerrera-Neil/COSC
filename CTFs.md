# Bash CTFd Base challenges
  * 07/22/2024
## 01
Brace expansion is a mechanism by which arbitrary strings may be generated, for commands that will take multiple arguements. 
For the below examples, the first example is equivalent to the second command.
'''
$ mkdir /var/log/{auth,syslog,dmesg}_log

Results in
'''
$ mkdir /var/log/auth_log /var/log/syslog_log /var/log/dmesg_log

Activity: Using Brace-Expansion, create the following directories within the $HOME directory:
* 1123
* 1134
* 1145
* 1156
    helpful url: https://www.gnu.org/software/bash/manual/bash.html#Brace-Expansion

### Desired Input
"$ mkdir 11{23,34,45,56}"


## 01.2
As we learned, the following example would create five files with one command.
'''
touch file1.txt file2.txt file3.txt passwd.txt shadow.txt

But, with Brace Expansion it can be shortened to the following.
'''
touch file{1..3}.txt passwd.txt shadow.txt

Activity:
Use Brace-Expansion to create the following files within the $HOME/1123 directory. You may need to create the $HOME/1123 directory. Make the following files, but utilze Brace Expansion to make all nine files with one touch command.
Files to create:
* 1.txt
* 2.txtdmesg | grep -E 'CPU|BIOS' | cut -d] -f2- | grep -v -E 'usable|reserved'
* 3.txt
* 4.txt
* 5.txt
* 6~.txt
* 7~.txt
* 8~.txt
* 9~.txt

### Desired Input
"$ touch $HOME/1123/{1,2,3,4,5,6~,7~,8~,9~}.txt"

 
## 01.3
Activity:

Using the find command, list all files in $HOME/1123 that end in .txt.

Be aware that if you use Pattern Matching to locate the files you may have unintended results based on if you use quotes around the pattern or not. If you do not quote the pattern, the Bash shell interprets the pattern. If you quote the pattern, it is passed to the command for it to interpret. You can have a properly functioning command, yet unintended output, based on which of these two gets to interpret the pattern.

Helpful URLs:
* https://www.gnu.org/software/bash/manual/bash.html#Pattern-Matching

*https://www.gnu.org/software/bash/manual/bash.html#Quoting

### Desired Input
"$ find $HOME/1123 -name "*.txt""


## 01.3(#2)
Challenge Activity:

List all files in $HOME/1123 that end in .txt. Omit the files containing a tilde (~) character.

While this activity can be accomplished with only find, it can also be combined with grep as well.

### Desired Input
"$ find $HOME/1123 -name "*.txt" | grep -v  "~""


## 02
Activity:

Copy all files in the $HOME/1123 directory, that end in ".txt", and omit files containing a tilde "~" character, to directory $HOME/CUT.

Use only the find and cp commands. You will need to utilize the -exec option on find to accomplish this activity.

The find command uses BOOLEAN "!" to designate that it does not want to find any files or directories that follows.
### Desired Input
find $HOME/1123 -type f -name "*.txt" ! -name "*~*" -exec cp {} $HOME/CUT  \;


## 03
Activity:

Using ONLY the find command, find all empty files/directories in directory /var and print out ONLY the filename (not absolute path), and the inode number, separated by newlines.

Tip: When using the man pages, it is better to focus your search then to visually scan 1000+ lines of text. Combining the output with the grep command, possibly with its -A, -B, or -C options, can help drive context driven searches of those manual pages.

Example Output

123 file1
456 file2
789 file3
### Desired Input
$ find /var -empty -printf "%i %f\n" 


## 04
Activity:

Using ONLY the find command, find all files on the system with inode 4026532575 and print only the filename to the screen, not the absolute path to the file, separating each filename with a newline. Ensure unneeded output is not visible.

Tip: The above inode is specific to this CTFd question and might not be in use on your Linux Opstation. Instead, you can test your command on your Linux OpStation against inode 999.
 * ensure uneeded output is not visible (/dev/null)

### Desired Input
 $ find / -inum 4026532575 -printf "%f\n" 2>/dev/null


## 05 (maybe?)
Activity:

Using only the ls -l and cut Commands, write a BASH script that shows all filenames with extensions ie: 1.txt, etc., but no directories, in $HOME/CUT.
Write those to a text file called names in $HOME/CUT directory.
Omit the names filename from your output.
NOTE: The output should only be the file names with no additional information. Additionally, your code will be executed twice. This is to ensure you have taken into account how file redirection and command execution works.

To read more on Redirecting Output, go to the following resource:

https://www.gnu.org/software/bash/manual/bash.html#Redirecting-Output
To read more on Simple Command Expansion, go to the fouser:$1$fnfffc$qzwexrecdtvryu#21:13064:0:99999:7:::llowing resource:

https://www.gnu.org/software/bash/manual/bash.html#Simple-Command-Expansion
 #### 3 Cuts: Every cut you get more specific with your results
 * 1) cut -d: -f2 -s
 * 2) cut -d ' ' -f2 -s
 * 3) cut -d. -f1-2 -s > $HOME/CUT/names

### Desired Input
#!/bin/bash

$ ls -l $HOME/CUT | cut -s -d: -f2- | cut -s -d ' ' -f2- | cut -d. -f1-2 -s > $HOME/CUT/names  


## 06
Activity:

Write a basic bash script that greps ONLY the IP addresses in the text file provided (named StoryHiddenIPs in the current directory); sort them uniquely by number of times they appear.

It is not important to have a regular expression that only catches fully valid IP addresses. It is more important that you become familiar with creating and using regular expressions. Below, there are some useful websites that you can use to visually see what your regular expression pattern is matching on.

www.regexr.com
www.regex101.com
E.g., [1-4]{0,5}

Bracket Expression: [1-4] = 1 or 2 or 3 or 4

Repetitions: {0,5} = above numbers (1,2,3,4) appear from 0 to 5 times, meaning our number can be between 1 and 44444

Interpreted BASH Chars: . | $ ` \ ! must be escaped with \ in a regex. I.E. to match on a backslash, you must use \\ in your pattern.

Note: The basics of regular expressions are assumed knowledge for this module, and you will need to call back to prior learning. If you are in need of a quick refresher, the following man pages could be useful.

man egrep
man regex.7

### Desired Input
cat StoryHiddenIPs | grep -E -o "([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})" | sort -n | uniq -c | sort -nr


## 07 (May need help on)
Activity:

Using ONLY the awk command, write a BASH one-liner script that extracts ONLY the names of all the system and user accounts that are not UIDs 0-3.
Only display those that use /bin/bash as their default shell.
The input file is named $HOME/passwd and is located in the current directory.
Output the results to a file called $HOME/SED/names.txt
Tip: awk can use conditional statements, e.g. print only the line in /etc/passwd that has "root" as its first field.

awk -F: '($1 == "root") {print $0}' /etc/passwd
 passwd

### Desired Input
cat $HOME/passwd | awk -F: '($3>3)' | awk -F: '($7 == "/bin/bash") {print $1}' > $HOME/SED/names.txt


## 08
Activity:

Find all dmesg kernel messages that contain CPU or BIOS (uppercase) in the string, but not usable or reserved (case-insensitive)
Print only the msg itself, omitting the bracketed numerical expressions ie: [1.132775]
Note: For security reasons, the dmesg command is being emulated on the CTFd backend. You can still use it as normal on your Linux OpStation, but to get a similar output, do not use any dmesg switches. The intent of this activity is to take raw dmesg output and combine it with grep and either awk or cut to manipulate the output into a desired end state.

Tip: As you may have noticed, when using grep you can simulate a logical AND by piping the output of one grep command to the next. This will filter down your output to only what contains all your patterns. But, for this activity, you will need to use a logical OR to match on a wide range of strings. If you do not recall how to utilize that option in grep, go research it from the resources available to you.

### Desired Input
   
   *My answer: dmesg | grep -E 'CPU|BIOS' | cut -d] -f2- | grep -v -E 'usable|reserved'
   
   *Instructor: dmseg | grep -E 'CPU|BIOS' | grep -v -E 'usable|reversed' | cut -d] -f2-


## 09 (I need Help!!!!!)
Activity:

Write a Bash script using "Command Substitution" to replace all passwords, using openssl, from the file $HOME/PASS/shadow.txt with the MD5 encrypted password: Password1234, with salt: bad4u
Output of this command should go to the screen/standard output.
You are not limited to a particular command, however you must use openssl. Type man openssl passwd for more information.
TIP: While not required, using awk is possibly the most straightforward method of accomplishing this activity. Keep in mind that awk is its own programming language. It can not use Bash variables unless you import them in. Below is a break down of applicable parts of an awk command, with descriptions of each part. See if you can use this example as a jumping off point to accomplish the end state of the activity.

#!/bin/bash 

a=”New name to place in field one” 
awk -F: -v "awk_var=$a" 'BEGIN {OFS=":"} {$1=awk_var} {print $1,$NF}' /etc/passwd

* '-F' is used to change the default field seperator of " ".  In this example, it	\

* now designates ':'

* '-v' designates or imports a variable into AWK.  In the above example, 'awk_var' is 	\

* declared with the Bash variable of '$a'.

* The 'BEGIN' pattern(s) tells AWK to execute action parts of the pattern before any of	\

* the input is read.  In this case, the 'OFS', or 'Output Field Seperator' will place	\

* colons between the firelds being printed in the output.  As well, it will replace the	\

* first field (i.e. '$1') with whatever data is contained in the AWK variable declared	\

* previously.

* The '{print}' statement designates whatever the desired fields are to print.  '$0' is	\

* the variable for the entire line.  The first field is '$1', the second field is '$2',	\

* and so on.  AWK has a builtin variable, '$NF' which evaluates to the number of fields	\

* on a line.  Use this as a shortcut if you need to print the last field on the line.

To read more on Shell Expansion, go to the following resource:

https://www.gnu.org/software/bash/manual/html_node/Shell-Expansions.html#Shell-Expansions
To read more on the Shadow file format, go to the following resource:

man shadow.5

## /etc/passwd-> user:x:UID:GID:GECOS:Home_Dir:Command/Shell

## /etc/shadow-> user:$1$fnfffc$qzwexrecdtvryu#21:13064:0:99999:7:::

### Desired Input
a=$(openssl passwd -1 -salt bad4u Password1234)
awk -F: -v "awk_var=$a" 'BEGIN {OFS=":"} {$2=awk_var} {print $0}' $HOME/PASS/shadow.txt


## 10
Activity:

Using ONLY sed, write all lines from $HOME/passwd into $HOME/PASS/passwd.txt that do not end with either /bin/sh or /bin/false.
TIP: When designating a path in a sed command, you must escape the path characters if they are to be interpreted as part of the string

sed '/\/bin/d' file.txt

### Desired Input
sed -e '/\/bin\/sh/d -e /\/bin\/false/d' $HOME/passwd > $HOME/PASS/passwd.txt


## 11
Activity:

Using find, find all files under the $HOME directory with a .bin extension ONLY.
Once the file(s) and their path(s) have been found, remove the file name from the absolute path output.
Ensure there is no trailing / at the end of the directory path when outputting to standard output.
You may need to sort the output depending on the command(s) you use.
Tip: For stripping the filename out of the output, there are different ways that this can be accomplished based on what you have learned so far.

Utilizing -printf options on find.
Utilizing awk to manipulate the fields. This may leave the trailing / if you don't take that into account.
Utilizing the rev and cut commands creatively.

### Desired Input
find ./ -type f -iname "*.bin" | awk -F./ '{print$0}' | rev | cut -d/ -f2- | rev | sort -u


## 12
Activity:

Write a script which will copy the last entry/line in the passwd-like file specified by the $1 positional parameter
Modify the copied line to change:
User name to the value specified by $2 positional parameter
Used id and group id to the value specified by $3 positional parameter
Home directory to a directory matching the user name specified by $2 positional parameter under the /home directory
The default shell to `/bin/bash'
Append the modified line to the end of the file
Tip: awk provides the simplest method for completing this activity. Refer back to your notes on "09 - BASH Activity" if you are in need of starting point on this activity.

Note: The contents of the passwd-like file will be randomly generated on each submission. It is intended to read the last line once and store it in a variable.

To read more on Positional Parameters, go to the following resource:

https://www.gnu.org/software/bash/manual/bash.html#Positional-Parameters
To read more on the Passwd file format, go to the following resource:

man passwd.5
### Desired Input
file=$1
name=$2
id=$3
tail -1 $file | awk -F: -v "username=$name" -v "uid=$id" 'BEGIN {OFS=":"}{$1=username}{$3=uid}{$4=uid}{$6="/home/"username}{$7="/bin/bash"}{print $0}' >> $file


## 13
Activity:

Find all executable files under the following four directories:
/bin
/sbin
/usr/bin
/usr/sbin
Sort the filenames with absolute path, and get the md5sum of the 10th file from the top of the list.
Tip: In the below example, you can see the different uses of md5sum. While not wrong, the first command is hashing the string output of the the find command. In the second, md5sum is hashing the file contents of the given file, which is what is intended for this activity. You can also tell the second method hashed the file as the file name is listed in the hash output; the first only lists a hyphen indicating a string was hashed. For this activity, to provide md5sum with the 10th file of the sorted output, it is recommended to use Command Subtitution.

[chris@localhost ~]$ find /etc -maxdepth 1 -name passwd | md5sum
9231fb35b4431d59eae53a8c0d673231  -
[chris@localhost ~]$ md5sum /etc/passwd
62f5fa5100adcee3305cf979b5734a3e  /etc/passwd
### Desired Input
MD5=$(find /bin /sbin /usr/bin /usr/sbin -executable -type f | sort | head | tail -1)
md5sum $MD5 | cut -d" " -f1


## 14
Activity:

Using any BASH command complete the following:

Sort the /etc/passwd file numerically by the GID field.
For the 10th entry in the sorted passwd file, get an md5 hash of that entry’s home directory.
Output ONLY the MD5 hash of the directory's name to standard output.
Note: Since we are dealing with a directory, which is both a string and an absolute path, it matters how we get the md5sum of our intended output.

[chris@localhost ~]$ md5sum /home/chris
md5sum: /home/chris: Is a directory
In the above example, an error is returned because we are applying the directory /home/chris as the first argument of the above command. Since /home/chris is a directory, likely with additional files within it, we cannot assign this as an argument. However, we have the string /home/chris as STDIN for a command, as seen in the below example.

[chris@localhost ~]$ echo "/home/chris" | md5sum
fd1a05901ce7150f82abd7f7d76f2827  -
### Desired Input
GID=$(cut /etc/passwd -d: -f4- | sort -n | head | tail -1 | cut -d: -f3) 
echo $GID | md5sum | cut -d" " -f1


## 15
Activity:

Write a script which will find and hash the contents 3 levels deep from each of these directories: /bin /etc /var
Your script should:
Exclude named pipes. These can break your script.
Redirect STDOUT and STDERR to separate files.
Determine the count of files hashed in the file with hashes.
Determine the count of unsuccessfully hashed directories.
Have both counts output to the screen with an appropriate title for each count.
Example Output:

Successfully Hashed Files: 105
Unsuccessfully Hashed Directories: 23

### Desired Input
find /bin /etc /var -maxdepth 3 ! -type p -exec md5sum {} 1>output.txt 2>errors.txt \;
Out=$(wc -l < output.txt)
Err=$(grep -c "Is a directory" errors.txt)
echo "Successfully Hashed Files: $Out"
echo "Unsuccessfully Hashed Directories: $Err"

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## 16
Activity:

Design a script that detects the existence of directory: $HOME/.ssh

Upon successful detection, copies any and all files from within the directory $HOME/.ssh to directory $HOME/SSH and produce no output. You will need to create $HOME/SSH.
Upon un-successful detection, displays the error message "Run ssh-keygen" to the user.
NOTE: If the $HOME/.ssh directory does not exist, one may run the ssh-keygen command. Accept all defaults for the purposes of this exercise. This is not necessary for passing the activity but can be used for testing on your local machine.


### Desired Input

## 17
Activity:

Write a script that determines your default gateway ip address. Assign that address to a variable using command substitution.
NOTE: Networking on the CTFd is limited for security reasons. ip route and route are emulated. Use either of those with no switches.
Have your script determine the absolute path of the ping application. Assign the absolute path to a variable using command substitution.
Have your script send six MD5=$(find /bin /sbin /usr/bin /usr/sbin -executable -type f | sort | head | tail -1)
md5sum $MD5 | cut -d" " -f1ping packets to your default gateway, utilizing the path discovered in the previous step, and assign the response to a variable using command substitution.
Evaluate the response as being either successful or failure, and print an appropriate message to the screen.
Pseudo Example:

A=$(command_1)
B=$(command_2)
C=$($A command_3 $B)
if [[ "$" <condition> "$" ]]; then
   echo "successful";
else
   echo "failure";
fi 

### Desired Input

## 18
Activity:Activity:

Create the following files in a new directory you create $HOME/ZIP:
file1 will contain the md5sum of the text 12345
file2 will contain the md5sum of the text 6789
file3 will contain the md5sum of the text abcdef
Create a zip file containing the three files above, without being stored inside a directory in the zip file. Name the zip file $HOME/ZIP/file.zip
HINT: "Junk" the paths
Utilize tar on $HOME/ZIP/file.zip to archive it into a file called $HOME/ZIP/file.tar.gz which should not include directories. Use the gzip option in tar, DO NOT use a seperate gzip binary.
HINT: You might need an option to change directories first.


Create the following files in a new directory you create $HOME/ZIP:
file1 will contain the md5sum of the text 12345
file2 will contain the md5sum of the text 6789
file3 will contain the md5sum of the text abcdef
Create a zip file containing the three files above, without being stored inside a directory in the zip file. Name the zip file $HOME/ZIP/file.zip
HINT: "Junk" the paths
Utilize tar on $HOME/ZIP/file.zip to archive it into a file called $HOME/ZIP/file.tar.gz which should not include directories. Use the gzip option in tar, DO NOT use a seperate gzip binary.
HINT: You might need an option to change directories first.

### Desired Input

## 19
Activity:

Design a basic FOR Loop that iteratively alters the file system and user entries in a passwd-like file for new users: LARRY, CURLY, and MOE.
Each user should have an entry in the $HOME/passwd file
The userid and groupid will be the same and can be found as the sole contents of a file with the user's name in the $HOME directory (i.e. $HOME/LARRY.txt might contain 123)
The home directory will be a directory with the user's name located under the $HOME directory (i.e. $HOME/LARRY)
NOTE: Do NOT use shell expansion when specifying this in the $HOME/passwd file.
The default shell will be /bin/bash
The other fields in the new entries should match root's entry
Users should be created in the order specified
### Desired Input

## 20
Activity:

Write a bash script that will find all the files in the /etc directory, and obtains the octal permission of those files. The stat command will be useful for this task.
Depending how you go about your script, you may find writing to the local directory useful. What you must seperate out from the initial results are the octal permissions of 0-640 and those equal to and greater than 642, ie 0-640 goes to low.txt, while 642 is sent to high.txt.
Have your script uniquely sort the contents of the two files by count, numerically-reversed, and output the results, with applicable titles, to the screen. An example of the desired output is shown below.
NOTE: There is a blank line being printed between the two sections of the output below.
EXAMPLE OUTPUT:

Files w/ OCTAL Perm Values 642+:
    424 777
    365 644
     15 755
  
Files w/ OCTAL Perm Values 0-640:
      4 640
      3 440
      2 600
      1 444

### Desired Input
