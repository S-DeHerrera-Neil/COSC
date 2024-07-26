# Bash
Student Guide is at: https://cted.cybbh.io/tech-college/pns/public/pns/latest/guides/bash_sg.html
CTF challenges <Rank, LName>
IP Address: 10.50.26.116
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Date 07/22
       Commands covered:
       $ nano(text editor like vi/vim)
       $ mkdir -p (makes a parent directory)
       $ rm -rf(removes forceably)
       $ rmdir (removes directory)
       $ ls -lisa(list: l-long ) 
              ^can also do ls -1 (puts 1 item per line)
       $ pwd (print working directory)sudo cat /etc/shadow >> fake1passwd.txt
       $ cp <source> <destination> (copy)
      ^(/etc/shadow)  ^(fake1passwd.txt)
      sudo cat /etc/shadow >> fake1passwd.txt (can work from the directory of touch the desired directory)
#### cat command:(Reads, Writes and ConCATenates files) 
       $ cat [options] [File] 
       $ cat /etc/passwd | grep " student " (gets /etc/passwd file then greps to student) 
#### head command:(outputs the first 10 lines)
       $ head [option]... [file]...
#### tail command:(outputs the last 10 lines)
       $ tail [option]... [file]...
#### umask command:(allows modification of permisions. New files/folders that do not exist yet)
       $ umask [value] 
       $ umask [-p] [-S]
              ^ -p (current mask as a symbolic value)
              ^ -S (current mask along with the umask command, allowing it to to be copy/pasted)
