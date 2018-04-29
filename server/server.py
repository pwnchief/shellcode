import socket 
import struct


PORT = 1234


def encrypt(buf,key):
	obuf = b""
	for b in buf:
		obuf += (b ^ key).to_bytes(1,"big")
	return obuf


with socket.socket() as s:
	s.bind(('',PORT))
	s.listen(1)
	s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
	c,a= s.accept()
	with c:
		print("Connected by %s",a)
		buff = c.recv(6)
		if buff != b"JARVIS":
			print("Failed to connect")
			print("REcieved %s" % repr(buff))
		stage1 = open("stage1.bin",'rb').read()
		c.sendall(struct.pack("Q",len(stage1)))

		c.sendall(encrypt(stage1,len(stage1)))

		print("Connected and sent stage1")

