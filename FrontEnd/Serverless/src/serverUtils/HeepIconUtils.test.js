import assert from 'assert';
import * as utils from './HeepIconUtils';


describe('HeepIconUtils', () => {
	
	describe('getDefaultIcons', () => {
		it('Should be an array', () => {
		  	assert.equal(true, Array.isArray(utils.getDefaultIcons()));
		});

		it('Should contain strings', () => {
			var result = utils.getDefaultIcons()
		  	assert.equal("string", typeof result[0]);
		});
	});
});