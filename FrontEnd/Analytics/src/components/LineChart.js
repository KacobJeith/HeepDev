import React, { Component } from "react"
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../redux/actions'
import { withRouter } from 'react-router-dom'

import {XYPlot, XAxis, YAxis, HorizontalGridLines, LineSeries, VerticalRectSeries} from 'react-vis';

const mapStateToProps = (state, ownProps) => ({
  filteredData: filterData(state, ownProps)
})

class LineChart extends Component {

  render() {

    console.log(this.props.filteredData);

    var DATA = this.props.filteredData.map(el => ({
      x: el.timeStamp.getTime(), 
      y: el.controlValue
    }));
    
    return (
      <XYPlot 
        height={400} 
        width={600} 
        yDomain={[-1, 2]} 
        xType={'time-utc'}>
        <LineSeries 
          data={DATA} 
        />
        <XAxis title="Time"/>
        <YAxis title="Control Value" />
      </XYPlot>
    )
  }
}


var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(LineChart))


const filterData = (state, ownProps) => {

  // if (ownProps.filterQuery == 'timeStamp') {
    
  //   console.log(new Date(Date.parse(state.minTime)));

  //   return state.data.filter((element) => ((element['timeStamp'] >= Date(state.minTime)) && (element['timeStamp'] <= Date(state.maxTime))))
  
  // } else {
      
  //   return state.data.filter((element) => (element[ownProps.filterQuery] == ownProps[ownProps.filterQuery]))
  
  // }

  return state.data

}




