BIH: 
> sudo nft list ruleset
> sudo nft add table ip CCTC
> sudo nft add chain ip CCTC INPUT { type filter hook input priority 0 \; policy accept \; }
> sudo nft add chain ip CCTC OUTPUT { type filter hook output priority 0 \; policy accept \; }
> sudo nft delete chain ip CCTC OUTPUT
> sudo nft list ruleset
> sudo nft insert rule ip CCTC INPUT tcp dport 22 accept
> sudo nft insert rule ip CCTC INPUT tcp sport 22 accept
> sudo nft insert rule ip CCTC OUTPUT tcp dport 22 accept
> sudo nft insert rule ip CCTC OUTPUT tcp sport 22 accept
> sudo nft list ruleset -ann
or
> sudo nft list table ip CCTC -ann
> sudo nft add rule ip CCTC INPUT tcp dport { 6010, 6011, 6012 } ct state { new, established } accept
> sudo nft add rule ip CCTC OUTPUT tcp dport { 6010, 6011, 6012 } ct state { new, established } accept
> sudo nft add rule ip CCTC INPUT tcp sport { 6010, 6011, 6012 } ct state { new, established } accept
> sudo nft add rule ip CCTC OUTPUT tcp sport { 6010, 6011, 6012 } ct state { new, established } accept

* Exercise Caution *
> sudo nft add chain ip CCTC INPUT { \; policy drop \; }
> sudo nft add chain ip CCTC OUTPUT { \; policy drop \; }

> sudo nft insert rule ip CCTC INPUT ip saddr 172.16.82.106 drop
> ping 172.16.82.106
> sudo nft insert rule ip CCTC OUTPUT ip daddr 172.16.82.106 drop
> sudo nft add rule ip CCTC INPUT ip saddr 172.16.40.10 accept
> sudo nft add rule ip CCTC OUTPUT ip daddr 172.16.40.10 accept
> ping 172.16.40.10
> sudo nft list table ip CCTC

> sudo nft add chain ip CCTC INPUT { \; policy accept \; }
> sudo nft add chain ip CCTC OUTPUT { \; policy accept \; }
> sudo nft list table ip CCTC
> sudo nft flush table ip CCTC
> sudo nft list table ip CCTC


nat
0c2ca80fad4accccce3bcecec1d238ce
be33fe60229f8b8ee22931a3820d30ac
e4f4c65b3884eadf7986adc76caea32c
-------------------------------------------------------------------------------------------------------

# CTF

## Task 3
BPF
Basic Analysis - ttl
What is the Berkeley Packet Filter, using tcpdump, to capture all packets with a ttl of 64 and less, utilizing the IPv4 or IPv6 Headers? There should be 8508 packets.
sudo tcpdump -n 'ip and (ip[8] <= 64) or ip6 and (ip6[7] <= 64)' -r BPFCheck.pcap | wc -l

Basic Analysis - dont fragment
What is the Berkeley Packet Filter, using tcpdump, to capture all IPv4 packets with at least the Dont Fragment bit set? There should be 2321 packets.
sudo tcpdump -n 'ip[6] & 0x40 != 0' -r BPFCheck.pcap | wc -l

Basic Analysis - high port
What is the Berkeley Packet Filter, using tcpdump, to capture traffic with a Source Port higher than 1024, utilizing the correct Transport Layer Headers? There should be 7805 packets.
sudo tcpdump -n 'tcp[0:2] > 1024 || udp[0:2] > 1024' -r BPFCheck.pcap | wc -l

Basic Analysis - udp
What is the Berkeley Packet Filter, using tcpdump, to capture all Packets with UDP protocol being set, utilizing the IPv4 or IPv6 Headers? There should be 1277 packets.
sudo tcpdump -n 'ip[9] = 0x11 || ip6[6] = 0x11' -r BPFCheck.pcap | wc -l

Basic Analysis - tcp flags
What is the Berkeley Packet Filter, using tcpdump, to capture packets with only the ACK/RST or ACK/FIN flag set, utilizing the correct Transport Layer Header? There should be 1201 packets.
sudo tcpdump -n 'tcp[13]=0x14||tcp[13]=0x11' -r BPFCheck.pcap | wc -l

Basic Analysis - id
What is the Berkeley Packet Filter, using tcpdump, to capture all packets with an IP ID field of 213? There should be 10 packets.
Enter the Filter syntax with no spaces
TCPDUMP Primitives are not accepted as answers
sudo tcpdump -n 'ip[4:2]=213' -r BPFCheck.pcap | wc -l


