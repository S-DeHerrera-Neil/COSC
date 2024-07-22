# Bash
* Student Guide is at: https://cted.cybbh.io/tech-college/pns/public/pns/latest/guides/bash_sg.html

We start CTFs this week, 

07/15

nano(better than vi/vim)

mkdir -p (makes a parent directory)

rm -rf(removes forceably)

rmdir (removes directory)

ls -lisa 
  * can also do ls -1 (puts 1 item per line)

pwd (print working directory)sudo cat /etc/shadow >> fake1passwd.txt

cp <source> <destination> (copy)
      /etc/shadow    ()
      sudo cat /etc/shadow >> fake1passwd.txt (can work from the directory of touch the desired directory)

cat

head (default first 10)

tail (default last 10)

umask

find(shows the directory that the file is found)

find -name (case sensative file)

find -iname (case insensativity)

find -inum(finds files off of the inode number)

find -size(for finding files based off of it's size)

/etc/passwd
 
 find -group name
 find -gid<GID#>

cat /etc/passwd | grep " student " (gets /etc/passwd file then greps to student) 
 find -uid <UID#>

find -maxdepth<#of directories deep>(telling find how deep find needs to look in a directory)

find / -type d(finds directories)
find / -type f(finds files)
