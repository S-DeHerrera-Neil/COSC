
JumpBox IP: 10.50.37.98

Scheme of Maneuver:
>Jump Box
->Network scan: 192.168.28.96/27
-->Network scan:192.168.150.224/27
----------------------------------------------------------------------------
	lin-ops(1):
* Create Socket File, that port forwards to the JumpBox:	
ssh -MS /tmp/jump student@10.50.37.98
	password:
v0cEcUbwIzY878p
	
	student@jump(1):

* Conduct Host Discovery via ping:
for i in {96..127}; do (ping -c 1 192.168.28.$i | grep "bytes from" &) ; done

* Devices enumerated via ping sweep:
	192.168.28.97
	192.168.28.99
	192.168.28.100
	192.168.28.105
	192.168.28.111
	192.168.28.120
-----------------------------------------
	lin-ops(2):
* Create a Socket File, for Dynamic Tunnel:
ssh -S /tmp/jump jump -O forward -D 9050
	
	student@jump(2):
* Validate the process has been created:
ss -ntlp

* Ports enumeration via nmap:
proxychains nmap 192.168.28.97,99,100,105,111,120
							192.168.28.99 :53 -Disregard
	192.168.28.100 :80,2222 
	192.168.28.105 :21,23,2222
	192.168.28.111 :80,2222,8080
	192.168.28.120 :4242

proxychains nc 192.168.28.100 80
 * ^ banner grab every device that has been enumerated
 
 * Ports validated via nc:
							192.168.28.99 :53() -Disreguard
	192.168.28.100 :80(http), 2222(ssh)
	192.168.28.105 :21(ftp), 23(telnet) 2222(ssh)
	192.168.28.111 :80(http), 2222(ssh), 8080(http)
	192.168.28.120 :4242(ssh)
-----------------------------------------------
	lin-ops(3):
* Close Socket File, that has the Dynamic Tunnel:
ssh -S /tmp/jump -O cancel -D 9050

* Referance Socket File /tmp/jump, for port forwards to every device with ssh:
ssh -S /tmp/jump jump -O forward -L 127.0.0.1:1111:192.168.28.100:2222 -L 127.0.0.1:2222:192.168.28.105:2222 -L 127.0.0.1:3333:192.168.28.111:2222 -L 127.0.0.1:4444:192.168.28.120:4242 

* verify if your changes happened:
ss -ntlp

* ports and their corresponding boxes:
ssh student@127.0.0.1 -p 1111 (.100)
ssh student@127.0.0.1 -p 2222 (.105)
ssh student@127.0.0.1 -p 3333 (.111)
ssh student@127.0.0.1 -p 4444 (.120)

* Referance Socket File /tmp/jump, for port forwards to 2 of the hosts with http:
ssh -S /tmp/jump jump -O forward -L 127.0.0.1:5555:192.168.28.100:80 -L 127.0.0.1:6060:192.168.28.111:80 -L 127.0.0.1:7777:192.168.28.111:8080  

* ports and their corresponding boxes:
ssh student@127.0.0.1 -p 5555 (.100)
ssh student@127.0.0.1 -p 6060 (.111)
ssh student@127.0.0.1 -p 7777 (.111)



* GET any files you can from the .105 box via FTP:
proxychains wget-r ftp://192.168.28.105

* Information that was pulled:
FOGXVhUuARKsymBwTRov  ServerInitialization  welcome.msg

	* in ServerInitialization
PassTemporary
loginfirst
logout null bit
houseBeatFliesLOW
YourTempPassword

------------------------------------------------------------
	lin-ops(1):
* Open Firefox and navigate to the 2 Websites:
firefox &
	* in Firefox

* You should see 3 Websites:
1. Donovian Government
2. Donovian National Consulting
3. Workshop-SaZXxd7CQ7PAgxBeHYiN

---------------
* speakers:
Emely Peters
Alex Anchor
Aaron Thomas
Chris Mathews


UcYK6WTmDNk97uoG9KJf

