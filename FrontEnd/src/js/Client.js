import React from 'react';

var standardTab = 10;

class ClientsList extends React.Component {
  render() {
    let clientNodes = this.props.data.map(client =>
      <ClientMetaData Client= {client}></ClientMetaData>
    );

    return  <div> {clientNodes} </div>;
  }
}

class ClientMetaData extends React.Component {

  render() {

    var clientCardStyle = {
      backgroundColor: "#bbccca",
      width: 200,
      margin: 15,
      float: 'left',
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

    var clientInfo = []; 

    for (var key in this.props.Client){
        key == "ControlList" ? clientInfo.push(<ControllerList data={this.props.Client[key]} />) : clientInfo.push(<p>{key}: {this.props.Client[key]}</p>);
    }

    return (
      <div  style={clientCardStyle}>
        <h2 style={clientTitleStyle}> {this.props.Client.IPAddress} </h2>
        <div style={clientInfoStyle} > 
          {clientInfo}
        </div>
      </div>
    );
  }
}

class ControllerList extends React.Component {
  

  render() {
    
    let controllerNodes = this.props.data.map( controller => 
      <ControllerMetaData Controls= {controller}></ControllerMetaData> 
      );

    return (

      <div className="controllerList">        
        {controllerNodes}
      </div>
    );
  }
}

class ControllerMetaData extends React.Component {
  render() {

    var controllerDataStyle = {
    paddingLeft: standardTab
    }

    var dataToDisplay = []; 

    for (var key in this.props.Controls){
        dataToDisplay.push(<p>{key}: {this.props.Controls[key]}</p>);
    }

    return <div >
        <h4 >
          {this.props.Controls.ControlName}
        </h4>
        <div style={controllerDataStyle}> 
          {dataToDisplay}
        </div>
      </div>;
  }
}

export default ClientsList;