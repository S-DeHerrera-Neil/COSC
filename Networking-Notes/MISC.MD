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


