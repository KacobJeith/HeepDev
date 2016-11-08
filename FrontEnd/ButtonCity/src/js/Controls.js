import React from 'react';
import $ from 'jquery';

var standardTab = 10;

class ControllerList extends React.Component {
  

  render() {
     
    let controllerNodes = this.props.data.map( (controller,index) => 
      <ControllerMetaData Controls={controller} key={index}></ControllerMetaData> 
      );

    return (

      <div className="controllerList" key="AllControls">        
        {controllerNodes}
      </div>
    );
  }
}

class ControllerMetaData extends React.Component {
  constructor(props) {
    super(props);
    this.state = {showResults: false};

    this.onClick = this.onClick.bind(this);
  }

  onClick(){
    console.log("Updating Render state");
    this.setState(prevState => ({
      showResults: !prevState.showResults
    }));
    console.log(this.state)
  }


  render() {

    return <div>
        <h4 key="ControlHeading" onClick={this.onClick}>
          {this.props.Controls.ControlName}
        </h4>
        <CommandClient url={'/api/commands'} Controls={this.props.Controls} visibility={this.state.showResults}></CommandClient>
        </div>;
  }
}

class CommandClient extends React.Component {
   constructor(props) {
    super(props);
    this.state = {lightState: false};

    this.onClick = this.onClick.bind(this);
  }

  onClick(){
    console.log("Trying to Toggle Light");
    this.setState(prevState => ({
      lightState: !prevState.lightState
    }));
    console.log(this.state);
    this.sendDataToServer();
  }

  sendDataToServer() {
    const destination = '10.0.0.196';
    const ControlName = this.props.Controls.ControlName;
    const ControlValue = this.state.lightState ? '1' : '0';

    const message = destination + ':' + ControlName + ',' + ControlValue + '\n';
    const messagePacket = {command: message};
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      type: 'POST',
      data: messagePacket,
      success: (data) => {
        this.setState({data: data});
      },
      error: function(xhr, status, err) {
        //console.error(this.props.url, status, err.toString());
        console.log('Hitting sendDataToServer error')
      }
    });
  }

   render() {
    const controllerDataStyle = {
    paddingLeft: standardTab
    }

    let dataToDisplay = []; 
    const {onClick, onClickToggle} = this;

    for (var key in this.props.Controls){
      dataToDisplay.push(<p key={key}>{key}: {this.props.Controls[key]}</p>);
    }

    return <div style={controllerDataStyle} key="ControlCommand" onClick={this.onClick}> 
          {this.props.visibility ? dataToDisplay : null}
        </div>
  }
}

export default ControllerList