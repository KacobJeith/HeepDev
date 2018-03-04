import fileDownload from 'react-file-download'
import JSZip from 'jszip'
import randomNumber from 'random-number-csprng'

import Simulation_HeepCommsH         from '../../../../Firmware/ServerlessFirmware/Simulation_HeepComms.h'
import Simulation_NonVolatileMemoryH from '../../../../Firmware/ServerlessFirmware/Simulation_NonVolatileMemory.h'
import Simulation_TimerH             from '../../../../Firmware/ServerlessFirmware/Simulation_Timer.h'

import Simulation_HeepCommsCPP         from '../../../../Firmware/ServerlessFirmware/Simulation_HeepComms.cpp'
import Simulation_NonVolatileMemoryCPP from '../../../../Firmware/ServerlessFirmware/Simulation_NonVolatileMemory.cpp'
import Simulation_TimerCPP           from '../../../../Firmware/ServerlessFirmware/Simulation_Timer.cpp'

import ESP8266_HeepCommsH         from '../../../../Firmware/ServerlessFirmware/ESP8266_HeepComms.h'
import ESP8266_NonVolatileMemoryH from '../../../../Firmware/ServerlessFirmware/ESP8266_NonVolatileMemory.h'

import ESP8266_HeepCommsCPP         from '../../../../Firmware/ServerlessFirmware/ESP8266_HeepComms.cpp'
import ESP8266_NonVolatileMemoryCPP from '../../../../Firmware/ServerlessFirmware/ESP8266_NonVolatileMemory.cpp'

import Arduino_TimerH             from '../../../../Firmware/ServerlessFirmware/Arduino_Timer.h'
import Arduino_TimerCPP           from '../../../../Firmware/ServerlessFirmware/Arduino_Timer.cpp'



import { sys_phy_files } from '../utilities/SystemPHYCompatibilities'

var sourceFiles = {
  Simulation_HeepCommsH: Simulation_HeepCommsH,
  Simulation_NonVolatileMemoryH: Simulation_NonVolatileMemoryH,
  Simulation_TimerH: Simulation_TimerH,
  Simulation_HeepCommsCPP: Simulation_HeepCommsCPP,
  Simulation_NonVolatileMemoryCPP: Simulation_NonVolatileMemoryCPP,
  Simulation_TimerCPP: Simulation_TimerCPP,
  ESP8266_HeepCommsH: ESP8266_HeepCommsH,
  ESP8266_HeepCommsCPP: ESP8266_HeepCommsCPP,
  ESP8266_NonVolatileMemoryH: ESP8266_NonVolatileMemoryH,
  ESP8266_NonVolatileMemoryCPP: ESP8266_NonVolatileMemoryCPP,
  Arduino_TimerH: Arduino_TimerH,
  Arduino_TimerCPP: Arduino_TimerCPP
}

export const packageSourceFiles = (deviceDetails, controls) => {

  console.log("Device: ", deviceDetails);
  console.log("Controls: ", controls);
  
  var autoGenIncludes = '';

  var zip = new JSZip();

  switch (deviceDetails.systemType) {
    case "ESP8266" :

      packageESP8266Files(deviceDetails, controls, zip);
      autoGenIncludes = getIncludes_ESP8266(deviceDetails);

      break

    case "Simulation" :

      packageSimulationFiles(deviceDetails, controls, zip);
      autoGenIncludes = getIncludes_Simulation(deviceDetails);

      console.log(autoGenIncludes);
      break

    default :
      console.log("Did not match systemType");
  }

  zip = getPHYforSys(deviceDetails.systemType, deviceDetails.physicalLayer, zip);

  var nameZip = deviceDetails.deviceName + '.zip';

  setIDAndMAC((deviceIDarray, MACAddressArray) => {

    zip.file('HeepDeviceDefinitions.h', generateDeviceDefinitionsFile(deviceIDarray, MACAddressArray, autoGenIncludes));

    zip.generateAsync({type:"blob"})
    .then(function(content) {
        fileDownload(content, nameZip);
    });
  })
  

}

