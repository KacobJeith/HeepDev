import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { withRouter } from 'react-router-dom'
import * as Actions from '../redux/actions'
import dateFormat from 'dateformat'


const mapStateToProps = (state, ownProps) => ({
  MOP: state.devices[ownProps.deviceID][ownProps.element],
  numLabel: ownProps.element
})

class AnalyticsCard extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      selected: false
    }
  }

  chooseColor(controlVal) {
    if (controlVal != 0) {
      return "#858585"
    } else {
      return "#004a8f"
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
          backgroundColor: this.state.selected ? "#dbdfdf" : "white",
          color: "white",
          position: "relative",
          // flexDirection: "row",
          // alignItems: "center"
        },
        onMouseEnter: () => this.setState({selected: true}),
        onMouseLeave: () => this.setState({selected: false})
      },
      controlIDBox: {
        style: {
          left: 100 + 10*this.props.MOP.controlID,
          width: multiplier * 10,
          height: multiplier * 10,
          borderRadius: multiplier *  5,
          backgroundColor: this.chooseColor(this.props.MOP.controlValue),
          borderWidth: 1,
          borderColor: "#353535",
          position: "absolute"
        }
      },
      numberLabel: {
        style: {
          fontSize: 10,
          left: 10,
          position: "absolute",
          //left: 10,
          color: "black",
          top: -2,
        }
      }

    }

    var dateFormatted = dateFormat(this.props.MOP.timeStamp, "dddd, mmmm dS, yyyy, h:MM:ss TT");

    return (
      <div {...inputs.container}>
        <div {...inputs.numberLabel}>
          {this.props.numLabel}
        </div>
        <div {...inputs.controlIDBox}/>
      </div>
    );

  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(AnalyticsCard))
