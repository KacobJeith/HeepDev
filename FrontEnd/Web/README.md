# Heep Web Portal
This repository is a NodeJS Web Application that allows users to visualize online Heep Devices, define relational vertices, and directly control devices functionality. 

## Setup
1. In the command prompt in the HeepDev/Frontend/Web directory, run `>>npm install`
2. run `>>npm run bs`
3. Open up `localhost:3001` in your browser to view the Heep Device Dashboard

To open the page from another computer, enter '[IP_ADDRESS]:3001' from within the browser on a second computer or tablet'

## Development

### Unit Tests
Heep is a strong believer in unit testing our code! Pull Requests are expected to contain parallel unit testing so that our codebase grows safely. This codebase uses Mocha as a unit testing platform. Testable *.js functions should be accompanied by a *.test.js file, which Mocha will automatically run during tests. For further info on mocha, check out their [documentation](https://mochajs.org/).

#### To run tests: 
1. From the HeepDev/Frontend/Web directory, run `>> npm run tests`
2. Test results will be displayed in the terminal
3. * To check equality on objects, use `assert.deepEqual() `

To build new tests, the syntax in javascript syntax is simple: 
~~~~
import assert from 'assert'
import * as generalUtils from './generalUtilities'

describe('generalUtils', () => {
	describe('nameVertex', () => {
		it('Names a Vertex with numeric IDs', () => {
			var vertex = {
			    txDeviceID: 1, 
			    rxDeviceID: 2,
			    txControlID: 3,
			    rxControlID: 4, 
			    rxIP: '10.0.0.1'
			  };

			assert.equal('1.3->2.4', generalUtils.nameVertex(vertex));
		})
	})
})
~~~~


### Hot-Reloading
If you would like to take advantage of hot-reloading for expedited development, then:
1. In the command prompt in the HeepDev/Frontend/Web directory, run `>>npm install`
2. run `>>npm run bs` 
3. run `>>npm run dev`
4. open up `localhost:8080\src` in your browser to view the Heep Device Portal
5. Anytime you save changes to the source code, the changes should immediately display on port 8080!

### Usage
#### Create a new Heep Device Vertex:
1. Define the output control by clicking on the red dot next to the desired output
2. Define the input control by clicking on the green dot next to the desired input

#### Position Devices:
1. Drag the card from the icon or title bar
2. The position should be persistent across browsers/devices

#### Send A Control Value: 
1. Use either the slider or the on/off button to send values to that control on the device
