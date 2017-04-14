import assert from 'assert'
import * as utils from './ByteUtilities'

describe('ByteUtilities', () => {

	describe('GetNecessaryBytes', () => {
		it('Returns corrent value from 1 byte input', () => {
			assert.equal(1, utils.GetNecessaryBytes(200));
		});
		it('Returns corrent value from multiple byte input', () => {
			assert.equal(2, utils.GetNecessaryBytes(1241));
		})
	});

	describe('GetByteArrayFromValue', () => {
		it('Returns correct byte array from large input value', () => {
			var expectedResponse = Buffer.from([0x01, 0x02, 0x03, 0x04]);
			assert.deepEqual(expectedResponse, utils.GetByteArrayFromValue(16909060))
		})
		it('Returns correct byte array from small input value', () => {
			var expectedResponse = Buffer.from([0x01, 0x1F]);
			assert.deepEqual(expectedResponse, utils.GetByteArrayFromValue(287))
		})
	})

	describe('GetClientIDAsByteArray', () => {
		it('Allocates 4 bytes for every value', () => {
			var response = utils.GetClientIDAsByteArray(1);
			assert.equal(4, response.length);
		})
		it('Returns correctly for 4byte response', () => {
			var expectedResponse = [0x01, 0x02, 0x03, 0x04];
			assert.deepEqual(expectedResponse, utils.GetClientIDAsByteArray(16909060));
		})
		it('Returns correctly for 1byte response', () => {
			var expectedResponse = [0x00, 0x00, 0x00, 0x01];
			assert.deepEqual(expectedResponse, utils.GetClientIDAsByteArray(1));
		})
	})

})