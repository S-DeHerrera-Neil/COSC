# Bash
* Student Guide is at: https://cted.cybbh.io/tech-college/pns/public/pns/latest/guides/bash_sg.html

       We start CTFs this week 

07/22

nano(better than vi/vim)

$ mkdir -p (makes a parent directory)

$ rm -rf(removes forceably)

$ rmdir (removes directory)

$ ls -lisa 
  * can also do ls -1 (puts 1 item per line)

$ pwd (print working directory)sudo cat /etc/shadow >> fake1passwd.txt

$ cp <source> <destination> (copy)
      /etc/shadow    ()
      sudo cat /etc/shadow >> fake1passwd.txt (can work from the directory of touch the desired directory)
# cat
$ cat /etc/passwd | grep " student " (gets /etc/passwd file then greps to student) 
 find -uid <UID#>


$ head (default first 10)

$ tail (default last 10)

$ umask

# Find: (shows the directory that the file is found)

$ find -name (case sensative file)

$ find -iname (case insensativity)

$ find -inum(finds files off of the inode number)

$ find -size(for finding files based off of it's size)

$ find /etc/passwd
 
$ find -group name
 
$ find -gid<GID#>

$ find -maxdepth<#of directories deep>(telling find how deep find needs to look in a directory)

$ find / -type d(finds directories)


$ find / -type f(finds files)

$ find -atime

$ find -ctime

$ find -mtime

$ find $HOME -mtime 0

$ find cmin -60

$ find -mmin -60

$ find -empty

$ find -executable

$ find -exec

cp <source> <destination> (copy)
      /etc/passwd [7 lines]    


# Passwd : 
       * user:x:UID:GID:GECOS:Home_Dir:Command/Shell

(1) user:

(2) Password:

(3) User ID(UID):

(4) Group ID (GID):

(5) User ID Info (GECOS):

(6) Home Direcory:

(7) Command/Shell):

      sudo cat /etc/shadow >> fake1passwd.txt (can work from the directory of touch the desired directory)

# error code handling 
$ find / perm /4000 -uid 0 -ls 2>/dev/null
  
$ find /var/log -iname *.log -exec -l -al () 2>/dev/null \:

$ find /var/log -iname *.log 2>/dev/null -printf "%i %f\n" (%i and %f - shows the inode# then the file)
                         * printf example ^ :https://phoenixnap.com/kb/bash-printf


* find -exec example(url:https://linuxhandbook.com/find-exec-command/)

# GREP: (grep lines that match a pattern/input)
* grep
* egrep

$ grep -i(case insensative) -n(line numbers) -v(inverts your search)-TopGun referance

$ cat /fake1passwd.txt |grep /bin/bash (look at what the users shell is)
 * cut and awk: (helps with filtering)

$ egrep "student|root|bob" fake1passwd.txt
(egrep <student,root,bob> in the fake1passwd.txt file)

# differences between brackets 
* (https://baeldung.com/linux/bash-single-vs-double-brackets)

# CTF challenges <Rank, LName>
10.50.26.116

# Brace Expansion
$ mkdir cosc11{23,45,67} (makes mutiple directories in the same directory)

# Cut (Cuts where specified)
$ cat fake1passwd.txt | cut -d: -f1 
                            ^(-d: [delimiter] -f1[Field 1])

$ cat fake1passwd | cut -d: -f1 -s
                     ^([-s strict, only from the delimiter])

# Chaining operators
* & -runs process in background
* && - AND
* || -OR, ! -NOT,
* | -Pipes, redirects output
* () -looks at it first
* ">" -creates file
* ">>" -creates file and/or appends to file

07/23

# awk (advanced language w/in bash)
* $ awk fakepasswd | awk -F: '{print $1}'
                            ^{print $NF}
* $ awk -F: '($3 == 0){print $1}' fakepasswd

* $ awk -F 'BEGIN {OFS="@"} {print $1, $3}' fakepasswd
               ^ Output Filed Seperator
* $ cat /etc/passwd | awk -F: '($3 >= 150){print $0}'

* $ cat /etc/passwd | awk -F: '($3 >= 150){print $1, $6, $3}'

* $ cat /etc/passwd | awk -F: '($7 == "/bin/bash"){print $1, $6, $3}' fakepasswd

* $ cat /etc/passwd | awk -F: '($7 == "usr/sbin/nologin"){print $1, $6, $3}' fakepasswd

### sort (have to generate output[file has to be before it])
       * -n
       * -nr
       * -t
       * -k
       * -u
       * -uniq ^different than (has to have sort)
       
* $ awk -F: '{print3}' fakepasswd | sort

* $ awk -F: '{print3}' fakepasswd | sort -n

* $ awk -F: '{print3}' fakepasswd | sort -nr

* $ cat fakepasswd | sort -t : -k 2,4 

$ ps aux  | sort -k 1 

$ cat fake1passwd.txt | sort -t : -k 1 | uniq

# Regex
       *website URL: https://regex101.com/library

# aliases(naming something else, to do something else)
alais vim= 'nano'

       * String editor utility
ls -l

cat pizza.txt

sed -e 's/chicken/hamburger/g' -e 's/pepperoni/sausage/' pizza.txt
    
    *replace chiken with hamburger ^/g = global so every instance.       
    *replace pepperoni with sausage ^/ = not global so only the first occasion.

sed -e 'chicken/d' pizza.txt

    *delete chicken globally.

# command substitution
       *Script to replace the command (cat /etc/) 

# script.sh
#!/bin/bash

A=$(cat /etc/passwd)

echo $A

# script comsub.sh
#!bin/bash

A=$(find /usr/bin -name passwd


echo $A

echo md5sum $A

echo file $A
