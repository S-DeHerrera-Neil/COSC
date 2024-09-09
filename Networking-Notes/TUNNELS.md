*Avatar*
-
---------------------------------------------------------------------------------
*Rick and Morty*
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
- BIH> ssh philip@127.0.0.1 -p 1113 -L 1114:192.168.30.150:1212
- BIH> ssh leela@127.0.0.1 -p 1114 -D 9050 -NT
- BIH> ssh leela@127.0.0.1 -p 1114 -L 1115:10.10.12.121:2932 -NT
- BIH> ssh professor@127.0.0.1 -p 1115 -D 9050 -NT

--------------------------------------------------------------------------------------

- BIH> telnet 10.50.23.236
- eric> ssh net2_student20@10.50.39.211 -R 1111:127.0.0.1:8462 -NT
- BIH> ssh net2_student20@127.0.0.1 -p 1111 -D 9050 -NT (close)
- BIH> ssh net2_student20@127.0.0.1 -p 1111 -L 2222:192.168.100.60:22 -NT
- BIH> ssh net2_student20@127.0.0.1 -p 2222 -D 9050 -NT
- BIH> ssh kyle@127.0.0.1 -p 2222 -L 3333:10.90.50.140:6481
- BIH> ssh net2_student20@127.0.0.1 -p 3333 -D 9050 -NT
- BIH> ssh net2_student@127.0.0.1 -p 3333 -L 4444:172.20.21.5:23 -NT
- BIH> telnet 127.0.0.1 4444
- stan> ssh net2_student20@172.20.21.4 -p 6481 -R 5555:127.0.0.1:22 -NT
- BIH> ssh net2_student20@127.0.0.1 -p 3333 -L 6666:127.0.0.1:5555 -NT
- BIH> ssh net2_student20@127.0.0.1 -p 6666 -D 9050 -NT
