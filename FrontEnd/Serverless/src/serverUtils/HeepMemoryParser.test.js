import assert from 'assert';
import * as parser from './HeepMemoryParser';


describe('HeepMemoryParser', () => {
	describe('MemoryCrawler', () => {
		it('Should return array of Heep objects', () => {
			var buffer = Buffer.from([0x01, 0x01, 0x02, 0x03, 0x04, 0x01, 0x01, 0x02, 0x01, 0x02, 0x03, 0x04, 0x09, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x44, 0x4D, 0x44]);
			var expectedResult = [
			{
				op: 1,
			    clientID: 16909060,
			    packetBytes: 1,
			    version: 1
			}, 
			{
				op: 2,
			    clientID: 16909060,
			    packetBytes: 9,
			    control: {
				    ControlID: 2,
				    ControlValueType: 3,
				    ControlDirection: 4,
				    LowValue: 5,
				    HighValue: 6,
				    CurCtrlValue: 7,
				    ControlName: 'DMD'
				  }
			}];
			
		  	assert.equal(JSON.stringify(expectedResult), JSON.stringify(parser.MemoryCrawler(buffer)));
		});
	});
	describe('ReadFirmwareVersion', () => {
		it('Should return version', () => {
			var buffer = Buffer.from([0x01, 0x02]);
		  	assert.equal(2, parser.ReadFirmwareVersion(buffer));
		});
	});
	describe('ReadClientID', () => {
		it('Should Return the correct ID from 4 input bytes', () => {
			var buffer = Buffer.from([0x01, 0x01, 0x02, 0x03, 0x04]);
			var it = 0;
		  	assert.equal(16909060, parser.ReadClientID(buffer, it));
		});
	});
	describe('ReadControl', () => {
		var buffer = Buffer.from([0x03, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x44, 0x4D, 0x44]);

		var control = parser.ReadControl(buffer);
		
		it('Returns correct ControlID', () => {
		  	assert.equal(2, control.ControlID);
		});
		it('Returns correct ControlValueType', () => {
		  	assert.equal(3, control.ControlValueType);
		});
		it('Returns correct ControlDirection', () => {
		  	assert.equal(4, control.ControlDirection);
		});
		it('Returns correct LowValue', () => {
		  	assert.equal(5, control.LowValue);
		});
		it('Returns correct HighValue', () => {
		  	assert.equal(6, control.HighValue);
		});
		it('Returns correct CurCtrlValue', () => {
		  	assert.equal(7, control.CurCtrlValue);
		});
		it('Returns correct ControlName', () => {
		  	assert.equal('DMD', control.ControlName);
		});

	});
	describe('ReadPosition', () => {
		it('Should Return the correct Position from 4 input bytes', () => {
			var buffer = Buffer.from([0x04, 0x01, 0x02, 0x03, 0x04]);
			var expectedResult = {left: 258, top: 772};
		  	assert.equal(JSON.stringify(expectedResult), JSON.stringify(parser.ReadPosition(buffer)));
		});
	});

	describe('ReadClientName', () => {
		it('Should Return the correct Name', () => {
			var buffer = Buffer.from([0x04, 0x74, 0x65, 0x73, 0x74]);
		  	assert.equal('test', parser.ReadClientName(buffer));
		});
	});

	describe('ReadIconID', () => {
		it('Should Return an icon name when passed a single byte', () => {
			var buffer = Buffer.from([0x01, 0x01]);
		  	assert.equal('light-bulb', parser.ReadIconID(buffer));
		});
	});


});