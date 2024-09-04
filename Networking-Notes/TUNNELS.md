- ops> $ {ssh PC1@10.50.X.X} {[-L 2XX00]:100.1.1.2:22 -NT}
- ops> $ {ssh PC2@127.0.0.1 -p 2XX00} {[-L 2XX01]PC3:23 -NT}
- ops> $ {Telnet 127.0.0.1 2XX01}
- pc3> $ {ssh PC2@192.168.1.1 -R 2XX99}{127.0.0.1:22 -NT}
- ops> $ ssh PC2@localhost -p 2XX00 -L 2XX02:127.0.0.1:2XX99 -NT
     
     - $ ssh PC3@localhost -p 2XX02 
       
