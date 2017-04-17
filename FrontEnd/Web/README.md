# Setup
1. In the command prompt in the PLC/Flowchart/FrontEnd directory, run `>>npm install`
2. run `>>npm run bs`
3. Open up `localhost:3001` in your browser to view the PLC Dashboard

To open the page from another computer, enter '[IP_ADDRESS]:3001' from within the browser on a second computer or tablet

If you would like to take advantage of hot-reloading for expedited development, then:
1. In the command prompt in the PLC/Flowchart/FrontEnd directory, run `>>npm install`
2. run `>>npm run bs` 
3. run `>>npm run dev`
4. open up `localhost:8080\src` in your browser to view the PLC Dashboard
5. Anytime you save changes to the source code, the changes should immediately display on port 8080!

# Usage
To create a new Client Vertex:
1. Add the output control (indicated by red dots) by clicking on the desired output
2. Add the desired input control (indicated by green dots) by clicking sebsequently.
3. The SetVertex command should update to the server's CommandQueue.tmp file, and the selected vertex should be added to the ClientList.json file immediately. 


# Not Yet Implemented

* Draw Vertex line paths by generating an SVG line between selected client controls
* Store rendering data to the server so that every time you open the Dashboard it looks the same