const packageESP8266Files = (deviceDetails, controls, zip) => {

  zip.file(deviceDetails.deviceName + ".ino", composeInoFile(deviceDetails, controls));

  zip.file('ESP8266_NonVolatileMemory.h', ESP8266_NonVolatileMemoryH);
  zip.file('Arduino_Timer.h', Arduino_TimerH);
  zip.file('ESP8266_NonVolatileMemory.cpp', ESP8266_NonVolatileMemoryCPP);
  zip.file('Arduino_Timer.cpp', Arduino_TimerCPP);

  return zip
}

const packageSimulationFiles = (deviceDetails, controls, zip) => {

  zip.file(deviceDetails.deviceName + ".ino", composeInoFile(deviceDetails, controls));

  zip.file('Simulation_NonVolatileMemory.h', Simulation_NonVolatileMemoryH);
  zip.file('Simulation_Timer.h', Simulation_TimerH);
  zip.file('Simulation_NonVolatileMemory.cpp', Simulation_NonVolatileMemoryCPP);
  zip.file('Simulation_Timer.cpp', Simulation_TimerCPP);

  return zip
}

const getPHYforSys = (sys, phy, zip) => {

  var physicalLayerFilenameRefH = sys_phy_files[sys][phy]["HeaderFile"];
  var physicalLayerFileNameRefCPP = sys_phy_files[sys][phy]["CPPFile"];

  var headerSourceRef = physicalLayerFilenameRefH.split('.')[0] + "H";
  var cppSourceRef = physicalLayerFileNameRefCPP.split('.')[0] + "CPP";

  console.log(headerSourceRef);
  console.log(cppSourceRef);

  zip.file(physicalLayerFileNameRefCPP, sourceFiles[cppSourceRef]);
  return zip.file(physicalLayerFilenameRefH, sourceFiles[headerSourceRef]);
}

const composeInoFile = (deviceDetails, controls) => {

    var fileContent = `
#include "HeepDeviceDefinitions.h"\n`
+ initializeControls(controls)
+ createHardwareControlFunctionsArduinoSyntax(controls)
+ CreateHardwareReadFunctions(controls)
+ CreateHardwareWriteFunctions(controls)
+ `void setup()
{

  Serial.begin(115200);\n`
+ setControls(controls)
+ `StartHeep("`+ deviceDetails.deviceName + `", ` + deviceDetails.iconSelected + `);\n\n
}

void loop()
{
  PerformHeepTasks();\n`
+ GetReadWriteFunctionCalls(controls)
+ `\n}`

  return fileContent
}

var getPinDefineName = (control) => {
  var pinDefineStr = control.controlName.toUpperCase() + `_PIN`;
  return pinDefineStr;
}

var getPinDefine = (control) => {
  var pinDefineStr = `\n#define `+ getPinDefineName(control) + ` ` + control.pinNumber;
  return pinDefineStr;
}

var GetTabCharacter = () => {
  return `  `;
}

var GetReadFunctionName = (control) => {
  var ReadFunctionName = `Read` + control.controlName;
  return ReadFunctionName;
}

var GetWriteFunctionName = (control) => {
  var WriteFunctionName = `Write` + control.controlName;
  return WriteFunctionName;
}

var createHardwareControlFunctionsArduinoSyntax = (controls) => {
  var hardwareInitializations = `\nvoid InitializeControlHardware(){`;

  // output == 1, input == 0 
  // TODO: Make control direction into an enum with defined numbers just like Unity
  for (var i in controls) {
    var arduinoDirection = "OUTPUT";
    if(controls[i].controlDirection == 1){
      arduinoDirection = "INPUT";
    }

    hardwareInitializations += `\n` + GetTabCharacter() + `pinMode(` + getPinDefineName(controls[i]) + `,` + arduinoDirection + `);`;
  }

  hardwareInitializations += `\n}\n\n`;

  return hardwareInitializations;
}

