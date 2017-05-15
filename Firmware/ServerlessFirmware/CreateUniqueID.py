import datetime
import hashlib

curdTime = datetime.datetime.now()
hashString = str(curdTime.day) + str(curdTime.month) + str(curdTime.year) + str(curdTime.hour) + str(curdTime.minute) + str(curdTime.second) + str(curdTime.microsecond)
m = hashlib.md5()
m.update(hashString)
mySha1 = m.hexdigest()
print mySha1
deviceIDArr = []

for x in range(0, 4) :
	deviceIDArr.append(mySha1[x])

print deviceIDArr

deviceID = 0
for x in range(0, 4) :
	deviceID += ord(deviceIDArr[x]) << x*8

print deviceID