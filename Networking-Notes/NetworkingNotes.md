# Resources:
[draw.io](https://app.diagrams.net/)
Miro: https://miro.com/app/board/o9J_klSqCSY=/
FG:
https://net.cybbh.io/public/networking/latest/index.html
## Help (Linux Environment): https://explainshell.com/


## command to run OpenVPN via debian CLI
- no path in the command because it is being run from the directory that the configration file is currently in.
- syntax sudo <VPN> <configuration file path,> 
```
      sudo openvpn --config config.ovpn
```
## CTFD-2: 	
- (From Class) http://networking-ctfd-2.server.vta:8000/ 
- (From Home) http://10.50.23.63:8000/
```
CTFD Credentials  
  NEDE-M-006
  p...!
```
## Virtual Envirnoments:

#### Blue  Internet Host(s): 
     Student#: student20

      Float IP:
      Command: ssh student@10.50.41.223 -X

      Password: password
#### Red Internet Host(s):
      Entry Float IP: 10.50.37.85
      
      Your Network Number is 2 (Given by Instructor)
      
      Credentials: net2_studentX:passwordX
      
      X is your student number

Day 1 (20240826)

- Floating IPs: Public like NAT (a redirector)
  - misc.

Network Access:
  - OSI Model       PDU
    Application   = Data
    Presentation  = Data   
    Session       = Data
    Transport     = Segment/Datagram
    Network       = Packet
    Data Link     = Frame
    Physical      = Bit

    Internet Standards Organization
    - IETF - RFCs
    - IANA - Internet Numbers (Responsible for DNS {The Top Level Domains})
    - IEEE - LAN/WAN electrical standards (Standards )

  - OSI Layer 1 (Bits): Binary, Decimal, Hexidecimal, Base64
      - Binary: Base2(0/1), Place Values(), Format()01000111 100010 1100011), Groupings(bit, nibble, byte, half-word,word)
      - Bit = 1bit, Nibble = 4bits, Byte = 8bits, Half-Word = 16bits, Word = 32bits
      - Hexideciaml (0x42,etc..)
      - Base64 (A_Z, a-z, 0-9, +, /) "May include padding"
  - Topologies
      - Bus (all in line)
      - Star(All connected at one point'typicalle a switch')
      - Ring(Like a bus but in a loop)
      - Mesh(Everyone is connected{full}, Most people connected{partial})
      - Wireless(Connected Via radio waves, on the same frequency)
      - Hierarical(Enterprise level{Access Layer, Distribution Layer, Core Layer})
   - Devices
      - Hubs(sends packets to every ports)
      - Repeaters(Extends the distance that your medium can go CAT5, Fiber, etc.{maximum threshold it can go})
      - Switches(Every port can be mapped to a specific network{Collision Domains}, Virtual Local Area Networks (VLANs)) Are Networks
      - Routers(Connects Networks{Domains})
    - Bit-Time
      - Needs to be in sync w/ the network
    
  - OSI Layer 2 LAN Technologies
    - 802.3 Ethernet: Copper
    - 802.11 Wireless: Radio Waves
    - 802.5 Token: Proprietary

    - Data Link Sub-Layers (Physical vs. Logical)
      - MAC(Medium Access Control) Who the is Manufacture, Badge number{when it was created}, Supposed to be unique. -Physical-
      - LLC(Logical Link Control) How it talks to other devices. -Logical- 

    - Frame
      - Header|Data{HigherLayerHeader|HigherLayerData|HigherLayerTrailer}Data|Footer/Trailer
      
- Switches(how they affect visability)
    - (CAM) Table - Building MAC-Address 'table'
      - Learn by Reading Source MAC addressses (Look up then forward)
    - Forwarding Frames
      - Decision based on Destination MAC Address
