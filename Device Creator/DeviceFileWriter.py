import subprocess

class DeviceWriter:

	def __init__(self, deviceInfo, filePath) :
		self.WriteScriptFile(deviceInfo, filePath)
		self.WriteArduinoFile(deviceInfo, filePath)
		return

	def GetFileName(self, deviceInfo) :
		return deviceInfo.deviceName + '.ino'

	def GetFinalFilePath(self, deviceInfo, filePath) :
		return filePath + deviceInfo.deviceName + '/'

	def WriteScriptFile(self, deviceInfo, filePath) :
		filePath = self.GetFinalFilePath(deviceInfo, filePath)
		fileName = self.GetFileName(deviceInfo)

		pathToFiles = '../Firmware/ServerlessFirmware/'

		f = open('CopyScript.sh', 'w')
		f.write('#!/bin/bash\n')
		f.write('echo \"Begin Copy Script\"\n')  
		f.write('mkdir ' + filePath + '\n')
		f.write('cp -r ' + pathToFiles + ' ' + filePath + '\n')
		f.write('touch ' + filePath + fileName + '\n')
		f.close()

		subprocess.call("bash CopyScript.sh", shell=True)
		return

	def WriteArduinoFile(self, deviceInfo, filePath) :



		return