// TODO: Make this function handle control types that are not just pin reads
var CreateHardwareReadFunctions = (controls) => {
  var hardwareReadFunctions = ``;

  // output == 1, input == 0 
  // TODO: Make control direction into an enum with defined numbers just like Unity
  for (var i in controls) {

    var notSign = ``;
    if(controls[i].pinNegativeLogic){
      notSign = `!`;
    }

    // Only react to outputs. Heep Outputs are Hardware Inputs
    if(controls[i].controlDirection == 1){
      hardwareReadFunctions += `int ` + GetReadFunctionName(controls[i]) + `(){\n`
        + GetTabCharacter() + `int currentSetting = ` + notSign + controls[i]['analogOrDigital'] + `Read(` + getPinDefineName(controls[i]) + `);\n`
        + GetTabCharacter() + `SendOutputByIDNoAnalytics(` + controls[i].controlID + `,currentSetting);\n`
        + GetTabCharacter() + `return currentSetting;\n`
        + `}\n\n`;
    }
  }

  return hardwareReadFunctions;

}

// TODO: Make this function handle control types that are not just pin writes
var CreateHardwareWriteFunctions = (controls) => {
  var hardwareWriteFunctions = ``;

  // output == 1, input == 0 
  // TODO: Make control direction into an enum with defined numbers just like Unity
  for (var i in controls) {

    var notSign = ``;
    if(controls[i].pinNegativeLogic){
      notSign = `!`;
    }

    // Only react to inputs. Heep inputs are Hardware Outputs
    if(controls[i].controlDirection == 0){
      hardwareWriteFunctions += `int ` + GetWriteFunctionName(controls[i]) + `(){\n`
        + GetTabCharacter() + `int currentSetting = GetControlValueByID(` + controls[i].controlID + `);\n`
        + GetTabCharacter() + controls[i]['analogOrDigital'] + `Write(` + getPinDefineName(controls[i]) + `,` + notSign + `currentSetting);\n`
        + GetTabCharacter() + `return currentSetting;\n`
        + `}\n\n`;
    }
  }

  return hardwareWriteFunctions;

}

var GetReadWriteFunctionCalls = (controls) => {
  var readWriteFunctions = ``;

  console.log("Enter readwrite function calls");

  // output == 1, input == 0 
  // TODO: Make control direction into an enum with defined numbers just like Unity
  for (var i in controls) {
    console.log("Readwrite " + i);

    if(controls[i].controlDirection == 1){
      readWriteFunctions += GetTabCharacter() + GetReadFunctionName(controls[i]) + `();`;
    }
    else{
      readWriteFunctions += GetTabCharacter() + GetWriteFunctionName(controls[i]) + `();`;
    }

    readWriteFunctions += `\n`;
  }

  console.log(readWriteFunctions);

  return readWriteFunctions;
}

const initializeControls = (controls) => {

  var controlDefs = ``;
  for (var i in controls) {
    controlDefs += getPinDefine(controls[i]) + `\n\n`
  }

  return controlDefs

}

const createOnOffControl = (control) => {
  var controlStringToReturn = ``;

   controlStringToReturn += `AddOnOffControl("` + control.controlName + `",`;

   if(control.controlDirection == 0){
    controlStringToReturn += "HEEP_INPUT,";
   }
   else {
    controlStringToReturn += "HEEP_OUTPUT,";
   }

   controlStringToReturn += control.curValue + `);\n`;
   
   return controlStringToReturn;
}

const createRangeControl = (control) => {
   var controlStringToReturn = ``;

   controlStringToReturn += `AddRangeControl("` + control.controlName + `",`;

   if(control.controlDirection == 0){
    controlStringToReturn += "HEEP_INPUT,";
   }
   else {
    controlStringToReturn += "HEEP_OUTPUT,";
   }

   controlStringToReturn += control.highValue + `,`;
   controlStringToReturn += control.lowValue + `,`;
   controlStringToReturn += control.curValue + `);\n`;
   
   return controlStringToReturn;
}

