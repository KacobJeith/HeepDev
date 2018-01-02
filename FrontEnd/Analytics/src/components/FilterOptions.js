import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../redux/actions'
import { withRouter } from 'react-router-dom'
import {ButtonGroup, ControlLabel, FormGroup, FormControl, HelpBlock, option} from 'react-bootstrap';

import GenericSelect from './GenericSelect'

var mapStateToProps = (state, ownProps) => ({
  timeRange: getTimeRange(state.data)
})

class FilterOptions extends React.Component {

  render () {

    var range = this.props.timeRange.ticks;

    var inputs = {
      timeRangeMin: {
        defaultValue: range[0],
        onChange: (value) => {this.props.setMinTimeRange(value)},
        options: range,
        keyID: 'min',
        title: "Time Range Min",
      },
      timeRangeMax: {
        defaultValue: range[range.length - 1],
        onChange: (value) => {this.props.setMaxTimeRange(value)},
        options: range,
        keyID: 'max',
        title: "Time Range Max"
      }
    }

    if (range.length > 1) {
      return (
            <form>
              <GenericSelect {...inputs.timeRangeMin}/>
              <GenericSelect {...inputs.timeRangeMax}/>
            </form>  
      );
    } else {
      return <div/>
    }
    
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(FilterOptions))

const getTimeRange = (allAnalyticsMOPs) => {

  if (allAnalyticsMOPs.length > 0) {
    var allTimes = allAnalyticsMOPs.map(a => a.timeStamp);

    var  orderedDates = allTimes.sort(function(a,b){
          return Date.parse(a) > Date.parse(b);
      });

    var minTime = orderedDates[0];
    var maxTime = orderedDates[orderedDates.length - 1];

    var tickSpace = (maxTime.getTime() - minTime.getTime()) / 10;
    var ticks = [];

    for (var i = 0; i <10; i++) {

      var nextTick = new Date(minTime.getTime() + (i * tickSpace));
      ticks.push(nextTick.toString());
    }

    var uniques = ticks.unique();

    return {min: minTime.toString(), max: maxTime.toString(), ticks: uniques}

  } else {
    var nowTime = new Date();
    return {min: nowTime.toString(), max: nowTime.toString(), ticks: [nowTime.toString()]}
  }
  
}

Array.prototype.contains = function(v) {
    for(var i = 0; i < this.length; i++) {
        if(this[i] === v) return true;
    }
    return false;
};

Array.prototype.unique = function() {
    var arr = [];
    for(var i = 0; i < this.length; i++) {
        if(!arr.includes(this[i])) {
            arr.push(this[i]);
        }
    }
    return arr; 
}

