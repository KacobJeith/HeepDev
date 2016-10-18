from PLCClient import PLCClient

client = PLCClient(1, '123.42', 'Jorge', [])
client.SetClientFromString('192.168.1.1,2,Kadelope,0,Mexico,0,Torid,1,Jao,0,100')

print client.IPAddress
print client.ControlList

for x in range(0, len(client.ControlList)) :
	print client.ControlList[x].ControlName

print client.GetClientString()