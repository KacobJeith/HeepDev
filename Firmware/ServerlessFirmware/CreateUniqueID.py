import datetime
import hashlib

curdTime = datetime.datetime.now()
hashString = str(curdTime.day) + str(curdTime.month) + str(curdTime.year) + str(curdTime.hour) + str(curdTime.minute) + str(curdTime.second) + str(curdTime.microsecond)
m = hashlib.md5()
m.update(hashString)
mySha1 = m.hexdigest()
print mySha1
deviceIDArr = []

for x in range(0, 6) :
	deviceIDArr.append(mySha1[x])

print deviceIDArr

deviceID = 0
for x in range(0, 4) :
	deviceID += ord(deviceIDArr[x]) << x*8

deviceIDStr = "unsigned long deviceID = " + str(deviceID) + ";\n"
print deviceIDStr

macAddrStr = "uint8_t mac[6] = {"

for x in range(0, 6) :
	macAddrStr += str(ord(deviceIDArr[x])) + ","

macAddrStr += "};\n"

print macAddrStr

# f = open('myfile', 'w')
# f.write('hi there\n')  # python will convert \n to os.linesep
# f.close()  # you can omit in most cases as the destructor will call it