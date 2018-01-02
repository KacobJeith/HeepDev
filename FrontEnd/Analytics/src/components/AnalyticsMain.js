import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../redux/actions'

import LineChart from './LineChart'
import FilterOptions from './FilterOptions'

export default class AnalyticsMain extends React.Component {
  constructor(props) {
    super(props);
  }

  render () {

    var inputs = {
      builder: {
        style: {
          backgroundColor: "white",
          fontFamily: "-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Oxygen-Sans,Ubuntu,Cantarell,Helvetica Neue,sans-serif"
        }
      },
      contents: {
        style: {
          width: "80%",
          margin: "auto",
        }
      },
      spacer: {
        style: {
          height: 20
        }
      },
      lineChart: {
        deviceID: 66051,
        filterQuery: 'timeStamp',
        timeStamp: new Date(Date.UTC(2017, 11, 20, 13, 29, 4))
      }
    }

    console.log("Filtering by: ", inputs.lineChart.timeStamp);

    return (
      <div {...inputs.builder}>
        <div {...inputs.contents}>
          <div {...inputs.spacers}/>
          <FilterOptions />
          <div {...inputs.spacer}/>
          <LineChart {...inputs.lineChart}/>
          <div {...inputs.spacer}/>
        </div>
     </div>
    );
  }
}

