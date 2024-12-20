import socket
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.connect(('192.168.100.100',9004))
print("Sending LON")
sock.send(b"LON\r")
print(sock.recv(1024))
sock.close()