import React from 'react';
import ReactDOM from 'react-dom';
import $ from 'jquery';
import DraggableContainer from './DraggableContainer';

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

        console.log(this.state.clientList);

      },
      error: function(xhr, status, err) {
        console.error(url, status, err.toString());
      }
    });

  }

  componentDidMount(){
    this.loadClientsFromServer('/api/clients');
    this.loadClientsFromServer.bind(this);
  }


  render() {
    const styles = {
        header: {
          backgroundColor: "#43464c", 
          paddingLeft: 15,
          height: 40,
          width: "100%",
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
          clientList: this.state.clientList
      }
    }

    return (<div>
      <h1 {...inputs.header}> Client Dashboard </h1>
      <DraggableContainer {...inputs.flowchart}/>
      </div>
    );
  }
}

ReactDOM.render(
  <App/>,
  document.getElementById('root')
);
