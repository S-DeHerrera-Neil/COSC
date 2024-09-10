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
