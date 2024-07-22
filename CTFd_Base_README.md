# Bash CTFd Base challenges
  * 07/22/2024

    # 01
Brace expansion is a mechanism by which arbitrary strings may be generated, for commands that will take multiple arguements. 
For the below examples, the first example is equivalent to the second command.
'''
$ mkdir /var/log/{auth,syslog,dmesg}_log
'''
Results in
'''
$ mkdir /var/log/auth_log /var/log/syslog_log /var/log/dmesg_log
'''
Activity: Using Brace-Expansion, create the following directories within the $HOME directory:
* 1123
* 1134
* 1145
* 1156
    helpful url: https://www.gnu.org/software/bash/manual/bash.html#Brace-Expansion

    # 01.2
As we learned, the following example would create five files with one command.
'''
touch file1.txt file2.txt file3.txt passwd.txt shadow.txt
'''
But, with Brace Expansion it can be shortened to the following.
'''
touch file{1..3}.txt passwd.txt shadow.txt
'''
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

    # 01.3
Activity:

Using the find command, list all files in $HOME/1123 that end in .txt.

Be aware that if you use Pattern Matching to locate the files you may have unintended results based on if you use quotes around the pattern or not. If you do not quote the pattern, the Bash shell interprets the pattern. If you quote the pattern, it is passed to the command for it to interpret. You can have a properly functioning command, yet unintended output, based on which of these two gets to interpret the pattern.

Helpful URLs 

# 01.3(#2)
