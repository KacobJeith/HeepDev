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
    return (
      <div className="clientsBox">
      <h1>ClientsList</h1>
      <ClientsList data={this.state.data} />
      </div>
    );
  }
});


var ClientsList = React.createClass({
  render: function() {
    
    var clientNodes = this.props.data.map(function(client) {
      return (
        <ClientMetaData ipaddress={client.IPAddress} >
          {client.ClientName}
        </ClientMetaData>
      );
    });

    return (
      <div className="clientList">        
        {clientNodes}
      </div>
    );
  }
});

var ClientMetaData = React.createClass({

  rawMarkup: function() {
    var md = new Remarkable();
    var rawMarkup = md.render(this.props.children.toString());
    return { __html: rawMarkup };
  },

  render: function() {
    var md = new Remarkable();
    return (
      <div className="Clients">
        <h2 className="PLCIP">
          {this.props.ipaddress}
        </h2>
        <span dangerouslySetInnerHTML={this.rawMarkup()} />
      </div>
    );
  }
});

ReactDOM.render(
  <PLCClientsBox url="/api/clients" pollInterval={2000} />,
  document.getElementById('content')
);