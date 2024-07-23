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
 $ find / -inum 4026532575 2>/dev/null -printf "%f\n" 

  
## 05
Activity:

Using only the ls -l and cut Commands, write a BASH script that shows all filenames with extensions ie: 1.txt, etc., but no directories, in $HOME/CUT.
Write those to a text file called names in $HOME/CUT directory.
Omit the names filename from your output.
NOTE: The output should only be the file names with no additional information. Additionally, your code will be executed twice. This is to ensure you have taken into account how file redirection and command execution works.

To read more on Redirecting Output, go to the following resource:

https://www.gnu.org/software/bash/manual/bash.html#Redirecting-Output
To read more on Simple Command Expansion, go to the following resource:

https://www.gnu.org/software/bash/manual/bash.html#Simple-Command-Expansion
 #### 3 Cuts: Every cut you get more specific with your results
 * 1) cut -d: -f2 -s
 * 2) cut -d ' ' -f2 -s
 * 3) cut -d. -f1-2 -s > $HOME/CUT/names

### Desired Input
#!/bin/bash

$ ls -l $HOME/CUT | cut -d: -f2 -s| cut -d ' ' -f2 -s| cut -d. -f1-2 -s > $HOME/CUT/names  


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

## 07
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
dmesg | grep -E 'CPU|BIOS' | cut -d] -f2- | grep -v -E 'usable|reserved'

## 09
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
### Desired Input
a=$(openssl passwd -1 -salt bad4u Password1234)
awk -F: -v "awk_var=$a" 'BEGIN {OFS=":"} {$2=awk_var} {print $0}' $HOME/PASS/shadow.txt

## 10
Activity:

Using ONLY sed, write all lines from $HOME/passwd into $HOME/PASS/passwd.txt that do not end with either /bin/sh or /bin/false.
TIP: When designating a path in a sed command, you must escape the path characters if they are to be interpreted as part of the string

sed '/\/bin/d' file.txt

### Desired Input
sed -e '/\/bin\/sh/d' -e '/\/bin\/false/d' $HOME/passwd > $HOME/PASS/passwd.txt
