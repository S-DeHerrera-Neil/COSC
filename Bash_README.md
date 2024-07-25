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
$ sudo cat /etc/shadow >> fake1passwd.txt (can work from the directory of touch the desired directory)
###### error code handling 
       $ find / perm /4000 -uid 0 -ls 2>/dev/null
       $ find /var/log -iname *.log -exec -l -al () 2>/dev/null \:
       $ find /var/log -iname *.log 2>/dev/null -printf "%i %f\n" (%i and %f - shows the inode# then the file)
                                                 ^printf example > (https://phoenixnap.com/kb/bash-printf)
#### grep command:(){grep lines that match a pattern/input}
       $ grep
       $ egrep
       $ grep -i(case insensative) -n(line numbers) -v(inverts your search)-TopGun referance
       $ cat /fake1passwd.txt | grep /bin/bash (look at what the users shell is)
       $ egrep "student|root|bob" fake1passwd.txt
              ^(egrep <student,root,bob> in the fake1passwd.txt file)
commands cut and awk help with filtering
#### differences between brackets 
       (https://baeldung.com/linux/bash-single-vs-double-brackets)
### Brace Expansion
$ mkdir cosc11{23,45,67} (makes mutiple directories in the same directory)

### Cut (Cuts where specified)
$ cat fake1passwd.txt | cut -d: -f1 
                            
                            ^(-d: [delimiter] -f1[Field 1])
                            ^([-s strict, only from the delimiter])
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
#### sort command:()
       "have to generate output file has to be before it"
        options:
       * -n (numeric sort)
       * -r (reverse the result of comparisons) 
       * -nr (numeric reverse)
       * -t (for delimters)
       * -k ()
       * -u ()
       * -uniq () 
           ^different than (has to have sort)
       
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