Basic Analysis - vlan
What is the Berkeley Packet Filter, using tcpdump, to capture all traffic that contains a VLAN tag? There should be 182 packets.
Enter the Filter syntax with no spaces
TCPDUMP Primitives are not accepted as answers
sudo tcpdump -n 'ether[12:2]=0x8100' -r BPFCheck.pcap | wc -l

ether[12:4]&0xffff0fff=0x81000001&&ether[16:4]&0xffff0fff=0x8100000A
tcp[13]=0&&ip[16:4]=0x0A0A0A0A
tcp[13]&32=0&&tcp[18:2]>0 
(ip[9]=17||ip[9]=1)&&ip[8]=1
ip[1]>>2=37
ip[9]=16
ip[6]&128=128
ether[12:2]=0x0806
tcp[0:2]=80||tcp[2:2]=80
tcp[2:2]<1024||udp[2:2]<1024
tcp[13]=0x04
tcp[13]=0x12
tcp[13]=0x02
udp[2:2]=53||tcp[2:2]=53||udp[0:2]=53||tcp[0:2]=53
ether[12:2]=0x8100
ip[4:2]=213
tcp[13]=0x14||tcp[13]=0x11
ip[9]=17||ip6[6]=17
tcp[0:2]>1024||udp[0:2]>1024
ip[6]&64!=0
ip[8]>=64
ip[8]<=64||ip6[7]<=64

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    # Capstone
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

float IP: 10.50.41.227




whereis or which command

net2_student20

 availaible ports:22000 - 22099

" You will have to conduct reconnaissance within the new environment to find the questions. The CTFD is only a repository for the BASE64 converted answers. " 


CAPSTONE
Hostname: UNKNOWN
IP: 10.50.x.x address provided by instructor
creds: netY_studentX:passwordX (netY = Networking Class Identifier & studentX = Student Number & passwordX = Student Number)
Known Ports: UNKNOWN
Action: Execute proper movement and redirection techniques

The Capstone environment will test your knowledge and skills on all the topics covered in the CCTC Networking course. You will not be able to complete this activity with the CTFD alone.

You will not find the questions or answers to this Capstone within the CTFD or in past activities.

You will have to conduct reconnaissance within the new environment to find the questions. The CTFD is only a repository for the BASE64 converted answers.

Any system, you reach or login to, you should check the "/usr/share/cctc/" directory. This is where any/all files of interest or instructions will be provided. You should always check this directory for information, just in case.

Most tools have been removed from hosts, which will alter/dictate the way you approach gathering flags. If you want to use a tool/command from within the host (example: tcpdump, netcat, arp, etc…​) you can check to see if it is present, and you can find the tool/command via the "whereis" or "which" commands. This will provide the directory path that the tool/command can be accessed from. You may need to use the full path in some cases. Don't forget to conduct passive reconnaissance on any system you can access and active recon to find other systems and ports to interact with.

Use tools such as ssh tunnels, netcat, curl, wget, ftp, and proxychains from your own INTERNET_HOST to navigate throughout the environment and to reach and interact with devices and services.

When creating tunnels your authorized port ranges to utilize are NSS00 - NSS99
N = NetX (1-8)
SS = Student Number - (ie 01 - 40)
00-99 = available port forward ranges
i.e. Net1_student1 can use 10100 - 10199 and Net4_student14 can use 41400 - 41499

If asked to submit your answer in base64 format, you can use the following example as a reference:

If the question asks you to submit an answer of cheese in all caps converted to base64:

echo "CHEESE" | base64
Q0hFRVNFCg==

flag = capstone
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
float IP: 10.50.41.227

Network Reconnaissance Methodology.

    Host Discovery
        Ruby ping sweep (if ping is available)
            for i in {1...254};do(ping -c 1 10.1.1.$i 2>/dev/null | grep "bytes from" &);done
        
        Nmap scan if no ping (check scan methodology below)
    Port Discovery
        nmap (check scan methodology)
        nc scan script
    Port Validation
        Banner Grab using nc [ip addr] [port]
    Follow-on actions based on ports found
        if 21 or 80 
        	wget -r [IP ADDR] 
        	(or) 
	        wget -r ftp://[IP ADDR] (or) firefox
        if 22 or 23 
        	CONNECT and PASSIVE RECON
        if NO 22 or 23 you NEED to GET ON the box and you have port 21
            FTP [IP ADDR] connects to the fTP server
                passive
                ls
                get[file name]

Scan Methodology 
	nmap - Pn [IP Addr] -T4 -p 21-23, 80 --open *

    Quick Scan Port 21-23, 80
    Specific ports based on hints/clues found
    Well known port range
    which tcpdump wireshark nmap telnet get curl ping
        0 - 1023 (actually scan 1 - 1023)
    Chunks of 2000 or first 10000 port (65535)
    Hail Mary - Scan all the ports (65535)

