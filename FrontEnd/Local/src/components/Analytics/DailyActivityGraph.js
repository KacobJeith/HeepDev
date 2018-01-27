import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { withRouter } from 'react-router-dom'
import * as Actions from '../../redux/actions'
import Plot from 'react-plotly.js'
import _ from 'underscore'
import dateFormat from 'dateformat'

import AnalyticsCard from './AnalyticsCard'


const mapStateToProps = (state, ownProps) => ({
  dailyActivity: getDailyActivity(state, ownProps)
})

class DailyActivityGraph extends React.Component {
  
  render () {

    var data = [
      {
        x: Object.keys(this.props.dailyActivity),
        y: Object.values(this.props.dailyActivity),
        // mode: 'lines+markers',
        type: 'bar',
        marker: {
          color: Object.values(this.props.dailyActivity),
          size: Array(Object.values(this.props.dailyActivity)).fill(25)
        }
      }
    ];

    // var lastDataTime = this.props.timeSeries[this.props.timeSeries.length - 1];
    // var startTime = this.props.timeSeries[0];

    // if (this.props.timeSeries.length > 32) {
    //   startTime = this.props.timeSeries[this.props.timeSeries.length - 15];
    // } 

    var layout = {
        yaxis: {
          range: [0, 100]
        },
        width: 900,
        height: 400,
        title: 'Daily Activity'
      }

    try {
      // layout.xaxis = {
      //     range: [startTime.getTime(),
      //             lastDataTime.getTime()]
      //   }
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

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(DailyActivityGraph))


const getAnalyticsSeries = (state, ownProps, key) => {

  if ("analytics" in state) {
    if (ownProps.deviceID.toString() in state.analytics) {
      return Array.from(state.analytics[ownProps.deviceID], x => x[key])
    }
  }

  return []
}

const getDailyActivity = (state, ownProps) => {
  var allTimes = getAnalyticsSeries(state, ownProps, 'timeStamp');

  var dateCounters = {};

  for (var i in allTimes) {
    var key = allTimes[i].toDateString();

    console.log(key)

    if (key in dateCounters) {
      dateCounters[key] += 1;
    } else {
      dateCounters[key] = 1;
    }

  }

  console.log("Activity: ", dateCounters);

  return dateCounters
}
