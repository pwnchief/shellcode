##Shellcode
A simple C&C server with paylaod delivery system to work in Attack and Defence style CTF's.
Working on adding encryption to prevent detection over the wire.

#Running the project

The project is based on a Linux Platform as all syscalls are according to the Linux manuals

Clone the project and to build the project use

`make build`

to clean the project run 

`make clean`

make sure the server is running **NOTE: The server runs on localhost and on port 1234**

`python server.py`

to test the paylaod delivery system use 

`make test`

**NOTE: Working on adding more payload options and modules to the staged exploits**