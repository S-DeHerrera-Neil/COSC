Resources:

Miro: https://miro.com/app/board/o9J_klSqCSY=/
CTFD-1: 
(Linux Environment): https://explainshell.com/

CTFD-1: 	
http://networking-ctfd-2.server.vta:8000/ or http://10.50.23.63:8000/ (If you wanna access from home)
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
