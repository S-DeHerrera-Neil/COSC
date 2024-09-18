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
Jump Box Website:
  10.50.36.14/classinfo.html
Username format:
  NEDE-006-M
Stack Number:	  	      	          
  * 6
Username:
  * NEDE-006-M
Password:
  * v0cEcUbwIzY878p
JumpBox:
  * 10.50.37.98
```
### vta instances:
```
  windows_opstation_QiJd (win_ops):
10.50.39.134
  Commands:
xfreerdp /v:10.50.39.134 /u:student /p:password /size:1920x1000 +clipboard
  Credentials:
Username:
  student
Password:
  password

  linux_opstation_QiJd (nix_ops):
10.50.27.61
    Commands:
ssh student@10.50.27.61 -X
  Credentials:
Username:
  student
Password:
  password
```
### CTFD Server:
```
10.50.20.30:8000
  Username:
NEDE-006-M
  Password:
v0cEcUbwIzY878p
```

## Tunnels!!!! is Security's better?
  MS(Master Socket)

```
## set up connection jump box

  lin-ops:
$ ssh -MS /tmp/jump student@10.50.37.98
  password: v0cEcUbwIzY878p
  student@jump:
$ for i in {1..254}; do (ping -c 1 192.168.28.$i | grep "bytes from" &) ; done
  * Copy the IPs that were ping sweeped against.
-

  lin-ops:
$ ssh -S /tmp/jump jump -O forward -D9050
  student@jump:
$ ss -ntlp
  * Port Enumeration
$ proxychains nmap {IPs enumerated}  
  * Port Validation (Interrogation)
$ proxychains nc {IP} {port}
-

      *Port Forward*
  lin-ops:
$ ssh -S /tmp/jump jump -O cancel -D9050
$ ssh -S /tmp/jump jump -O forward -L127.0.0.1:2222:192.168.28.100:80 -L127.0.0.1:3333:192.168.28.100:2222 -L127.0.0.1:5555:[DifferentIP]:DifferentPort
$ ss -ntlp
$ firefox
  * In Firefox URL: 127.0.0.1:2222 ^as specified above *

$ ssh -MS /tmp/tgt1 creds@127.0.0.1 -p 3333
$ ssh -S /tmp/tgt1 tgt1 -O forward -L127.0.0.1:6666:192.168.10:22 -L127.0.0.1:7777:192.168.50.20:22
$ssh -MS /tmp/tgt2 creds@127.0.0.1 -p 6666


```

## Admin Tools (proxychains??):
```
nmap
  nmap scripts locations:
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




