from DeviceInfo import DeviceInfo
from DeviceFileWriter import DeviceWriter

def GetFilePath() :
	filePath = raw_input('Enter relative file path: ')
	return filePath

filePath = GetFilePath()

theDeviceInfo = DeviceInfo()
theDeviceInfo.GetDeviceInfo()

DeviceWriter(theDeviceInfo, filePath)