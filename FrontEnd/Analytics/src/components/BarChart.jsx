import React, { Component } from "react"
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../redux/actions'
import { withRouter } from 'react-router-dom'

import {XYPlot, XAxis, YAxis, HorizontalGridLines, LineSeries} from 'react-vis';

const mapStateToProps = (state) => ({

})

class BarChart extends Component {

  render() {
    
    return (
      <XYPlot
      width={300}
      height={300}>
      <HorizontalGridLines />
      <LineSeries
        data={[
          {x: 1, y: 10},
          {x: 2, y: 5},
          {x: 3, y: 15}
        ]}/>
      <XAxis />
      <YAxis />
    </XYPlot>
    )
  }
}


var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(BarChart))