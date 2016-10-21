{/*var React = require('react');
var ReactDOM = require.('react-dom');
*/}
var PLCClientsBox = React.createClass({
  
  loadClientsFromServer: function() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      cache: false,
      success: function(data) {
        this.setState({data: data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },

  getInitialState: function() {
    return {data: []};
  },

  componentDidMount: function() {
    this.loadClientsFromServer();
    setInterval(this.loadClientsFromServer, this.props.pollInterval);
  },

  render: function() {
    var headerStyle = {
      backgroundColor: "#43464c", 
      paddingLeft: 15,
      color: "#e1e3e8"
    }

    return (
      <div className="clientsBox">
        <h1 style={headerStyle}>Client Dashboard</h1>
        <ClientsList data={this.state.data} />
      </div>
    );
  }
});


ReactDOM.render(
  <PLCClientsBox url="/api/clients" pollInterval={2000} />,
  document.getElementById('content')
);