*    - Switching Modes
        - Cut-Through
        - Fragment-Free
        - Store-and-Forward
    - CAM Table Overflow Attack (Yikes) Overriding information
      - Send frames with bogus source MAC address to switch
      - Cause switch to fill table with bogus addresses
      - Switch will not be able to learn new (valid) MAC addresses
    - MAC Addressing: length 48 bit|6 byte| 12 Hex
      - Format:
        - Windows 01-23-45-12-24-56
        - Unix/Linux: 01:23:45:12:34:56
        - Cisco:L 1234.5612.3456
      - Parts
        - OUI: First 24-bits assigned by IANA
        - Vendor Assigned: Last 24-bits assigned by vendor
        
      - Unicast 1-1
      - Multicast 1-Many
      - Broadcast 1-Everyone
 
      - MAC Spoofing
        - Hardware
        - Firmware
        - burned-in
          - Now changed w/ software

      - VLANs (Virtual Local Area Networks)
        - Need 0x8100 (VLAN Tags)
        - Need Trunks to pass the packets from device to device (based off the VLAN Tag)
      - Default - VLAN 1
      - Data - User Traffic
      - Voice - VOIP traffic
      - Management - Switch/Router management
      - Native - untagged switch and router traffic

      - Switches give you a VLAN (Can only see VLAN information between switches)
      - Double Tagging VLAN Tag 1.(0x88..) VLAN Tag 2.(0x81..)
 
      - VLAN Hopping Attack via "Double Tagging (0x8100)x2"
        - Switch Spoofing (DTP)
        - Single Tagging
        - Double Tagging (Using native VLAN)
       
        - ARP (Address Resolution Protocol)
       
        - VTP (VLAN Trunking Protocol) Server that 'clients pull information from' CISCO
          - Dynamically add/remove/modify VLANs
          - Cisco proprietary
          - Modes
            - Server
            - Client
            - Transparent
          
          - VTP vulnerability, the server with the most revisions takes precident and propegates.
         
          - DTP (Dynamic Trunking Protocol)
            - Used to dynamically create trunk links
            - Cisco Proprietary
            - Modes
              - Dynamic-Auto
              - Dynamic-Desirable
            - On by default
            - Can send crafted messages to form a VLAN trunk link
            - Recommended to:
              - Disable DTP negotiations
              - Manually asssign as Access or Trunk
             
          - CDP (Cisco Discovery Protocol)
            - Clear text
            - enabled by default
            - may be required for VOIP
          - FDP (Foundary Discovery Protocol)
          - LLDP (Link Layer Discovery Protocol)
          - STP (Spanning Tree Protocol)
         
          - Root (Last Hop before Default Gateway)

Day 2 (20240827) Traffic Capture
-Advantages
- sniffing based off of capture libraries
- sniffing the wire shows you what is leaving your box.
- Networks have threasholds(a limit)
-Disadvantages
- needs elevated privilages
- Can only capture what the NIC can see
- Might lose packets
- Consumes many resources

