import socket 

PORT = 1234

with socket.socket() as s:
	s.bind(('',PORT))
	s.listen(1)
	c,a= s.accept()
	with c:
		print("Connected %s",a)
		print("Recv'd %s",c.recv(1024))