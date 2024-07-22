# Bash CTFd Base challenges
  * 07/22/2024
# 01
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

* Desired Input
"$ mkdir 11{23,34,45,56}"

# 01.2
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
* 2.txt
* 3.txt
* 4.txt
* 5.txt
* 6~.txt
* 7~.txt
* 8~.txt
* 9~.txt

* Desired Input
"$ touch $HOME/1123/{1,2,3,4,5,6~,7~,8~,9~}.txt"

# 01.3
Activity:

Using the find command, list all files in $HOME/1123 that end in .txt.

Be aware that if you use Pattern Matching to locate the files you may have unintended results based on if you use quotes around the pattern or not. If you do not quote the pattern, the Bash shell interprets the pattern. If you quote the pattern, it is passed to the command for it to interpret. You can have a properly functioning command, yet unintended output, based on which of these two gets to interpret the pattern.

Helpful URLs:
* https://www.gnu.org/software/bash/manual/bash.html#Pattern-Matching

*https://www.gnu.org/software/bash/manual/bash.html#Quoting

* Desired Input
"$ find $HOME/1123 -name "*.txt""

# 01.3(#2)
Challenge Activity:

List all files in $HOME/1123 that end in .txt. Omit the files containing a tilde (~) character.

While this activity can be accomplished with only find, it can also be combined with grep as well.

* Desired Input
"$ find $HOME/1123 -name "*.txt" | grep -v  "~""

# 02
Activity:

Copy all files in the $HOME/1123 directory, that end in ".txt", and omit files containing a tilde "~" character, to directory $HOME/CUT.

Use only the find and cp commands. You will need to utilize the -exec option on find to accomplish this activity.

The find command uses BOOLEAN "!" to designate that it does not want to find any files or directories that follows.
* Desired Input
find $HOME/1123 -type f -name "*.txt" ! -name "*~*" -exec cp {} $HOME/CUT  \;
# 03
Activity:

Using ONLY the find command, find all empty files/directories in directory /var and print out ONLY the filename (not absolute path), and the inode number, separated by newlines.

Tip: When using the man pages, it is better to focus your search then to visually scan 1000+ lines of text. Combining the output with the grep command, possibly with its -A, -B, or -C options, can help drive context driven searches of those manual pages.

Example Output

123 file1
456 file2
789 file3
* Desired Input
 find /var -empty -printf "%i %f\n" 
# 04
Activity:

Using ONLY the find command, find all files on the system with inode 4026532575 and print only the filename to the screen, not the absolute path to the file, separating each filename with a newline. Ensure unneeded output is not visible.

Tip: The above inode is specific to this CTFd question and might not be in use on your Linux Opstation. Instead, you can test your command on your Linux OpStation against inode 999.
* Desired Input
 find / -inum 4026532575 2>/dev/null -printf "%f\n" 
* 
# 05
Activity:

Using only the ls -l and cut Commands, write a BASH script that shows all filenames with extensions ie: 1.txt, etc., but no directories, in $HOME/CUT.
Write those to a text file called names in $HOME/CUT directory.
Omit the names filename from your output.
NOTE: The output should only be the file names with no additional information. Additionally, your code will be executed twice. This is to ensure you have taken into account how file redirection and command execution works.

To read more on Redirecting Output, go to the following resource:

https://www.gnu.org/software/bash/manual/bash.html#Redirecting-Output
To read more on Simple Command Expansion, go to the following resource:

https://www.gnu.org/software/bash/manual/bash.html#Simple-Command-Expansion
* Desired Input
#!/bin/bash
ls -l $HOME/CUT | cut -d: -f2 -s| cut -d ' ' -f2 -s| cut -d. -f1-2 -s > $HOME/CUT/names  
