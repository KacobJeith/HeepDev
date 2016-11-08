import React from 'react';
import ReactDOM from 'react-dom';
import $ from 'jquery';
import ClientsList from './Client';

class PLCClientsBox extends React.Component {
  constructor() {
    super();
    this.state = {data: []};
  }

  loadClientsFromServer() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      cache: false,
      success: (data) => {
        this.setState({data: data});
      },
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }
    });
  }

  componentDidMount() {
    this.loadClientsFromServer();
    setInterval(this.loadClientsFromServer.bind(this), this.props.pollInterval);
  }

  render() {
    const headerStyle = {
      backgroundColor: "#43464c", 
      paddingLeft: 15,
      color: "#e1e3e8"
    }

    const footerStyle = {
      clear:'left'
    }

    return (
      <div className="clientsBox">
        <h1 style={headerStyle} key="Header">Client Dashboard</h1>
        <ClientsList data={this.state.data} key="Everything"/> 
        <footer style={footerStyle} key="footer"> <hr></hr> &copy; 2016 Jacob Dylan. </footer>
      </div>
    );
  }
}

ReactDOM.render(
  <PLCClientsBox url="/api/clients" pollInterval={2000} />,
  document.getElementById('root')
);