- Packets captured in 2 ways:
  - Hardware 
  - Software (use pre-existing hardware)
 
  - Sockets: a way to tie an IP Address and Port together
    -User Space Sockets
    - Stream Socket (TCP)
    - Datagram Socket (UDP)
    -Kernel Space Sockets
    - RAW Sockets
   
    - Capture Library
      -Requires root
      - Promiscious Mode (Listen on all NICs)
      - All captured packets are created as RAW Sockets

    - Types of Sniffing
      - Active 
      - Passive
     
      - Interface Naming
        -Traditional
        - eth0, eth1
        -Consistent
        - eno1, ens3

    - Preform Real-Time Network Traffic Sniffing

      - TCPDump Primatives (Human Readable, so you don't have to parse through the packet)
      - User Friendly capture expresions:
        - src or dst
        - host or net
        - tcp or udp
      -TCPDump Primative Qualifiers
        - type=what the number refers to
          - host, net, port, or port range
        - dir=transfer direction to and/or from
          - src or dst
        - proto=restricts the match to a particular protocol(s)
          - ether, arp, ip, ip6, icmp, tcp or udp

     - check if the value is "0x800" and if this is true "j
          -A :Print payload 
          -D :list interfaces
          -i :specify capture interface
          -e :print data-link headers
          -X or -XX :print payload in HEX and ASCII

        -Basic TCPDump Options
          -w=write to pcap
          -r=read from pcap
          -v, vv, or vvv=verbosity
          -n=no inverse lookups

       -Logical Operators
       - Primiatives can be combined using:
         - 'and' (&&)
         - 'or' (||)
         - 'not' (!)
        
      -Relational Operators:
        - < or <=
        - > or >=
        - = or == or !=

    -TCPDump Primative Examples
      - Simple
      - Extended
   
   - Wireshark (Capture vs Display Filter):
     - Capture: used to specify which packets should be saved to disk while capturing.
     - Display: allow you to change the view of what packets are displayed of those that are captured.
    
  - POF (Passive OS Fingerprinting)
    - Tool that's installed on the Linux boxes to help validate OS Fingerprinting. It matches signatures in it's database file "/etc/p0f/p0f.fp"

Day 3 (20240828) Packet Creation Creation

  - Stream Socket: Connection oriented [TCP, SCTP & BT]
  - Datagram: Connectionless [UDP]
  - RAW: Direct sending and recieving of IP Packets w/out automatic protocol-specific formatting 

  - User Space: Stream & Datagram Sockets
  - Kernel Space: RAW Sockets (Kernel Space) $ sudo

  - import{module}
  - from {module} import * "can call funtions by their name"

  - RAW packets allow you to change and modify the parameters in which you send your data.

- After you run a command, this will run the last command as sudo.
```
$ sudo !!
```

- Encoding & Decoding
  - different commands:

    - Hex 
      - Encode text to Hex
      ```
      echo "Message" | xxd
      ```
      - Encode file to Hex
      ```
      xxd file.txt file-encoded.txt
      ```
      - Decode file from Hex
      ```
      xxd -r file-encoded.txt file-decoded.txt
      ```

    - Python Hex Encoding
    ```
    import binascii
    message = b'Message'
    hidden_msg = binascii.hexlify(message)
    ```

    - Base 64
      - Encode text to base64
      ```
      echo "Message" | base64
      ```
      - Endode file to Base64:
      ```
      base64 file.txt > file-encoded.txt
      ```
      - Decode file from Base64:
      ```
      base64 -d file-encoded.txt > file-decoded.txt
      ```

      - Python Base64 Encoding
      ```
      import base64
      message = b'Message'
      hidden_msg = base64.b64encode(message)
      ```

# Helpful Commands:

- nc -lp 1111 < echo "Hello There"
- echo "kill" | nc -lp 1111
- echo "Hello there" | nc -lp 1111
- nc -lp 1111 < text.txt
- sudo tcpdump 'ip[4:2] = 20' -vvXX
- sudo tcpdump 'ip[2:2] = 1776' -vvXX
- sudo tcpdump 'tcp[2:2] = 1776' -vvXX
- nc -luvp 5309 
- echo "Sending" | nc -luvp 2222

Day 4 (20240829) Reconnissance

- Passive External: OSINT, DNS
  - OSINT Framework, Pentest-Standard, SecuritySift, web-crawlers
- Active External: Ping, NMap, Netcat, Banner Grabs, Tracerourte
  - 
- Passive Internal: On their Box, Internal scanning like listed above
- Active Internal: On their Box, Native tools, ps -elf, etc... 

- Reconnaissance (Active and Passive)
  - Network footprinting
  - Network Scanning
  - Network Enumeration
  - Vulnerability Assesment
 
- Passive Recon: OSINT, PAI(Publicaly Available Information)
  - Lots of tools in the slide for OSINT

# Commands:
  - dig: DNS server queries (UDP 53)
  - whois: Information about owners registered to a Domain (TCP 43)

  whois:
  ```
  whois zonetransfer.me
  ```
  dig:
  ```
  dig zonetransfer.me A
  dig zonetransfer.me AAAA
  dig zonetransfer.me MX
  dig zonetransfer.me TXT
  dig zonetransfer.me NS
  dig zonetransfer.me SOA
  ```

  Zone Transfer: (axfr protocol used for zone transfers)
    - syntax  dir axfr {@soa.server} {target-site}
  ```
  dig axfr @nsztm1.digi.ninja zonetransfer.me
  ```

  Google Searches
    - Dork Search
  ```
  site:*.ccboe.net

  site:*.ccboe.net "administrator"
  ```

  Shodan:
  - Be aware of attribution. You can lose your clearance.
  ```
  https://www.shodan.io
  ```  

  POF (Passive OS Fingerprinting)
  - Passive scanning of network traffic and packet captures
  ```
  more /etc/p0f/p0f.fp

  sudo p0f -i eth0

  sudo p0f -r test.pcap
  ```

## Active External (discovery)
  - Scanning Nature: Active & passive
    - Remote to Local (Outside to inside the Network)
    - Local to Remote
    - Local to Local
    - Remote to Remote
   
    - Vertical Scan: 1-1 (scans all the ports on target)
    - Horizantal Scan: 1-Many (scans a single, set of ports, or range of ports for various targets)
    - ...
   
    ping: ping 1 ip
    ```
    ping 172.16.82.106 -c 1
    ```
    ping: ping a range
    ```
    for i in {1..254}; do (ping -c 1 172.16.82.$i | grep "bytes from" &) ; done
    ```

    ## Nmap
    - Default Scan:
      - User: Full Connect (-sT) 
      - Root: TCP SYN Scan (-sS) "Stealth Scan" run as sudo
      - IF PORT(s) is/are not specified, NMAP 1000 most commonly used TCP or UDP ports.
       
    - NMAP states:
      - open
      - closed
      - filtered
      - unfiltered
      - open|filtered
      - closed|filtered

    - NMAP Scan Types:
      - SYN scan ()
      - Full connect scan ()
      - Null scan (0 flags attached)
      - FIN scan ()
      - XMAS tree scan ()
      - UDP scan (takes a long time, looking for absence of destination unreachable)
      - Idle scan (sets up a RDR and runs the scan from it "Zombie Scan")
    Do NOT ctrl+c LET the command finish out

    NMAP Scan Types
    - (-D) Decoy Scan
    - (-sA) ACK/Window scan
    - (-sR) RPC scan
    - (-b) FTP scan
    - (-O) OS Fingerprinting
    - (-sV) Version 
    - Discovery Probes
    - (-PE) ICMP Ping
    - (-Pn) No ping

    NMAP Tim-Out
    - (-T0) Paranoid
    - (-T1) Sneaky
    - (-T2) Polite
    - (-T3) Normal
    - (-T4) Aggresive
    - (-T5) Insane
We are doing T4!!!

# Commands:
  - NMAP Delay
```
--scan-delay <time> - Minimum delay between probes
```
```
--max-scan-delay <time> - Max delay between probes
```

- NMAP Rate Limit
```
--min-rate <number> - Minimum packets per second
```
```
--max-rate <number> - Max packets per second
```

- Traceroute Firewalking
```
traceroute 172.16.82.106
traceroute 172.16.82.106 -p 123
sudo traceroute 172.16.82.106 -I
sudo traceroute 172.16.82.106 -T
sudo traceroute 172.16.82.106 -T -p 443
```

- NetCat Scanning
  - syntax: nc [Options] [Target IP] [Target Port(s)]

- NetCat Horizantal Scanning
  - TCP
  ```
  for i in {1..254}; do nc -nvzw1 172.16.82.$i 20-23 80 2>&1 & done | grep -E 'succ|open'
  ```
  - UDP
  ```
  for i in {1..254}; do nc -nuvzw1 172.16.82.$i 1000-2000 2>&1 & done | grep -E 'succ|open'
  ```

  - NetCat Vertical Scanning
    - TCP
    ```
    nc -nzvw1 172.16.82.106 21-23 80 2>&1 | grep -E 'succ|open'
    ```
    - UDP
    ```
    nc -nuzvw1 172.16.82.106 1000-2000 2>&1 | grep -E 'succ|open'
    ```

#-------------------------------------------------------------------------------------------------------------------------

Day 4(20240903) File Transfer/Redirection
      
  - Active/Passice FTP
  - SCP transfer files

   - TFTP
   - FTP (21 C2/20 Data) 

     - Active
       Client RHP -> :21 Host
       Client RHP <- :21
     * Client RHP <- :20 Host starts another session port:20 data
       Client RHP -> :20

     - Passive (Port :20 needs to be enabled)
       Client RHP -> :21 Host
       Client RHP <- :21
     * Client RHP -> :EHP Host tells client to connect to an (Ephemeral High Port) to to utilize port :20 FTP DATA
       Client RHP <- :EHP
   
   - FTPS:
     - adds SSL/TLS encryption to FTP
     - Interactive terminal access
     - Explicit Mode: ports :20/:21
       - Option for Encryption
     - Implicit Mode ports :989/:990
       - Encryption assumed 
   
   - SFTP
     - Uses symmetric & asymmetric encryption
     - adds FTP like services to SSH
     - authentication via (username:/password:)
   
   - SCP (when SSH'd into a box, you are in that user's home dirtectory)
     - TCP :22
     - Authentication via (Username:/password:) or SSH key
     - Non-Interactive
     - Options
       - .(pwd)
       - -v(verbose)
       - -P(alternate port)
       - -r(recursively copy an entire directoy)
       - -3(3-way copy)
      
Proxie Chains knows to use port: 9050        

If you have a BASH shell you can invoke /dev/tcp
- /dev/tcp for when you do not have netcat
- 

netcat can open a (BASH terminal) via the [-c] & [-e] option switches -e(evoke, shows you the shell -c(just the commands)

Packers: compress data
- compress how much data is sent

Encoding(changing how you see the data) Decoding(changing it back)
- Cyberchef

Hexidecimal encoding & decoding
- convert from bases

XXD

Base64 encoding & decoding
- A-Z,a-z,1-9,+,/
- padding: used to fill in any unused space in each 24-bit group


- Transfer File w/ Base64

# Commands:

wget with the -r {recursive option does...}

      ```
      proxychains wget -r ftp://10.0.0.104
      ```
Download from remote Dir to local Dir
      
      ```
      scp student@172.16.82.106:secretstuff.txt /home/student
      ```
Upload a file to remote Dir from Local Dir
      
      ``` 
      scp secretstuff.txt student@172.16.82.106:/home/student
      ```
Copy a file from a remote Host to a seperate remote host
      
      ```
      scp -3 student@172.16.82.106:/home/student/secretstuff.txt student@172.16.82.112:/home/student
      password:    password:
      ```
Recursive upload of a folder to remote host's $Home Dir

      ```
      $ scp -r folder/ student@172.16.82.106:
      ```
Recursive download of a folder from remote to my current working Dir

      ```
      $ scp -r student@172.16.82.106:folder/ .
      ```
Download Syntax w/alternate SSHD
- Downlaod a file froma remote Dir to a local Dir

  ```
  $ scp -P 1111 student@172.16.82.106:secretstuff.txt .
      ```
- Upload a file to a remote Dir from a local Dir

      ```
      $ scp -P 1111 secretstuff.txt student@172.16.82.106:

      ```
Create a local port forward to target device

      ```
      ssh student@172.16.82.106 -L 1111:localhost:22 -NT
      ```
Download a file from  a remote Dir to a local Dir

      ```
      scp -P 1111 student@localhost:secretstuff.txt /home/student
      ```
Upload a file to a remote Dir from a local Dir

      ```
      scp -P 1111 secretstuff.txt student@localhost:/home/student
      ```
SCP SYNTAX THROUGH A DYNAMIC PORT FORWARD
- Create a Dynamic Port Forward to target device

```
ssh student@172.16.82.106 -D 9050 -NT

```
- Download a file from a remote directory to a local directory

```
proxychains scp student@localhost:secretstuff.txt .

```
- Upload a file to a remote directory from a local directory

```
proxychains scp secretstuff.txt student@localhost:

```
NETCAT: CLIENT TO LISTENER FILE TRANSFER
Listener (receive file):

```
nc -lvp 9001 > newfile.txt
```
Client (sends file):

```
nc 172.16.82.106 9001 < file.txt
```

NETCAT: LISTENER TO CLIENT FILE TRANSFER 
Listener (sends file):

```
nc -lvp 9001 < file.txt
```
Client (receive file):

```
nc 172.16.82.106 9001 > newfile.txt
```

NETCAT RELAY DEMOS *(using NETCAT as a relay)
Listener - Listener

On Blue_Host-1 Relay:

```
mknod mypipe p
nc -lvp 1111 < mypipe | nc -lvp 3333 > mypipe
```
On Internet_Host (send):

```
nc 172.16.82.106 1111 < secret.txt
```
On Blue_Priv_Host-1 (receive):

```
nc 192.168.1.1 3333 > newsecret.txt
```
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

Day 6 (20240906)

Sensors
 - In-line: Impacts network latency
   - IPS
   - Firewall
 - Out of Band:
   - Passive Sensor: Monitor network segments, can detect but not stop
     - IDS
   - Switched Port Analyzer

      TAP: Appliance placed between 2 network devices, not scalable

      MITM: Attacker can use ARP or other method/protocol

      SPAN: Configured on Network Switch, places burden on the network Switch. (High degree of packet loss)

Fingerprinting: 
 - Active OS fingerprinting
   - Easier
   - Send packets to the target and monitor response
   - Tools
     - Nmap
     - Xprobe2
     - sinfp3

Baselining: Snapshots of what the network looks like during a time frame, 7 Days to establish the initial snapshot.
      - Determine current state of Network
      - Ascertain the current utiliziation of network resources
      - Identify normal vs peak network time
      - Verify port/protocol usage



Indicators
 - Indicator of Attack(IOA): Proactive
   - Series of actions
   - Focus on Intent
   - Looks for what MUST happen
  
 - Indicator of Compromise(IOC): Reaction
   - Forensic Evidence
   - Provides Information that can change
Some Indicators:
           - .exe/executable files
           - NOP sled
           - Repeated Letters
           - Well Known Signatures
           - Mismatched Protocols
           - Unusual traffic
           - Large amounts of traffic/ unual times 
 
 Rootkit:
       - Bootkit
       - Gootkit

Polymorphic vs. Metamorphic
- Polymormorphic: Changes it's code using encryption keys, which makes each iteration look different.
- Metamorphic: Rewrites its code without an encryption key, making each iteration new and unique. *More dangerous than^ Polymorphic*


Mobile Code: Portable, various OSs.

BIOS/Firmware
 - IOA: Malware reinfection
 - IOC: Depends on the malware type/class

--------------------------------------------------------------------------------------------------------------------------------------------------------

Day 7 (20240909)

Defense in Depth
 - Permimeter
 - Network Security
 - Endpoint Security
 - Application and OS Security
 - Data Security

Default Policies
 - Explicit: percise, clearly expressed
 - Implicit: implied or understood


Blacklisting vs Allow-listing
- Block-Listing (Black Listing) 
 - Implicit ACCEPT
 - Explicit DENY
- Allow-Listing (White Listing)
 - Implicit DENY
 - Explicit ACCEPT

Opertation Modes
- Routed Mode
- Transparent Mode

FireWall Filtering Methods:
- Stateless -L3+4
- Stateful Inspection -L4
- Circuit-Level -L5
- Application Layer -L7
- Next Generation (NGFW) -L7

Software vs Hardware Vs Cloud
- Software: host-based
- Hardware:network-based
- Cloud: provided as a Service

We are gonna use: iptables & nftables

- NF_IP_PRE_ROUTING > PREROUTING
- NF_IP_LOCAL_IN > INPUT
- NF_IP_FORWARD > FORWARD
- NF_Ip_LOCAL_OUT > OUTPUT
- NF_IP_POST_ROUTING > POSTROUTING

1. TABLES - contain chains
      - filter - default table. Provides packet filtering.
      - nat - used to translate private ←→ public address and ports.
      - mangle - provides special packet alteration. Can modify various fields header fields.
      - raw - used to configure exemptions from connection tracking.
      - security - used for Mandatory Access Control (MAC) networking rules.
2. CHAINS - contain rules
      - PREROUTING - packets entering NIC before routing
      - INPUT - packets to localhost after routing
      - FORWARD - packets routed from one NIC to another. (needs to be enabled)
      - OUTPUT - packets from localhost to be routed
      - POSTROUTING - packets leaving system after routing
  
CHAINS ASSIGNED TO EACH TABLE
      - filter - INPUT, FORWARD, and OUTPUT
      - nat - PREROUTING, POSTROUTING, INPUT, and OUTPUT
      - mangle - All chains
      - raw - PREROUTING and OUTPUT
      - security - INPUT, FORWARD, and OUTPUT

3. RULES - dictate what to match and what actions to preform on packets when packets match a rule

      * COMMON IPTABLE OPTIONS * 
-t - Specifies the table. (Default is filter)
-A - Appends a rule to the end of the list or below specified rule
-I - Inserts the rule at the top of the list or above specified rule
-R - Replaces a rule at the specified rule number
-D - Deletes a rule at the specified rule number
-F - Flushes the rules in the selected chain
-L - Lists the rules in the selected chain using standard formatting
-S - Lists the rules in the selected chain without standard formatting
-P - Sets the default policy for the selected chain
-n - Disables inverse lookups when listing rules
--line-numbers - Prints the rule number when listing rules

      * COMMON IPTABLE OPTIONS *
-p - Specifies the protocol
-i - Specifies the input interface
-o - Specifies the output interface
--sport - Specifies the source port
--dport - Specifies the destination port
-s - Specifies the source IP
-d - Specifies the destination IP    -m to enable iptables extensions:

-m state --state NEW,ESTABLISHED,RELATED,UNTRACKED,INVALID

-m mac [ --mac-source | --mac-destination ] [mac]

-p [tcp|udp] -m multiport [ --dports | --sports | --ports { port1 | port1:port15 } ]

-m bpf --bytecode [ 'bytecode' ]

-m iprange [ --src-range | --dst-range { ip1-ip2 } ]
-j - Specifies the jump target action

                                                                              * Before you flush the rules change the default policy, change it to ACCEPT *

                                                                              

  IPTABLES SYNTAX:
iptables -t [table] -A [chain] [rules] -j [action]
      -i [ iface ]
      -o [ iface ]
      -s [ ip.add | network/CIDR ]
      -d [ ip.add | network/CIDR ]
-p icmp [ --icmp-type type# { /code# } ]
-p tcp [ --sport | --dport { port1 |  port1:port2 } ]
-p tcp [ --tcp-flags SYN,ACK,PSH,RST,FIN,URG,ALL,NONE ]
-p udp [ --sport | --dport { port1 | port1:port2 } ]
    -m to enable iptables extensions:
-m state --state NEW,ESTABLISHED,RELATED,UNTRACKED,INVALID
-m mac [ --mac-source | --mac-destination ] [mac]
-p [tcp|udp] -m multiport [ --dports | --sports | --ports { port1 | port1:port15 } ]
-m bpf --bytecode [ 'bytecode' ]
-m iprange [ --src-range | --dst-range { ip1-ip2 } ]

  
1. CREATE THE TABLE
      nft add table [family] [table]
    [family] = ip*, ip6, inet, arp, bridge and netdev.
    [table] = user provided name for the table.

2. CREATE THE BASE CHAIN
    nft add chain [family] [table] [chain] { type [type] hook [hook]
    priority [priority] \; policy [policy] \;}

* [chain] = User defined name for the chain.

* [type] =  can be filter, route or nat.

* [hook] = prerouting, ingress, input, forward, output or
         postrouting.

* [priority] = user provided integer. Lower number = higher
             priority. default = 0. Use "--" before
             negative numbers.

* ; [policy] ; = set policy for the chain. Can be
              accept (default) or drop.

 Use "\" to escape the ";" in bash

3. CREATE A RULE IN THE CHAIN
   nft add rule [family] [table] [chain] [matches (matches)] [statement]

* [matches] = typically protocol headers(i.e. ip, ip6, tcp,
            udp, icmp, ether, etc)

* (matches) = these are specific to the [matches] field.

* [statement] = action performed when packet is matched. Some
              examples are: log, accept, drop, reject,
              counter, nat (dnat, snat, masquerade)

  RULE MATCH OPTIONS:
  ip [ saddr | daddr { ip | ip1-ip2 | ip/CIDR | ip1, ip2, ip3 } ]

tcp flags { syn, ack, psh, rst, fin }

tcp [ sport | dport { port1 | port1-port2 | port1, port2, port3 } ]

udp [ sport| dport { port1 | port1-port2 | port1, port2, port3 } ]

icmp [ type | code { type# | code# } ]


RULE MATCH OPTIONS:
ct state { new, established, related, invalid, untracked }

iif [iface]

oif [iface]

MODIFY NFTABLES

nft { list | flush } ruleset

nft { delete | list | flush } table [family] [table]

nft { delete | list | flush } chain [family] [table] [chain]

MODIFY NFTABLES cont.


SOURCE NAT: SNAT
```
iptables -t nat -A POSTROUTING -o eth0 -s 192.168.0.1 -j SNAT --to 1.1.1.1
```
SOURCE NAT: SNAT
```
iptables -t nat -A POSTROUTING -p tcp -o eth0 -s 192.168.0.1 -j SNAT --to 1.1.1.1:9001
```
SOURCE NAT: Masquerade
```
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
```
DESTINATION NAT: DNAT
```
iptables -t nat -A PREROUTING -i eth0 -d 8.8.8.8 -j DNAT --to 10.0.0.1
```
DESTINATION NAT: DNAT
```
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 22 -j DNAT --to 10.0.0.1:22
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNAT --to 10.0.0.2:80
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 443 -j DNAT --to 10.0.0.3:443
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080
```