#### find command:(comprehensive file and directory searches) {shows the directory that the file is found}
       $ find [path] [options] [expression]
       $ find -name (case sensative file)
       $ find -iname (case insensative file)
       $ find -inum(finds files off of the inode number)
       $ find -size(for finding files based off of it's size)
       $ find /etc/passwd (syntax- user:x:UID:GID:GECOS:Home_Dir:Command/Shell)
                                               ^$ find -group name (the 4th field after the : delimiter)
                                               or
                                               ^$ find -gid<GID#> (when looking for a specific GID)
                                               ^$ find -uid <UID#>
       $ find -maxdepth<#of directories deep>(telling find how deep find needs to look in a directory)
       $ find / -type d(finds directories)
       $ find / -type f(finds files)
       $ find -atime ()
       $ find -ctime ()
       $ find -mtime ()
       $ find $HOME -mtime 0
       $ find cmin -60
       $ find -mmin -60 (60 minutes in an hour)
       $ find -empty
       $ find -executable
       $ find -exec
       $ find [path] [arguments] -exec [command] {} + or \; (more examples at > https://linuxhandbook.com/find-exec-command/)
                                                    ^+ executes all of the commands all at once, prints 1 line.
                                                    ^\; executes each found result, prints multiple lines.
#### cp command:(used to copy From:<src> To:<dst>)
       $ cp <source> <destination> (copy)
             /etc/passwd [7 lines](IDK what this is from/for)
##### /etc/passwd file structure: user:x:UID:GID:GECOS:Home_Dir:Command/Shell 
       (1) user:
       (2) Password:
       (3) User ID(UID):
       (4) Group ID (GID):
       (5) User ID Info (GECOS):
       (6) Home Direcory:
       (7) Command/Shell):
##### /etc/shadow  file structure: user:$1$fnfffc$qzwexrecdtvryu#21:13064:0:99999:7:::
       (1) user:
       (2) Password: $ "<Hashing_Algorithm>" $ "<_Salt>" $ "<_Password>" :"
       (3) Last Password Change (lastchanged):
       (4) Minimum:
       (5) Maximum:
       (6) Warn:
       (7) Inactive:
       (8) Expire:
###### error code handling 
       $ find / perm /4000 -uid 0 -ls 2>/dev/null
       $ find /var/log -iname *.log -exec -l -al () 2>/dev/null \:
       $ find /var/log -iname *.log 2>/dev/null -printf "%i %f\n" (%i and %f - shows the inode# then the file)
                                                 ^printf example > (https://phoenixnap.com/kb/bash-printf)
#### grep command:(used for searching and manipulating text patterns in files){grep lines that match a pattern/input}
       options:
       -i(case insensative)
       -n(line numbers)
       -v(inverts your search)-TopGun referance
       $ grep [options] pattern [files]
       $ egrep
       $ cat /fake1passwd.txt | grep /bin/bash (look at what the users shell is)
       $ egrep "student|root|bob" fake1passwd.txt
          ^(egrep <student,root,bob> in the fake1passwd.txt file)

###### differences between brackets 
       (https://baeldung.com/linux/bash-single-vs-double-brackets)
###### Brace Expansion
       $ mkdir cosc11{23,45,67} (makes mutiple directories in the same directory)
#### cut command:(Cuts where specified)
              options:
              -d: (delimiter)
              -f1 (Field)
              -s (strict) -only from the delimiter
       $ cut option... [file]...
       $ cat fake1passwd.txt | cut -d: -f1 
                            
#### Chaining operators
       & -runs process in background
       && -AND
       || -OR, 
       ! -NOT,
       | -Pipes, redirects output
       () -looks at it first
       > -creates file
       >> -creates file and/or appends to file
# 07/23
#### awk (Advanced Pattern-Matching language in bash. Matches data by regular expression and performs actions based on the data.)
       $ awk fakepasswd | awk -F: '{print $1}'
                                   ^{print $NF}($NF-"Number Of Fields")
                                   ^{print}
       $ awk -F: '($3 == 0){print $1}' fakepasswd
       $ awk -F 'BEGIN {OFS="@"} {print $1, $3}' fakepasswd
               ^ Output Field Seperator
       $ cat /etc/passwd | awk -F: '($3 >= 150){print $0}'
       $ cat /etc/passwd | awk -F: '($3 >= 150){print $1, $6, $3}'
       $ cat /etc/passwd | awk -F: '($7 == "/bin/bash"){print $1, $6, $3}' fakepasswd
       $ cat /etc/passwd | awk -F: '($7 == "usr/sbin/nologin"){print $1, $6, $3}' fakepasswd
------------------------------------------------------------------------------------------------------------------------------------------
#### sort command:(used to sort a file, arranging the records in a particular order)
       "have to generate output file has to be before it"
              options:
              -n (sorts a file numerically{interprets data as numbers})
              -r (sorts data in reverse order{descending}) 
              -nr (sorts a file with numeric data in reverse order. Combines -n and -r options)
              -t (for delimters)
              -k (sorts a table based on a specific column or number)
              -u (sorts and removes duplicate lines, providing a unique sorted list)
              -uniq (?) -different than {has to have sort}
       $ awk -F: '{print3}' fakepasswd | sort
       $ awk -F: '{print3}' fakepasswd | sort -n
       $ awk -F: '{print3}' fakepasswd | sort -nr
       $ cat fakepasswd | sort -t : -k 2,4 
       $ ps aux  | sort -k 1 
       $ cat fake1passwd.txt | sort -t : -k 1 | uniq
------------------------------------------------------------------------------------------------------------------------------------------
###### Regex: (Regular Expression[rational expression] a sequence of characters that specifies a match pettern in text)
       helpful website > URL: https://regex101.com/library
###### aliases(user-defined shorthand for a longer command or sequence of commands)
       $ alais vim= 'nano'
              ^ String editor utility
       $ ls -l
       $ cat pizza.txt

commands cut and awk help with filtering   
#### sed command:(stream editor[can perform lots of functions like searching, find and replace, insertion and deletion])
       $ sed options... [script] [inputfile...]
       $ sed -e 's/chicken/hamburger/g' -e 's/pepperoni/sausage/' pizza.txt
                  ^replace chicken with hamburger ^/g = global so every instance.       
                  ^replace pepperoni with sausage ^/ = not global so only the first occasion.

       $ sed -e 'chicken/d' pizza.txt
                         ^/d(deletes chicken globally.)
------------------------------------------------------------------------------------------------------------------------------------------
### command substitution
       *Script to replace the command (cat /etc/) 
###### script.sh
       #!/bin/bash

       A=$(cat /etc/passwd)
       echo $Ahttps://linuxhandbook.com/find-exec-command/
###### script comsub.sh
       #!bin/bash
       A=$(find /usr/bin -name passwd

       echo $A
       echo md5sum $A
       echo file $A
       openssl, Password1234, bad4u
--------------------------------------------------------------------------------------------------------------------------------------------       
# 07/24
#### tar command:(used to create Archive and extract Archive files)       
       $ tar [options] [archive-file] [file or Dir to be archived]
       $ tar -czf
              options:
              -c:(creates an archive by bundling files and directories together)
              -z:(uses gzip compression when creating a tar file, resulting in a compressed archive with the '.tar.gz' extension)
              -f:(specifies the filename of the archive to be created or extracted)
#### wc comand: (word count-counts words)
       $ wc [option]... [file]
       $ wc -l 
             ^(-l does a line count)              
----------------------------------------------------------------------------------------------------------------------------------------------------------------              
###### Script: simpleifelifelse.sh
       #!/bin/bash

       contents=$(cat simple.txt)
       if [[ $contents == "tacos" ]]; then
              echo "are so good on tuesday"
       elif [[ $contents == "cotsco is amazing" ]]; then
              echo "and you will save money "
       elif [[ $contents == "chicken bake" ]]; then
              echo "tasty but will make you fail ht/wt"
       else
              echo "no tax at commissary"
       fi
###### Other Script: *.sh
       #!/bin/bash

       A=him
       echo The story of Robert who is $A
       echo The $A was at the I am $A store so we could buy some $A sloth$
       echo I am $A
       echo I will remain $A
--------------------------------------------------------------------------------------------------------------------------------------------------------
### Commands to study:
       $ grep: grab strings, look in file 
       $ find: (finds filename, extenstions, outside the file)
              ^ -exec 
              ^ printf: 
       $ rm: (removes files or directories)
       $ touch: (creates or modifies)
       $ if,elif,else: (branching statements)
       $ pkill (kills processes)
       $ tar -czf (compresses via 'Archiving')
-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

# CTFs Q/A 01-15
-------------------------------------------------------------------------------------------------------------------------------------------------------------
## 01 Brace Expansion 
Brace expansion is a mechanism by which arbitrary strings may be generated, for commands that will take multiple arguements. 
For the below examples, the first example is equivalent to the second command.
$ mkdir /var/log/{auth,syslog,dmesg}_log
$ mkdir /var/log/auth_log /var/log/syslog_log /var/log/dmesg_log
create the following directories within the $HOME directory:
* 1123
* 1134
* 1145
* 1156

       mkdir 11{23,34,45,56}
## 01.2 Brace Expansion 
As we learned, the following example would create five files with one command.
touch file1.txt file2.txt file3.txt passwd.txt shadow.txt
But, with Brace Expansion it can be shortened to the following.
touch file{1..3}.txt passwd.txt shadow.txt
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

       touch $HOME/1123/{1,2,3,4,5,6~,7~,8~,9~}.txt
## 01.3 Pattern Matching 
Using the find command, list all files in $HOME/1123 that end in .txt.
Be aware that if you use Pattern Matching to locate the files you may have unintended results based on if you use quotes around the pattern or not. If you do not quote the pattern, the Bash shell interprets the pattern. If you quote the pattern, it is passed to the command for it to interpret. You can have a properly functioning command, yet unintended output, based on which of these two gets to interpret the pattern.

       find $HOME/1123 -name "*.txt"
## 01.3(2) List file (find, grep) 
List all files in $HOME/1123 that end in .txt. Omit the files containing a tilde (~) character.
While this activity can be accomplished with only find, it can also be combined with grep as well.

       find $HOME/1123 -name "*.txt" | grep -v  "~"
## 02 Copy files (find -exec) 
Copy all files in the $HOME/1123 directory, that end in ".txt", and omit files containing a tilde "~" character, to directory $HOME/CUT.
Use only the find and cp commands. You will need to utilize the -exec option on find to accomplish this activity.
The find command uses BOOLEAN "!" to designate that it does not want to find any files or directories that follows.

       find $HOME/1123 -type f -name "*.txt" ! -name "*~*" -exec cp {} $HOME/CUT  \;
## 03 Finding empty files/directories (find -printf) 
Using ONLY the find command, find all empty files/directories in directory /var and print out ONLY the filename (not absolute path), and the inode number, separated by newlines.
Tip: When using the man pages, it is better to focus your search then to visually scan 1000+ lines of text. Combining the output with the grep command, possibly with its -A, -B, or -C options, can help drive context driven searches of those manual pages.
Example Outputs:
123 file1
456 file2
789 file3

       find /var -empty -printf "%i %f\n" 
## 04 Finding inode Number (find -printf) 
Using ONLY the find command, find all files on the system with inode 4026532575 and print only the filename to the screen, not the absolute path to the file, separating each filename with a newline. Ensure unneeded output is not visible.
Tip: The above inode is specific to this CTFd question and might not be in use on your Linux Opstation. Instead, you can test your command on your Linux OpStation against inode 999.
* ensure uneeded output is not visible (/dev/null)

       find / -inum 4026532575 2>/dev/null -printf "%f\n"
## 05 bash script show all filenames/ extensions (ls -l, cut) 
Using only the ls -l and cut Commands, write a BASH script that shows all filenames with extensions ie: 1.txt, etc., but no directories, in $HOME/CUT.
Write those to a text file called names in $HOME/CUT directory.
Omit the names filename from your output.
NOTE: The output should only be the file names with no additional information. Additionally, your code will be executed twice. This is to ensure you have taken into account how file redirection and command execution works.

       #!/bin/bash

       $ ls -l $HOME/CUT | cut -d: -f2 -s| cut -d ' ' -f2 -s| cut -d. -f1-2 -s > $HOME/CUT/names  


## 06 bash script to GREP ipAddresses(cat, grep, sort, uniq)  
Write a basic bash script that greps ONLY the IP addresses in the text file provided (named StoryHiddenIPs in the current directory); sort them uniquely by number of times they appear.
t is not important to have a regular expression that only catches fully valid IP addresses. It is more important that you become familiar with creating and using regular expressions. Below, there are some useful websites that you can use to visually see what your regular expression pattern is matching on.
Bracket Expression: [1-4] = 1 or 2 or 3 or 4
Repetitions: {0,5} = above numbers (1,2,3,4) appear from 0 to 5 times, meaning our number can be between 1 and 44444
Interpreted BASH Chars: . | $ ` \ ! must be escaped with \ in a regex. I.E. to match on a backslash, you must use \\ in your pattern.
Note: The basics of regular expressions are assumed knowledge for this module, and you will need to call back to prior learning. If you are in need of a quick refresher, the following man pages could be useful.
man egrep
man regex.7

       cat StoryHiddenIPs | grep -E -o "([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})" | sort -n | uniq -c | sort -nr
## 07 bash 1-liner script extracting UIDs, shells (cat, awk) 
Using ONLY the awk command, write a BASH one-liner script that extracts ONLY the names of all the system and user accounts that are not UIDs 0-3.
Only display those that use /bin/bash as their default shell.
The input file is named $HOME/passwd and is located in the current directory.
Output the results to a file called $HOME/SED/names.txt
Tip: awk can use conditional statements, e.g. print only the line in /etc/passwd that has "root" as its first field.

       cat $HOME/passwd | awk -F: '($3>3)' | awk -F: '($7 == "/bin/bash") {print $1}' > $HOME/SED/names.txt
## 08 Finding kernel messages "CPU|BIOS" "Unusable|Reserved" (dmesg, cut, grep) 
Find all dmesg kernel messages that contain CPU or BIOS (uppercase) in the string, but not usable or reserved (case-insensitive)
Print only the msg itself, omitting the bracketed numerical expressions ie: [1.132775]
Note: For security reasons, the dmesg command is being emulated on the CTFd backend. You can still use it as normal on your Linux OpStation, but to get a similar output, do not use any dmesg switches. The intent of this activity is to take raw dmesg output and combine it with grep and either awk or cut to manipulate the output into a desired end state.
Tip: As you may have noticed, when using grep you can simulate a logical AND by piping the output of one grep command to the next. This will filter down your output to only what contains all your patterns. But, for this activity, you will need to use a logical OR to match on a wide range of strings. If you do not recall how to utilize that option in grep, go research it from the resources available to you.

       dmesg | grep -E 'CPU|BIOS' | cut -d] -f2- | grep -v -E 'usable|reserved'
## 09 Command Subtitution Script (awk) 
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
/etc/passwd-> user:x:UID:GID:GECOS:Home_Dir:Command/Shell
/etc/shadow-> user:$1$fnfffc$qzwexrecdtvryu#21:13064:0:99999:7:::

       a=$(openssl passwd -1 -salt bad4u Password1234)
       awk -F: -v "awk_var=$a" 'BEGIN {OFS=":"} {$2=awk_var} {print $0}' $HOME/PASS/shadow.txt
## 10 Writing lines from/to (sed) 
Using ONLY sed, write all lines from $HOME/passwd into $HOME/PASS/passwd.txt that do not end with either /bin/sh or /bin/false.
TIP: When designating a path in a sed command, you must escape the path characters if they are to be interpreted as part of the string
sed '/\/bin/d' file.txt

       sed -e '/\/bin\/sh/d -e /\/bin\/false/d' $HOME/passwd > $HOME/PASS/passwd.txt
## 11 Finding all files .bin (find -printf, rev, cut, sort) 
Using find, find all files under the $HOME directory with a .bin extension ONLY.
Once the file(s) and their path(s) have been found, remove the file name from the absolute path output.
Ensure there is no trailing / at the end of the directory path when outputting to standard output.
You may need to sort the output depending on the command(s) you use.
Tip: For stripping the filename out of the output, there are different ways that this can be accomplished based on what you have learned so far.
Utilizing -printf options on find.
Utilizing awk to manipulate the fields. This may leave the trailing / if you don't take that into account.
Utilizing the rev and cut commands creatively.

       find ./ -type f -iname "*.bin" | awk -F./ '{print$0}' | rev | cut -d/ -f2- | rev | sort -u
## 12 Write a script to copy lines by parameter (tail, awk)
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

       file=$1
       name=$2
       id=$3
       tail -1 $file | awk -F: -v "username=$name" -v "uid=$id" 'BEGIN {OFS=":"}{$1=username}{$3=uid}{$4=uid}{$6="/home/"username}{$7="/bin/bash"}{print $0}' >> $file
## 13 Find all file in specified DIRs, then try hashing them (find, sort, head, tail, md5sum, cut) 
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

       MD5=$(find /bin /sbin /usr/bin /usr/sbin -executable -type f | sort | head | tail -1)
       md5sum $MD5 | cut -d" " -f1
## 14 Sort /etc/passwd numerically by GID, hash the 10th entry in the DIR, output md5 hash stdout (cut, sort, head, tail, md5sum) 
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

       GID=$(cut /etc/passwd -d: -f4- | sort -n | head | tail -1 | cut -d: -f3) 
       echo $GID | md5sum | cut -d" " -f1
## 15 Write a Script that looks 3 levels deep in specified DIRs, exclude pipes, redirect to stdout & stderr, get count of "Successfully" hashed files/"Unsuccessfully" hashed files (find -maxdepth, -exec, md5sum, echo) 
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

       find /bin /etc /var -maxdepth 3 ! -type p -exec md5sum {} 1>output.txt 2>errors.txt \;
       Out=$(wc -l < output.txt)
       Err=$(grep -c "Is a directory" errors.txt)
       echo "Successfully Hashed Files: $Out"
       echo "Unsuccessfully Hashed Directories: $Err"

----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------

# Better Examples
----------------------------------------------------------------------------------------------------------------------------------------------------------------
# 01
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

       sed -e "s/cat/dog/g" -e "s/Navy/Army/g" $1 >> $2

instructor's below:       
       
       sed -e "s/cat/dog/g" -e "s/Navy/Army/g" $1 >> $2
# 02
Create a script that will print to standard output all user names from the /etc/passwd file.
function q1()
{
#Valid Variables are:
#none
#You code here
no tax at commissary" fi '''
}

       awk -F: '{print $1}' /etc/passwd names.txt

instructor's below:
       
       cut -d':' -f1 /etc/passwd 

# 03
Create a script that will perform the following actions:
Print to standard output all usernames from the file path specified by the parameter filename sorted ascending numerically by user id.
The file will be in the format of /etc/passwd
function q1()
{
#Valid Variables are:
filename=$1
#Your code here
}

       sort -n -t: -k3 $filename | cut -d':' -f1

# 04
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

       ls -1 $dirname | wc -l

# 05
Create a script that will perform the following actions:
Delete all files contained in the directory specified by dirdel
Also delete the directory specified by dirdel
function q1()
{
#Valid Variables are:
dirdel=$1
#Your code here
}

       rm -r $dirdel

# 06
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

       touch -t "$filedate"1730 $newfile

# 07
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

       cont=$(cat $fname)
       if [[ $cont -lt 10 ]]; then 
         echo "single digit" 
       elif [[ $cont -lt 100 ]]; then 
         echo "double digit" 
       elif [[ $cont -lt 1000 ]]; then 
         echo "triple digit" 
       else 
         echo "Error"

# 08
Copy all lines from the file specified by src variable to the file specified by dst variable which DO NOT contain the text specified by match variable.
function q1()
{
#Valid Variables are:
src=$1
dst=$2
match=$3
#Your code here
}

       cat $src | grep -v $match > $dst

# 09
Terminate the process that has the randomly assigned name specified by procname variable. procname does not contain path information.
function q1()
{
#Valid Variables are:
procname=$1
#Your code here
}

       killall $procname

  or

       pkill $procname

# 10
Create a sorted full-path list of all files in the directory dirpath that were modified within the previous day. Directories should not be included in the output. Print the list to the screen, one item per line.
NOTE: The full paths to files should be in your output. (i.e. /etc/passwd would be included)
NOTE: Directory entries should not be included. (i.e. /etc would NOT be included)
function q1()
{
#Valid Variables are:
dirpath=$1
#Your code here
}

       find $dirpath -type f -mtime -1 | sort
