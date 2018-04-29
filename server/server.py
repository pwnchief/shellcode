import socket 
import struct


PORT = 1234

with socket.socket() as s:
	s.bind(('',PORT))
	s.listen(1)
	c,a= s.accept()
	with c:
		print("Connected by %s",a)
		buff = c.recv(6)
		if buff != b"JARVIS":
			print("Failed to connect")
			print("REcieved %s" % repr(buff))
		stage1 = open("stage1.bin",'rb').read()
		c.sendall(struct.pack("Q",len(stage1)))
		c.sendall(stage1)


	print("Connected")