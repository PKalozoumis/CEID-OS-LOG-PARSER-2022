# CEID-OS-LOG-PARSER-2022

This project was made for the third year undergraduate course "Operating Systems" of the Computer Engineering & Informatics Department (CEID), University of Patras.

This shell script parses a server's access log file to extract various information about the connected clients, such as the browsers used and the authenticated user IDs. It can also filter based on user, month of request, request method (GET/POST) or IP protocol version (IPv4/IPv6)

## Use cases

- Calling the script with one parameter does nothing:
```bash
./logparser.sh
```
![image](https://github.com/PKalozoumis/CEID-OS-LOG-PARSER-2022/assets/51862240/e62c84c9-54ae-4d3d-875e-d9d089c88970)

- The script needs at least one parameter, which is the log file name. If it's the only parameter, it prints the whole file:
```bash
./logparser.sh access.log
```
![image](https://github.com/PKalozoumis/CEID-OS-LOG-PARSER-2022/assets/51862240/7e44865e-71cf-4f4c-a940-dd98a1046689)

- See all connected clients:
```bash
./logparser.sh access.log --usrid
```
![image](https://github.com/PKalozoumis/CEID-OS-LOG-PARSER-2022/assets/51862240/f2247b05-9005-46ee-a624-f32897dcb0ad)

- See all used browsers:
```bash
./logparser.sh access.log --browsers
```
![image](https://github.com/PKalozoumis/CEID-OS-LOG-PARSER-2022/assets/51862240/4aa35e2d-fab1-49db-b781-95da89e4dfe6)

- Filter file based on one specific client:
```bash
./logparser.sh access.log --usrid root
```
![image](https://github.com/PKalozoumis/CEID-OS-LOG-PARSER-2022/assets/51862240/f32a1475-0ab2-4851-97c7-cecd7fc36156)


- Filter based on request method:
```bash
./logparser.sh access.log -method POST
```
![image](https://github.com/PKalozoumis/CEID-OS-LOG-PARSER-2022/assets/51862240/658810cc-2c15-487e-a27b-4894ed80d668)


- Filter based on IP protocol:
```bash
./logparser.sh access.log --servprot IPv4
```
![image](https://github.com/PKalozoumis/CEID-OS-LOG-PARSER-2022/assets/51862240/3e6d9d46-736e-4309-989d-43c44c08822b)


- Filter based on date:
```bash
./logparser.sh access.log --datum Feb
```
![image](https://github.com/PKalozoumis/CEID-OS-LOG-PARSER-2022/assets/51862240/9f869995-1991-409f-b1f2-715e2e8de05d)
