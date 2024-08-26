Resources:

Miro: https://miro.com/app/board/o9J_klSqCSY=/
CTFD-1: 
(Linux Environment): https://explainshell.com/

CTFD-1: http://networking-ctfd-1.server.vta:8000/ or http://10.50.20.180:8000/ (If you wanna access from home)
```  
  NEDE-M-006
  p...!
```
Blue  Internet Hosts: Your Environment

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
      
