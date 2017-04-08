import assert from 'assert';
import * as utils from './HeepIconUtils';


describe('HeepIconUtils', () => {
	
	describe('getDefaultIcons', () => {
		it('Returns an array', () => {
		  	assert.equal(true, Array.isArray(utils.getDefaultIcons()));
		});

		it('Return array contains strings', () => {
			var result = utils.getDefaultIcons()
		  	assert.equal("string", typeof result[0]);
		});
	});

	describe('generateIconKeywords', () => {
		it('Returns with one input', () => {
			var expectedResult = {light: 'light'};
			var input = ['light'];
			assert.equal(JSON.stringify(expectedResult), JSON.stringify(utils.generateIconKeywords(input)))
		})
		it('Returns with two inputs', () => {
			var expectedResult = {light: 'light', bulb: 'bulb'};
			var input = ['light', 'bulb'];
			assert.equal(JSON.stringify(expectedResult), JSON.stringify(utils.generateIconKeywords(input)))
		})
		it('Returns with dashed inputs', () => {
			var expectedResult = {light: 'light-bulb', bulb: 'light-bulb'};
			var input = ['light-bulb'];
			assert.equal(JSON.stringify(expectedResult), JSON.stringify(utils.generateIconKeywords(input)))
		})
	})

	describe('suggestIconForClient', () => {
		it('Suggests a new icon', () => {
			assert.equal('light-bulb', utils.suggestIconForClient('Bulby'))
		})
		it('Suggests none when no match', () => {
			assert.equal('none', utils.suggestIconForClient('asdfawverve'))
		})
	})
});