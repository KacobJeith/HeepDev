import assert from 'assert';
import * as parser from './HeepMemoryParser';

describe('HeepMemoryParser', () => {
	describe('ReadFirmwareVersion(buffer)', () => {
		it('Should return value stored in the second byte', () => {
			var buffer = [0x01, 0x02];
		  	assert.equal(2, parser.ReadFirmwareVersion(buffer));
		});
	});
});