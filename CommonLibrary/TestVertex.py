from Vertex import Vertex

def CheckEquality(first, second, testName) :
	if first == second :
		return testName + ': Success'
	return testName + ': Failed******'

myVertex = Vertex()
myVertex.inputName = 'Chad'
myVertex.outputName = 'Steve'
myVertex.destinationID = 123456
myVertex.sourceID = 666
myVertex.destinationIP = 'myIP'

myStr = myVertex.GetVertexString()

newVertex = Vertex()
newVertex.SetVertexFromString(myStr)

print CheckEquality(newVertex.inputName, myVertex.inputName, 'Test Input Name transfer via string')
print CheckEquality(newVertex.outputName, myVertex.outputName, 'Test Output Name transfer via string')
print CheckEquality(newVertex.destinationIP, myVertex.destinationIP, 'Test IP transfer via string')
print CheckEquality(newVertex.destinationID, myVertex.destinationID, 'Test destination ID transfer via string')
print CheckEquality(newVertex.sourceID, myVertex.sourceID, 'Test source ID transfer via string')