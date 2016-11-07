import React from 'react';
import ReactDOM from 'react-dom';
import $ from 'jquery';
import Flowchart from './Flowchart';

class App extends React.Component {
  render() {
    const styles = {
        header: {
          backgroundColor: "#43464c", 
          paddingLeft: 15,
          color: "#e1e3e8"
        }
      };

    return (<div>
      <h1 style={styles.header} key="Header">Client Dashboard</h1>
      <Flowchart hideSourceOnDrag={true}/>
      </div>
    );
  }
}

ReactDOM.render(
  <App/>,
  document.getElementById('root')
);
