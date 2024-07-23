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
      /etc/shadow    (user:::::::::)
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
* (cut and awk)

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
$ awk fakepasswd | awk -F: '{print $1}'
