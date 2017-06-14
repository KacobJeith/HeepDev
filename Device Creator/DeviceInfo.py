from ControlInfo import ControlInfo

class DeviceInfo:

	# Basic Info
	deviceName = "Default"
	numControls = 0
	deviceSystem = "PC"
	controlArr = []

	def __init__(self):

		return

	def GetDeviceName(self) :
		return raw_input('Enter device name: ')

	def GetNumControls(self) :
		numControlStr = raw_input('Enter number of controls: ')
		return int(numControlStr)

	def GetOperatingSystem(self) :
		print "Enter System Type :"
		print "    lin - Used for linux like operating systems"
		print "    ard - Arduino firmware"
		print "    sim - Simulation system"
		OS = raw_input(': ')
		return OS


	def GetDeviceInfo(self) :
		self.deviceSystem = self.GetOperatingSystem()
		self.deviceName = self.GetDeviceName()
		self.numControls = self.GetNumControls()

		self.controlArr = []

		for x in range(0, self.numControls) :
			newControl = ControlInfo(x)
			print 'Enter Information for Control ' + str(x)
			newControl.GetControlInfo()
			self.controlArr.append(newControl)

