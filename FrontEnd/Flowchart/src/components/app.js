import React from 'react';
import ReactDOM from 'react-dom';
import $ from 'jquery';
import Flowchart from './Flowchart';

class App extends React.Component {
  constructor() {
    super();
    this.state = {
      clientList: [],
      currentlySelectedClient: [],
      currentOutput: [],
      currentInput: []
    }

    this.loadClientsFromServer = this.loadClientsFromServer.bind(this);
  }

  // ClientList AJAX
  loadClientsFromServer(url) {
      $.ajax({
      url: url,
      cache: false,
      success: (data) => {
        this.setState({clientList: data});

      },
      error: function(xhr, status, err) {
        console.error(url, status, err.toString());
      }
    });

  }

  componentWillMount(){
    this.loadClientsFromServer('/api/clients');
  }


  render() {
    const styles = {
        header: {
          backgroundColor: "#43464c", 
          paddingLeft: 15,
          color: "#e1e3e8"
        }
      };

    const inputs = {
      header: {
        style: styles.header,
        key: "Header"
      },
      flowchart: {
          hideSourceOnDrag: true,
          clientList: this.state.ClientList
      }
    }

    return (<div>
      <h1 {...inputs.header}> Client Dashboard </h1>
      <Flowchart {...inputs.flowchart}/>
      </div>
    );
  }
}

ReactDOM.render(
  <App/>,
  document.getElementById('root')
);
