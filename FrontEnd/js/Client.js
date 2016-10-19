var standardTab = 10;


var ClientsList = React.createClass({
  render: function() {
      var clientNodes = this.props.data.map(function(client) {
      return (
        <ClientMetaData Client= {client}></ClientMetaData>
      );
    });

    return (
      <div>        
        {clientNodes}
      </div>
    );
  }
});

var ClientMetaData = React.createClass({

  render: function() {

    var clientCardStyle = {
      backgroundColor: "#bbccca",
      width: 200,
      margin: 15,
      display: "inline-block",
      borderRadius: 15, 
      borderColor: "#2b2d30", 
      borderWidth: 5, 
      border: 1
    };

    var clientTitleStyle = {
      backgroundColor: "#cbcfd6",
      margin: 0,
      textAlign: "center",
      borderTopLeftRadius: 15,
      borderTopRightRadius: 15,
      padding: 0
    }

    var clientInfoStyle = {
      paddingLeft: standardTab
    }


    return (
      <div  style={clientCardStyle}>
        <h2 style={clientTitleStyle}> {this.props.Client.IPAddress} </h2>
        <div style={clientInfoStyle} > 
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

    var controllerDataStyle = {
    paddingLeft: standardTab
    }

    return (
      <div >
        <h4 >
          {this.props.Controls.ControlName}
        </h4>
        <div style={controllerDataStyle}> 
          <p>Name: {this.props.Controls.ControlName}</p>
          <p>Type: {this.props.Controls.HighValue}</p>
          <p>IP: {this.props.Controls.LowValue}</p>
        </div>
      </div>
    );
  }
});