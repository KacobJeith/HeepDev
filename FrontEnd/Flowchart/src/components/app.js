import React from 'react';
import ReactDOM from 'react-dom';
import $ from 'jquery';
import Flowchart from './Flowchart';

class App extends React.Component {
  constructor() {
    super();
    this.state = {
      clientListData: [],
    }

    this.loadClientsFromServer = this.loadClientsFromServer.bind(this);
  }

  // ClientList AJAX
  loadClientsFromServer(url) {
      $.ajax({
      url: url,
      cache: false,
      success: (data) => {
        this.setState({clientListData: data});

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
