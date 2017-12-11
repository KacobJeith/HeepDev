import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions'

var mapStateToProps = (state) => ({
  iconURLs: state['iconURLs'],
  full: state
})

class AddSignal extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      hover: false,
      clicked: false,
      name: '',
      RocketLaunch: false,
      NFL: false,
      ShortsOrPants: false,
      Timer: false,
      Umbrella: false,
      CryptoCurrency: false
    }
  }

  handleSubmit(name, intent) {

    this.props.addSignal(name, intent);

    var newState = {clicked: false};
    newState[intent] = false;

    this.setState(newState);
    
  }

  render() {

    const alternate = () => {this.onerror=null; this.src= + this.props.iconURLs.alt;};

  	const styles = {
        addCard : {
          height: 300,
          width: 300,
          backgroundColor: this.state.clicked ? "lightGray" : "white", 
          color: "black",
          marginTop: 25,
          marginLeft: 25,
          alignItems: "center",
          justifyContent: "center",
          display: "flex",
          flexDirection: "row",
          flexFlow: "row wrap",
          boxShadow: this.state.hover ? "5px 5px 5px #555" : ""
        },
        glyph: {
        	fontSize: 40,
          color: "black",
          cursor: "pointer"
        },
        nameInput : {
          height: '20%',
          width: '80%',
          left: '10%',
          top: '10%'
        },
        submitButton: {
          height: '20%',
          width: '25%',
          left: '30%',
          top: '10%',
          backgroundColor: '#555',
          color: 'white',
          textAlign: 'center'
        },
        glyphContainer : {
          height: "30%",
          width: "30%",
          display: "flex",
          flexDirection: "row",
          borderWidth: 2,
          color: "black",
          backgroundColor: "rgba(255,255,255,0)",
          alignItems: "center",
          justifyContent: "center",
          cursor: "pointer"
        },
        glyphIcons: {
          fontSize: 60,
          color: "black"
        }
      };

    const inputs = {
      addCard: {
        style: styles.addCard,
        onMouseEnter: () => this.setState({hover: true}),
        onMouseLeave: () => this.setState({hover: false}),
        key: "add"
      },
      glyphContainer: {
        style: styles.glyphContainer,
      },
      glyph: {
      	style: styles.glyph,
        onClick: () => this.setState({clicked: true}),
      	className: "glyphicon glyphicon-plus",
        key: "glyph"
      },
      nameInput: {
        style: styles.nameInput,
        type: "text",
        value: this.state.name,
        onChange: (change) => {this.setState({ name: change.target.value});}
      },
      submitButton: {
        style: styles.submitButton,
        onClick: () => {this.handleSubmit()}
      },
      WeatherContainer: {
        style: {...styles.glyphContainer, 
          backgroundColor: this.state.Weather ? "#999" : "rgba(255,255,255,0)"},
        onMouseEnter: () => this.setState({Weather: true}),
        onMouseLeave: () => this.setState({Weather: false}),
        onClick: () => {this.handleSubmit("Weather Signal", "Weather")},
        key: "WeatherContainer"
      },
      ShortsOrPantsContainer: {
        style: {...styles.glyphContainer, 
          backgroundColor: this.state.ShortsOrPants ? "#999" : "rgba(255,255,255,0)"},
        onMouseEnter: () => this.setState({ShortsOrPants: true}),
        onMouseLeave: () => this.setState({ShortsOrPants: false}),
        onClick: () => {this.handleSubmit("Pants Signal", "ShortsOrPants");},
        key: "ShortsOrPantsContainer"
      },
      UmbrellaContainer: {
        style: {...styles.glyphContainer, 
          backgroundColor: this.state.Umbrella ? "#999" : "rgba(255,255,255,0)"},
        onMouseEnter: () => this.setState({Umbrella: true}),
        onMouseLeave: () => this.setState({Umbrella: false}),
        onClick: () => {this.handleSubmit("Umbrella Signal", "Umbrella")},
        key: "UmbrellaContainer"
      },
      TimerContainer: {
        style: {...styles.glyphContainer, 
          backgroundColor: this.state.Timer ? "#999" : "rgba(255,255,255,0)"},
        onMouseEnter: () => this.setState({Timer: true}),
        onMouseLeave: () => this.setState({Timer: false}),
        onClick: () => {this.handleSubmit("Timer Signal", "Timer")},
        key: "TimerContainer"
      },
      CryptoCurrencyContainer: {
        style: {...styles.glyphContainer, 
          backgroundColor: this.state.CryptoCurrency ? "#999" : "rgba(255,255,255,0)"},
        onMouseEnter: () => this.setState({CryptoCurrency: true}),
        onMouseLeave: () => this.setState({CryptoCurrency: false}),
        onClick: () => {this.handleSubmit("Arrow Signal", "CryptoCurrency")},
        key: "CryptoCurrencyContainer"
      },
      NFLContainer: {
        style: {...styles.glyphContainer, 
          backgroundColor: this.state.NFL ? "#999" : "rgba(255,255,255,0)"},
        onMouseEnter: () => this.setState({NFL: true}),
        onMouseLeave: () => this.setState({NFL: false}),
        onClick: () => {this.handleSubmit("Football Signal", "NFL")},
        key: "NFLContainer"
      },
      RocketLaunchContainer: {
        style: {...styles.glyphContainer, 
          backgroundColor: this.state.RocketLaunch ? "#999" : "rgba(255,255,255,0)"},
        onMouseEnter: () => this.setState({RocketLaunch: true}),
        onMouseLeave: () => this.setState({RocketLaunch: false}),
        onClick: () => {this.handleSubmit("Rocket Signal", "RocketLaunch")},
        key: "RocketLaunchContainer"
      },
      Weather: {
        height: "80%",
        width: "80%",
        src: this.props.iconURLs.Weather,
        onError: alternate,
        key: "Weather"
      },
      ShortsOrPants: {
        height: "80%",
        width: "80%",
        src: this.props.iconURLs.ShortsOrPants,
        onError: alternate,
        key: "ShortsOrPants"
      },
      Umbrella: {
        height: "80%",
        width: "80%",
        src: this.props.iconURLs.Umbrella,
        onError: alternate,
        key: "Umbrella"
      },
      Timer: {
        style: styles.glyphIcons,
        className: "glyphicon glyphicon-time",
        key: "Timer"
      },
      CryptoCurrency: {
        style: {
          fontSize: 60,
          color: "goldenrod"
        },
        className: "glyphicon glyphicon-bitcoin",
        key: "CryptoCurrency"
      },
      NFL: {
        height: "80%",
        width: "80%",
        src: this.props.iconURLs.NFL,
        onError: alternate,
        key: "NFL"
      },
      RocketLaunch: {
        height: "80%",
        width: "80%",
        src: this.props.iconURLs.RocketLaunch,
        onError: alternate,
        key: "RocketLaunch"
      },
    }

    var NewSignalForm = []
    
    if (!this.state.clicked) {

      NewSignalForm.push(<span {...inputs.glyph}> </span>);

    } else {

      NewSignalForm.push(<div {...inputs.TimerContainer}><span {...inputs.Timer}> </span></div>);
      NewSignalForm.push(<div {...inputs.CryptoCurrencyContainer}><span {...inputs.CryptoCurrency}> </span></div>);
      NewSignalForm.push(<div {...inputs.NFLContainer}><img {...inputs.NFL}/></div>);
      NewSignalForm.push(<div {...inputs.ShortsOrPantsContainer}><img {...inputs.ShortsOrPants}/></div>);
      NewSignalForm.push(<div {...inputs.UmbrellaContainer}><img {...inputs.Umbrella}/></div>);
      NewSignalForm.push(<div {...inputs.RocketLaunchContainer}><img {...inputs.RocketLaunch}/></div>);

    }

    return (<div {...inputs.addCard}> 
    			   {NewSignalForm}
            </div>
    );
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(AddSignal)