- ops> $ {ssh PC1@10.50.X.X} {[-L 2XX00]:100.1.1.2:22 -NT}
- ops> $ {ssh PC2@127.0.0.1 -p 2XX00} {[-L 2XX01]PC3:23 -NT}
- ops> $ {Telnet 127.0.0.1 2XX01}
- pc3> $ {ssh PC2@192.168.1.1 -R 2XX99}{127.0.0.1:22 -NT}
- ops> $ ssh PC2@localhost -p 2XX00 -L 2XX02:127.0.0.1:2XX99 -NT
- OPS> $ ssh PC3@localhost -p 2XX02 
       
--------------------------------------------------------------------------------
*Futurama*
- BIH> ssh bender@float -p1234 -D 9050 -NT
- BIH> ssh bender@{float ip} -p 1234 -L 1111:172.17.17.28:23 -NT
- BIH> telnet 127.0.0.1 1111
- philip> bender@172.17.17.17 -p 1234 -R 1112:127.0.0.1:127.0.0.1:4321 -NT
- BIH> ssh bender@{float ip} -p 1234 -L 1113:127.0.0.1:1112 -NT
- BIH> ssh philip@127.0.0.1 -p 1113 -D 9050 -NT
- BIH> ssh 
- BIH>
- BIH>
- BIH>
