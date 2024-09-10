q1.
T3 is the authorized initial pivot

Conduct passive recon on the Target T3, it appears to have access to the 10.3.0.0/24 subnet.

    Create a Local Port Forward from your Internet_Host to T3 targeting:

ip: 10.3.0.27
port: `HTTP``

The flag is the answer to the question found on Victoria's HTTP Server

*Hint:
internet_host$ ssh netX_studentX@{T3_float_ip} -L NssXX:10.3.0.27:80 -NT
*

--------------------------------------------------------------------------------------------------
q2.
T3 is the authorized initial pivot

Conduct passive recon on the Target T3, it appears to have access to the 10.3.0.0/24 subnet.

    Create a Dynamic Port Forward from Internet_Host to T3 then use proxychains to pull the flag.

Target ip: 10.3.0.1

The flag is the answer to the question found on Cortina's FTP Server

*Hint:
internet_host$ ssh netX_studentX@{T3_float_ip} -D 9050 -NT
*

---------------------------------------------------------------------------------------------------
q3.
Access to T4 has been provided via telnet.

This is a Compromised host within Donovia

Leverage this internal access to act as an insider threat throughout this Grorgan Cyber Training Operation.

Conduct passive recon on this host and determine where the shared location for data relating to CCTC is on the machine.

The flag is the answer to the question found on Pineland

*Hint:
find / -name hint* 2> /dev/null

find / -name flag* 2> /dev/null
*

---------------------------------------------------------------------------------------------------
q4.
T3 is the authorized initial pivot

Conduct passive recon on the Target T4, it appears to have access to the 10.2.0.0/25 subnet.

    Create a Remote Port Forward from T4 to T3, binding the source as one of your authorized ports from the Mission Prompt, targeting:

ip: 10.2.0.2 port: HTTP

    Create a Local Port Forward from Internet_Host to T3 targeting the port you just established.

When creating tunnels your authorized port ranges to utilize are NssXX (N = Net number, ss = Student Number and XX = student assigned port number)

    Use curl or wget to pull the flag.

The flag is the answer to the question found on Mohammed HTTP Server

*Hint:
	1.
internet_host$ telnet {T4_float_ip}

pineland$ ssh netX_studentX@{T3_inside_ip} -R NssXX:localhost:22 -NT
	2.
internet_host$ ssh netX_studentX@{T3_float_ip} -L NssXX:localhost:NssXX -NT
	3.
internet_host$ ssh netX_studentX@localhost -p NssXX -L NssXX:10.2.0.2:80 -NT
	4.
curl http://localhost:NssXX

wget -r http://localhost:NssXX
*
---------------------------------------------------------------------------------------------------
q5.
T3 is the authorized initial pivot

    Build a Dynamic tunnel to T4 and conduct active recon to find the Mohammed host.

The flag is the answer to the question found on Mohammed's FTP Server.

*Hint:
1.
internet_host$ ssh netX_studentX@localhost -p NssXX -D 9050 -NT
2.
proxychains ./scan.sh
3.
proxychains wget -r ftp://10.2.0.2
*
- You have accessed Mohammed's FTP server. The flag is the answer to the following question: "Which file is used to configure default settings for the SSH client on a Linux system, including options for connection preferences and behaviors? (provide the complete path)"

:sshd_config
---------------------------------------------------------------------------------------------------
q6.
T3 is the authorized initial pivot

    Build a Dynamic tunnel to T3 and conduct active recon to find the Cortina host.

The flag is the answer to the question found on Cortina's HTTP Server

*Hint:
1.
internet_host$ ssh netX_studentX@{T3_float_ip} -D 9050 -NT
2.
proxychains ./scan.sh
3.
proxychains wget -r http://10.3.0.1
*
---------------------------------------------------------------------------------------------------
q7.
T3 is the authorized initial pivot

    Use your Dynamic tunnel to T3 and conduct active recon to find the Victoria host.

The flag is the answer to the question found on Victoria's FTP Server

*Hint:
proxychains wget -r ftp://{victoria_ip}
*
---------------------------------------------------------------------------------------------------
q8.
T3 is the authorized initial pivot

    You will need to conduct a search for clues for the network address of the Mojave host.

The flag is the answer to the question found on Mojave's FTP Server

*Hint:
1.
find hint in the 10.2.0.0/24 network
2.
proxychains ./scan.sh

*Scan for new network
3.
internet_host$ ssh netX_studentX@{T3_float_ip} -L NssXX:{next_pivot_ip}:22 -NT
4.
internet_host$ ssh netX_studentX@localhost -p NssXX -D 9050 -NT
5.
proxychains ./scan.sh
6.
proxychains wget -r ftp://{mojave_ip}
*
---------------------------------------------------------------------------------------------------
q9.
T3 is the authorized initial pivot

The flag is the answer to the question found on Mojave's HTTP Server

*Hint:
proxychains wget -r http://{mojave_ip}
*
---------------------------------------------------------------------------------------------------
q10.
T3 is the authorized initial pivot

    Parumphia is co-located with Mojave.

The flag is the answer to the question found on Parumphia's FTP Server

*Hint:
proxychains wget -r ftp://{parumphia_ip}
*
---------------------------------------------------------------------------------------------------
q11.
T3 is the authorized initial pivot

The flag is the answer to the question found on Parumphia's HTTP Server

*Hint:
proxychains wget -r http://{parumphia_ip}
*
---------------------------------------------------------------------------------------------------
