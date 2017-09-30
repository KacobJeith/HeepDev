import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../redux/actions'
import DownloadConfig from './DownloadConfig'

var mapStateToProps = (state, ownProps) => ({
  signal: state.signals[ownProps.signalKey],
  iconURLs: state['iconURLs'],
  intentBackgrounds: state['intentBackgrounds']
})

class Signals extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      hover: false,
      deletionHover: false,
      name: props.signal.content.name
    }
  }

  updateName(change) {
    this.setState({ 
      name: change.target.value
    });

    this.props.updateName(this.props.signal.id, change.target.value);
  }

  signalBackgroundImageURL() {

    try {
      switch (this.props.signal.content.result.metadata.intentName) {
        case 'NFL' :
          return this.props.intentBackgrounds['NFL']
        case 'CryptoCurrency' :
          return this.props.intentBackgrounds['CryptoCurrency']
        case 'RocketLaunch' :
          return this.props.intentBackgrounds['RocketLaunch']
        case 'Timer' :
          return this.props.intentBackgrounds['Timer']
        default :
          return this.props.signal.content.locationImage
      }
    } catch(error) {

      return ""
    }
    
  }

  render() {

  	const styles = {
        container : {
          height: 300,
          width: 300,
          backgroundColor: "lightGray", 
     		  marginTop: 25,
          marginLeft: 25,
          display: "flex",
          alignItems: "center",
          flexDirection: "row",
          justifyContent: "center",
          position: "relative",
          boxShadow: this.state.hover ? "5px 5px 5px #555" : "" 
        },
        addCard : {
          height: 230,
          width: 300,
          backgroundColor: "black", 
          position: "absolute",
          top: 0,
          left: 0,
          opacity: 0.3,
          boxShadow: this.state.hover ? "5px 5px 5px #555" : "" 
        },
        queryBox: {
          height: 230,
          width: 300,
          position: "absolute",
          top: 0,
          left: 0,
          display: "flex",
          alignItems: "center",
          flexDirection: "row",
          justifyContent: "center",
          fontSize: 25,
          color: "white"
        },
        queryText: {
          height: "80%",
          width: "80%",
          display: "flex",
          alignItems: "center",
          flexDirection: "row",
          justifyContent: "center",
          fontSize: 25,
          color: "white",
          cursor: "default"
        },
        image: {
          position: "absolute",
          left: 0,
          top: 0
        },
        optionsBar: {
          position: "absolute", 
          alignItems: "center",
          display: "flex",
          flexDirection: "row",
          justifyContent: "center",
          left: 0,
          bottom: 0,
          height: 70,
          fontSize: 27,
          width: "100%",
          backgroundColor: "lightGray",
          color: "black"
        },
        nameInput : {
          height: '100%',
          width: '80%',
          left: '10%',
          top: '10%',
          backgroundColor: "transparent",
          textAlign: "center",
          borderWidth: 0,
          outline: "none"
        },
        glyphContainer : {
          position: "absolute",
          bottom: 0,
          left: 0,
          height: 45,
          width: 50,
          margin: 10,
          display: "flex",
          flexDirection: "row",
          borderWidth: 2,
          color: "black",
          backgroundColor: "rgba(255,255,255,0)",
          alignItems: "center",
          justifyContent: "center"
        },
        glyph: {
          fontSize: 30,
          color: "black"
        },
        deletionContainer : {
          position: "absolute",
          top: 0,
          right: 0,
          height: 30,
          width: 30,
          margin: 5,
          display: "flex",
          flexDirection: "row",
          borderWidth: 2,
          color: "black",
          backgroundColor: this.state.deletionHover ? "rgba(0,0,0,0.5)" : "rgba(0,0,0,0)",
          alignItems: "center",
          justifyContent: "center",
          cursor: "pointer"
        },
        deletionGlyph: {
          fontSize: 20,
          color: "white"
        }

      };

    const inputs = {
      container: {
        style: styles.container,
        onMouseEnter: () => this.setState({hover: true}),
        onMouseLeave: () => this.setState({hover: false}),
        key: "add"
      },
      addCard: {
        style: styles.addCard,
      },
      queryBox: {
        style: styles.queryBox
      },
      queryText: {
        style: styles.queryText
      },
      image: {
        src: this.signalBackgroundImageURL(),
        height: 230,
        width: 300,
        style: styles.image
      },
      optionsBar: {
        style: styles.optionsBar
      },
      nameInput: {
        style: styles.nameInput,
        type: "text",
        value: this.state.name,
        onChange: (change) => {this.updateName(change)}
      },
      glyphContainer: {
        style: styles.glyphContainer,
      },
      glyph: {
        style: styles.glyph,
        className: "glyphicon glyphicon-download-alt",
        key: "bootstrap"
      },
      glyphImageAlt: {
        height: "80%",
        width: "80%",
        src: "",
        key: "alt"
      },
      deletionContainer: {
        style: styles.deletionContainer,
        onMouseEnter: () => this.setState({deletionHover: true}),
        onMouseLeave: () => this.setState({deletionHover: false}),
        onClick: () => {this.props.deleteSignal(this.props.signal.id)}
      },
      deletionGlyph: {
        style: styles.deletionGlyph,
        className: "glyphicon glyphicon-remove",
        key: "delete"
      },
    }

    var query = "";
    var intentIcon = [];

    try {
      query = '"' + this.props.signal.content.result.resolvedQuery + '"';

      switch (this.props.signal.content.result.metadata.intentName) {
        case "Weather": 
          inputs.glyphImageAlt.src = this.props.iconURLs.Weather;
          intentIcon.push(<img {...inputs.glyphImageAlt}/>);
          break

        case "Timer":
          inputs.glyph.className = "glyphicon glyphicon-time"
          intentIcon.push(<span {...inputs.glyph}> </span>);
          break

        case "CryptoCurrency":
          inputs.glyph.className = "glyphicon glyphicon-bitcoin"
          styles.glyph.color = "goldenrod";
          intentIcon.push(<span {...inputs.glyph}> </span>);
          break

        case "ShortsOrPants":
          inputs.glyphImageAlt.src = this.props.iconURLs.ShortsOrPants;
          intentIcon.push(<img {...inputs.glyphImageAlt}/>);
          break

        case "Umbrella":
          inputs.glyphImageAlt.src = this.props.iconURLs.Umbrella;
          intentIcon.push(<img {...inputs.glyphImageAlt}/>);
          break

        case "NFL":
          inputs.glyphImageAlt.src = this.props.iconURLs.NFL;
          intentIcon.push(<img {...inputs.glyphImageAlt}/>);
          break

        case "RocketLaunch":
          inputs.glyphImageAlt.src = this.props.iconURLs.RocketLaunch;
          intentIcon.push(<img {...inputs.glyphImageAlt}/>);
          break
      }
    } 
    catch(err) {
      query = "Try programming me from your Google Assistant!";
    }


    return (<div {...inputs.container}>
              <img {...inputs.image}/>
              <div {...inputs.addCard}> </div>
              <div {...inputs.queryBox}> 
                <div {...inputs.queryText}> {query} </div>
              </div>
              <div {...inputs.deletionContainer}>
                <span {...inputs.deletionGlyph}/>
              </div>
              <div {...inputs.optionsBar}> 
                <div {...inputs.glyphContainer}>{intentIcon}</div>
                <input {...inputs.nameInput}/>
                <DownloadConfig id={this.props.signal.id}/>
              </div>
            </div>
    );
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(Signals)