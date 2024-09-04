# Network Reconnaissance Methodology.

  - Host Discovery
    - Ruby ping sweep (if ping is available)
      - fir i in {1...254}; do(ping -c 1 198.168.1.$1 2>/dev/null | grep "bytes from" &);done
    - Nmap scan if no ping (check scan methodology below) 
  - Port Discovery
    - nmap (check scan methodology)
    - nc scan script
  - Port Validation
    - Banner Grab using nc [ip addr] [port]
  - Follow-on actions based on ports found
    - if 21 or 80 wget -r [IP ADDR] (or) wget -r ftp://[IP ADDR] (or) firefox
    - if 22 or 23 CONNECT and PASSIVE RECON
    - if NO 22 or 23 you NEED to GET ON the box and you have port 21
      - FTP [IP ADDR] connects to the fTP server
        - passive
        - ls
        - get[file name]


Scan Methodology
  nmap - Pn [IP Addr] -T4 -p 21-23, 80 --open *

  - Quick Scan Port 21-23, 80
  - Specific ports based on hints/clues found
  - Well known port range
  - which tcpdump wireshark nmap telnet get curl ping 
      - 0 - 1023 (actually scan 1 - 1023)
  - Chunks of 2000 or first 10000 port (65535)
  - Hail Mary - Scan all the ports (65535)

Passive Recon Methodology
  * are commands

  - hostname *
  - permissions:
    - sudo -l *
  - Interfaces and Subnets
    - ip a *
    - show interfaces {VYOS} *
  - Neighbors
    - ip neigh *
  - Routing Table
    - ip route *
    - show ip route {VYOS}
  - Files of Interest
    - find / iname flag* *
    - find / -iname hint* *
  - Other listening ports
    - ss -ntlp *
  - Available Tools
    - which tcpdump wireshark nmap telnet get curl ping
