import ClimateSensorInoFile from '../../../../../Heep Product Demos/ClimateSensorGitRepo/ClimateSensor/ClimateSensor.ino'
import CloseOpenSensorInoFile from '../../../../../Heep Product Demos/CloseOpenSensorGitRepo/CloseOpenSensor/CloseOpenSensor.ino'
import EncoderInoFile from '../../../../../Heep Product Demos/EncoderReadGitRepo/Encoder/Encoder.ino'
import PiezoBuzzerInoFile from '../../../../../Heep Product Demos/PiezoBuzzerGitRepo/PiezoBuzzer/PiezoBuzzer.ino'
import PassiveIRInoFile from '../../../../../Heep Product Demos/PIRGitRepo/PassiveIR/PassiveIR.ino'
import ServoInoFile from '../../../../../Heep Product Demos/ServoGitRepo/Servo/Servo.ino'
import SoilSensorInoFile from '../../../../../Heep Product Demos/SoilSensorGitRepo/SoilHygrometer/SoilHygrometer.ino'

export const inoFiles = {
	ClimateSensorFile : ClimateSensorInoFile,
	CloseOpenSensorFile : CloseOpenSensorInoFile,
	EncoderFile : EncoderInoFile,
	PiezoBuzzerFile : PiezoBuzzerInoFile,
	PassiveIRFile : PassiveIRInoFile,
	ServoFile : ServoInoFile,
	SoilSensorFile : SoilSensorInoFile
}

export const applicationNames = {
	Custom : "Custom",
	ClimateSensor : "Climate Sensor",
	CloseOpenSensor : "Close Open Sensor",
	Encoder : "Encoder",
	PiezoBuzzer : "Piezo Buzzer",
	PassiveIR : "Passive IR",
	Servo: "Servo",
	SoilSensor: "Soil Sensor"
}