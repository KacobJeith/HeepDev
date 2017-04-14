import assert from 'assert'
import * as utils from './generalUtils'

describe('generalUtils', () => {
	describe('nameVertex', () => {
		it('Names a Vertex with numeric IDs', () => {
			var vertex = {
			    txClientID: 1, 
			    rxClientID: 2,
			    txControlID: 3,
			    rxControlID: 4, 
			    rxIP: '10.0.0.1'
			  };

			assert.equal('1.3->2.4', utils.nameVertex(vertex));
		})
	})
})