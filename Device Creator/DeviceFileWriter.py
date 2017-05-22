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

	def WriteControlNames(self, fileDescriptor, deviceInfo) :
		for x in range(0, len(deviceInfo.controlArr) ) :
			print "Write Control Name " + deviceInfo.controlArr[x].controlName
			fileDescriptor.write("char controlName" + str(x) + " [] = \"" + deviceInfo.controlArr[x].controlName + "\";\n")
			fileDescriptor.write("Control control" + str(x) + ";\n")

	def WriteControlDefinitions(self, fileDescriptor, deviceInfo) :
		for x in range(0, len(deviceInfo.controlArr) ) :
			fileDescriptor.write("	control" + str(x) + ".controlName = controlName" + str(x) + ";\n")
			fileDescriptor.write("	control" + str(x) + ".controlID = " + str(deviceInfo.controlArr[x].controlID) + ";\n")
			fileDescriptor.write("	control" + str(x) + ".controlDirection = " + str(deviceInfo.controlArr[x].controlDirection) + ";\n")
			fileDescriptor.write("	control" + str(x) + ".controlType = " + str(deviceInfo.controlArr[x].controlType) + ";\n")
			fileDescriptor.write("	control" + str(x) + ".highValue = " + str(deviceInfo.controlArr[x].highVal) + ";\n")
			fileDescriptor.write("	control" + str(x) + ".lowValue = " + str(deviceInfo.controlArr[x].lowVal) + ";\n")
			fileDescriptor.write("	control" + str(x) + ".curValue = " + str(deviceInfo.controlArr[x].curVal) + ";\n")
			fileDescriptor.write("	AddControl(control" + str(x) + ");\n")
									

	def WriteSetupFunction(self, fileDescriptor, deviceInfo) :
		fileDescriptor.write("void setup()\n")
		fileDescriptor.write("{\n")
		fileDescriptor.write("	SetupHeepDevice(" + deviceInfo.deviceName + ");\n")
		self.WriteControlDefinitions(fileDescriptor, deviceInfo)

	def WriteArduinoFile(self, deviceInfo, filePath) :

		fileName = self.GetFileName(deviceInfo)
		finalFilePath = self.GetFinalFilePath(deviceInfo, filePath)

		f = open(finalFilePath + fileName, 'w')
		
		print "Begin File Write"

		f.write("#include \"Heep_API.h\"\n")
		f.write("char deviceName [] = \"" + deviceInfo.deviceName + "\";\n")
		self.WriteControlNames(f, deviceInfo)
		self.WriteSetupFunction(f, deviceInfo)
		f.close()

		return