const setControls = (controls) => {
  var controlConfigs = ``;
  
  for (var i in controls) {
    console.log("Control Type: " + controls[i].controlType);
    if(controls[i].controlType == 0){
      controlConfigs += createOnOffControl(controls[i]);
    }
    else if(controls[i].controlType == 1){
      controlConfigs += createRangeControl(controls[i]);
    }
  }

  return controlConfigs
}

const setIDAndMAC = (launchDownloadCallback) => {

  var deviceIDArray = [];
  var MACAddressArray = [];

  randomNumber(0, 255)
  .then( (IDbyte1) => {

    deviceIDArray.push(IDbyte1);

    return randomNumber(0, 255)

  }).then((IDbyte2) => {

    deviceIDArray.push(IDbyte2);

    return randomNumber(0, 255);

  }).then((IDbyte3) => {

    deviceIDArray.push(IDbyte3);

    return randomNumber(0, 255);

  }).then((IDbyte4) => {
    
    deviceIDArray.push(IDbyte4);

    return randomNumber(0, 100);

  }).then((MACbyte1) => {
    
    MACAddressArray.push(MACbyte1);

    return randomNumber(0, 100);

  }).then((MACbyte2) => {
    
    MACAddressArray.push(MACbyte2);

    return randomNumber(0, 100);

  }).then((MACbyte3) => {
    
    MACAddressArray.push(MACbyte3);

    return randomNumber(0, 255);

  }).then((MACbyte4) => {
    
    MACAddressArray.push(MACbyte4);

    return randomNumber(0, 100);

  }).then((MACbyte5) => {
    
    MACAddressArray.push(MACbyte5);

    return randomNumber(0, 100);

  }).then((MACbyte6) => {
    
    MACAddressArray.push(MACbyte6);

    launchDownloadCallback(deviceIDArray, MACAddressArray);

  }).catch({code: "RandomGenerationError"}, (err) => {

    console.log("Something went wrong with promise chain...");

  });

}

const generateDeviceDefinitionsFile = (deviceIDarray, MACAddressArray, autoGenIncludes) => {

  var autoGenContent = `#include <Heep_API.h>\n`;
  autoGenContent += autoGenIncludes;
  autoGenContent += `heepByte deviceIDByte [STANDARD_ID_SIZE] = {` + convertIntToHex(deviceIDarray) + `};\n`;
  autoGenContent += `uint8_t mac[6] = {` + convertIntToHex(MACAddressArray) + `};\n`;
  
  return autoGenContent
}

const convertIntToHex = (array) => {
  
  var commaString = '';

  for (var i in array) {
    commaString += '0x' + (array[i]).toString(16);

    if (i != array.length - 1) {
      commaString += ',';
    }
  }

  console.log("Hex Generated: ", commaString);

  return commaString
}

const getCommsFileName = (deviceDetails) => {
  var sys = deviceDetails.systemType;
  var phy = deviceDetails.physicalLayer;

  console.log(sys_phy_files);
  console.log(sys);
  console.log(phy);

  return sys_phy_files[sys][phy]["HeaderFile"];
}

const getIncludes_Simulation = (deviceDetails) => {
  return `#include "` + getCommsFileName(deviceDetails) + `"
#include "Simulation_NonVolatileMemory.h"
#include "Simulation_Timer.h" \n`
}

const getIncludes_ESP8266 = (deviceDetails) => {
  return `String SSID = "` + deviceDetails.ssid + `";
  String Password = "` + deviceDetails.ssidPassword + `";
  #include "` + getCommsFileName(deviceDetails) + `"
  #include "ESP8266_NonVolatileMemory.h"
  #include "Arduino_Timer.h" \n`
}


