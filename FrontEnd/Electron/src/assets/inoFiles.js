import ClimateSensorInoFile from '../../DeviceBuilderExamples/ClimateSensor/ClimateSensor/ClimateSensor.ino'
import CloseOpenSensorInoFile from '../../DeviceBuilderExamples/CloseOpenSensor/CloseOpenSensor/CloseOpenSensor.ino'
import EncoderInoFile from '../../DeviceBuilderExamples/EncoderReader/Encoder/Encoder.ino'
import PiezoBuzzerInoFile from '../../DeviceBuilderExamples/PiezoBuzzer/PiezoBuzzer/PiezoBuzzer.ino'
import PassiveIRInoFile from '../../DeviceBuilderExamples/PassiveIRSensor/PassiveIR/PassiveIR.ino'
import ServoInoFile from '../../DeviceBuilderExamples/ServoController/Servo/Servo.ino'
import SoilSensorInoFile from '../../DeviceBuilderExamples/SoilHygrometer/SoilHygrometer/SoilHygrometer.ino'

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