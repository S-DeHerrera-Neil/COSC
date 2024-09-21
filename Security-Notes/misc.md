MS setup: 

JB Password:
```
v0cEcUbwIzY878p
```

```
ssh -MS /tmp/jump student@10.50.37.98	     

ssh -S /tmp/jump jump -O forward -D 9050

ssh -MS /tmp/web student@10.50.37.98

ssh -S /tmp/web web -O forward -L127.0.0.1:2224:10.100.28.40:4444

ssh -S /tmp/jump jump -O cancel -D9050

ssh -S /tmp/web web -O forward -D9050

proxychains nmap -Pn -n -T5 10.100.28.55

proxychains nmap --script http-enum 10.100.28.55
```