Passive Recon Methodology

    are commands

    hostname *
    permissions:
        sudo -l *
    Interfaces and Subnets
        ip a *
        show interfaces {VYOS} *
    Neighbors (Last ditch effort)
        ip neigh *
    Routing Table
        ip route *
        show ip route {VYOS}
    Files of Interest
        find / iname flag* *
        find / -iname hint* *
    Other listening ports
        ss -ntlp *
    Available Tools
        which tcpdump wireshark nmap telnet get curl ping
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## capstone-02
	Webserver questions:

command to change answer to base64:
echo "{ }" | base64
----------------------------------------
q1:
APIPA uses the IP network range of 169.254.0.0/16. What RFC number governs this? 
*Enter only the BASE64 conversion of the number*

answer:
3927
answer after base64:
 MzkyNwo=
------------------------------------------------------------------------------------------------
q2:
IPv6 Uses SLAAC to resolve its Global address from the Router. What multicast destination address does it use to Solicit the router?
*Enter the address in uppercase and convert to BASE64.*

answer:
FF02::2
answer after base64:
RkYwMjo6Mgo=
-------------------------------------------------------------------------------------------------
q3:
Which type of ARP is sent in order to perform a MitM attack?
*Specify the answer in ALL CAPS and convert to BASE64.*

answer:
GRATUITOUS
answer after base64:
R1JBVFVJVE9VUwo=
-------------------------------------------------------------
q4:
An attacker built a FRAME that looks like this:
| Destination MAC | Source MAC | 0x8100 | 1 | 0x8100 | 100 | 0x0800 | IPv4 Header | TCP Header | Data | FCS |
What form of attack is being performed? 
*Supply your 2 word answer in ALL CAPS and convert to BASE64.*

answer:
VLAN HOPPING
answer after base64:

--------------------------------------------------------------------------------------------------------------
q5:
A router receives a 5000 byte packet on eth0. The MTU for the outbound interface (eth1) is 1500. What would the fragmentation offset increment be with the conditions below?
*Origional packet Size = 5000 bytes*
*MTU for outboud interface = 1500*
*Supply only the BASE64 conversion of the number.*

answer:

answer after base64:

--------------------------------------------------------------------------------------------------------------


	PCAP questions:
	
synatx for tcpdump:
$ tcpdump -n -r capstone-bpf.pcap "" | wc -l

command to change answer to base64:
$ echo "{ }" | base64
-------------------------------------------------------------------------------------------------------
To answer these 4 questions, you will need to use tcpdump and BPF's against the capstone-bpf.pcap file.
-------------------------------------------------------------------------------------------------------

Question 1:

Using BPF’s, determine how many packets with a DSCP of 26 being sent to the host 10.0.0.103.

Provide the number of packets converted to BASE64.

-------------------------------------------------------------------------------

Question 2:

What is the total number of fragmented packets?

Provide the number of packets converted to BASE64.

-------------------------------------------------------------------------------

Question 3:

How many packets have the DF flag set and has ONLY the RST and FIN TCP Flags set?

Provide the number of packets converted to BASE64.

-------------------------------------------------------------------------------

Question 4:

An attacker is targeting the host 10.0.0.104 with either a TCP full or half open scan. Based off the pcap, how many ports are open?

Provide the number of ports converted to BASE64.

-------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## capstone-03
	Webserver questions:

command to change answer to base64:
echo "{ }" | base64

q1:
RAW Sockets are created in ________ space. Specify the one word BASE64 conversion of your answer in ALL CAPS.

answer:

answer encoded on base64:

-------------------------------------------------------------------------------------------------------------
q2:
Which module would you need to import to convert data into a corresponding 2-digit hex representation?
*Specify the module in lowercase and converted to BASE64.*

answer:

answer encoded on base64:

-------------------------------------------------------------------------------------------------------------
q3:
What is the proper format to pro-grammatically pack the IPv4 RAW header? 
*Specify the answer in the proper case. Include only what is between the single or double quotes and not the quotes themselves or the "!"*

answer:

answer encoded on base64:

-------------------------------------------------------------------------------------------------------------
q4:
What is the default (and most common) encoding used when converting data to be sent over the network. 
*Provide your answer in ALL CAPS and converted to BASE64.*

answer:

answer encoded on base64:

--------------------------------------------------------------------------------------------------------------
q5:
What type of header does TCP build to perform the checksum function?
*Provide your answer in ALL CAPS and converted to BASE64.*

answer:

answer encoded on base64:

--------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


