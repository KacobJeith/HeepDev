import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { withRouter } from 'react-router-dom'
import * as Actions from '../../redux/actions'
import Plot from 'react-plotly.js'

import AnalyticsCard from './AnalyticsCard'


const mapStateToProps = (state, ownProps) => ({
  // numberElements: countMOPS(state, ownProps) ,
  controlIDSeries: getAnalyticsSeries(state, ownProps, 'controlID'),
  timeSeries: getAnalyticsSeries(state, ownProps, 'timeStamp'),
  seriesValue: getAnalyticsSeries(state, ownProps, 'controlValue'),
  seriesHoverText: getHoverText(state, ownProps),
  deviceID: ownProps.deviceID.toString()
})

class AnalyticsList extends React.Component {
  constructor(props) {
    super(props);
  }

  render () {
    
    // var inputs = {
    //   thisCard: {
    //     deviceID: this.props.deviceID,
    //     element: 0,
    //     key: 0
    //   }
      
    // }

    // var analyticsCards = [];

    // for (var i = 0; i < this.props.numberElements; i++) {
    //   inputs.thisCard.element = i;
    //   inputs.thisCard.key = "MOP_" + i.toString();
    //   analyticsCards.push( <AnalyticsCard {...inputs.thisCard}/>);
    // }

    // return (
    //   <div>
    //     {analyticsCards} 
    //   </div>
    // );

    console.log(this.props.timeSeries);

    var data = [
      {
        x: this.props.timeSeries,
        y: this.props.controlIDSeries,
        mode: 'lines+markers',
        type: 'scatter',
        text: this.props.seriesHoverText,
        marker: {
          color: this.props.seriesValue,
          size: Array(this.props.seriesValue.length).fill(25)
        }
      }
    ];

    var lastDataTime = this.props.timeSeries[this.props.timeSeries.length - 1];
    var startTime = this.props.timeSeries[0];

    if (this.props.timeSeries.length > 32) {
      startTime = this.props.timeSeries[this.props.timeSeries.length - 30];
    } 
    // startTime.setHours(lastDataTime.getHours() - 3);
    var layout = {
        yaxis: {
          range: [-20, 20]
        },
        width: 700,
        height: 400,
        title: 'EscapeTheRoom Nuclear'
      }

    try {
      layout.xaxis = {
          range: [lastDataTime.getTime(),
                  startTime.getTime()]
        }
    } catch (err) {
      console.log("No date defined");
    }

    return (
    <Plot
      data={data} 

      layout={layout}
    />
  );

  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(AnalyticsList))

const countMOPS = (state, ownProps) => {

  if ("analytics" in state) { 
    if (ownProps.deviceID.toString() in state.analytics) {
      return state.analytics[ownProps.deviceID].length
    }

  }

  return 0
}

const getAnalyticsSeries = (state, ownProps, key) => {

  console.log("Seting Series: ", key);
  if ("analytics" in state) {
    if (ownProps.deviceID.toString() in state.analytics) {
      return Array.from(state.analytics[ownProps.deviceID], x => x[key])
    }
  }

  return []
}

const getHoverText = (state, ownProps) => {
  var controlIDs = getAnalyticsSeries(state, ownProps, 'controlID');
  var hoverText = [];
  for (var i in controlIDs) {
    try {
      hoverText.push(state.devices_firebase[ownProps.deviceID].controls[controlIDs[i]].controlName)
    } catch (err) {
      hoverText.push("unnamed");
    }
    
  }
  console.log("Set hoverText");

  return hoverText
}
