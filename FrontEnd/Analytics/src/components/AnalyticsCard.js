import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { withRouter } from 'react-router-dom'
import * as Actions from '../redux/actions'
import dateFormat from 'dateformat'


const mapStateToProps = (state, ownProps) => ({
  MOP: state.devices[ownProps.deviceID][ownProps.element]
})

class AnalyticsCard extends React.Component {
  constructor(props) {
    super(props);
  }

  chooseColor(controlVal) {
    if (controlVal != 0) {
      return "#004a8f"
    } else {
      return "#e2e2e2"
    }
  }

  render () {
    var multiplier = 1.2;
    
    var inputs = {
      container: {
        style: {
          width: 1000,
          height: multiplier * 10,
          margin: 1,
          backgroundColor: "white" ,
          color: "white",
          position: "relative",
          // flexDirection: "row",
          // alignItems: "center"
        }
      },
      controlIDBox: {
        style: {
          left: 10*this.props.MOP.controlID,
          width: multiplier * 10,
          height: multiplier * 10,
          borderRadius: multiplier *  5,
          backgroundColor: this.chooseColor(this.props.MOP.controlValue),
          borderWidth: 1,
          borderColor: "#353535",
          position: "absolute"
        }
      },
      dateBox: {
        style: {
        }
      }
      
    }

    var dateFormatted = dateFormat(this.props.MOP.timeStamp, "dddd, mmmm dS, yyyy, h:MM:ss TT");

    return (
      <div {...inputs.container}>
        <div {...inputs.controlIDBox}/>
      </div>
    );

  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(AnalyticsCard))

