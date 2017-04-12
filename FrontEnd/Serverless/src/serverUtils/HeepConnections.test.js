import assert from 'assert';
import * as connect from './HeepConnections';

var emptyState = {
    clients: {clientArray: []},
    positions: {},
    controls: {controlStructure:{}},
    vertexList: {},
    icons: {},
    url: ''
  }

describe('HeepConnections.js', () => {
	describe('ResetMasterState', () => {
		it('Returns an empty masterState', () => {
		  	assert.deepEqual(emptyState, connect.ResetMasterState());
		});
	});

	describe('GetMasterState', () => {
		it('Returns masterState', () => {
			connect.ResetMasterState();
		  	assert.deepEqual(emptyState, connect.GetCurrentMasterState());
		});
	});

	describe('FindGateway', () => {
		it('Returns an array with 3 values', () => {
			var ip = connect.findGateway();
		  	assert.equal(3, ip.length);
		});
	});

	describe('GetNecessaryBytes', () => {
		it('Returns corrent value from 1 byte input', () => {
			assert.equal(1, connect.GetNecessaryBytes(200));
		});
		it('Returns corrent value from multiple byte input', () => {
			assert.equal(2, connect.GetNecessaryBytes(1241));
		})
	});

	describe('GetByteArrayFromValue', () => {
		it('Returns correct byte array from input value', () => {
			var expectedResponse = Buffer.from([0x01, 0x02, 0x03, 0x04]);
			assert.deepEqual(expectedResponse, connect.GetByteArrayFromValue(16909060))
		})
	})

});