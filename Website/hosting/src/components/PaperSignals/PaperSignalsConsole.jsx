import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions'
import AddSignal from './AddSignal'
import Signals from './Signals'

var mapStateToProps = (state) => ({
	signalArray: state.signals
})

class PaperSignalsConsole extends React.Component {
  
  render() {

  	const styles = {
        container : { 
          display: "flex",
          flexDirection: "row",
          flexFlow: "row wrap"
        },
        footer : { 
          height: 150,
          width: "100%"
        }
      };

    const inputs = {
      container: {
        style: styles.container
      },
      footer: {
        style: styles.footer
      },
      iframe: {
        style: {
          width: "100vw",
          height: "100vh",
          borderColor: "transparent"
        },
        src: "https://papersignals.firebaseapp.com/" 
      }
    }


    
    var signals = [];

  	for (var key in this.props.signalArray) {
     	signals.push(<Signals key={key} signalKey={key}/>);
	}

    return (<div {...inputs.container}>
    		      <iframe {...inputs.iframe}></iframe>
            </div>
    );
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(PaperSignalsConsole)