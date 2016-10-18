

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
        <ClientMetaData Client= {client}></ClientMetaData>
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

  render: function() {
    return (
      <div class="row">
        <h3 class="PLCIP">
          {this.props.Client.IPAddress}
        </h3>
        <div class="col-md-4"> 
          <p>Name: {this.props.Client.ClientName}</p>
          <p>Type: {this.props.Client.ClientType}</p>
          <p>IP: {this.props.Client.IPAddress}</p>
          <ControllerList data={this.props.Client["ControlList"]} />
        </div>
      </div>
    );
  }
});

var ControllerList = React.createClass({
  render: function() {
    
    var controllerNodes = this.props.data.map(function(controller) {
      return (
        <ControllerMetaData Controls= {controller}></ControllerMetaData>
      );
    });

    return (

      <div className="controllerList">        
        {controllerNodes}
      </div>
    );
  }
});

var ControllerMetaData = React.createClass({

  render: function() {
    return (
      <div class="row">
        <h4 class="ControllerLists">
          {this.props.Controls.ControlName}
        </h4>
        <div class="col-md-4"> 
          <p>Name: {this.props.Controls.ControlName}</p>
          <p>Type: {this.props.Controls.HighValue}</p>
          <p>IP: {this.props.Controls.LowValue}</p>
        </div>
      </div>
    );
  }
});



ReactDOM.render(
  <PLCClientsBox url="/api/clients" pollInterval={2000} />,
  document.getElementById('content')
);