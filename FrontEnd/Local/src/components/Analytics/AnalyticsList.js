import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { withRouter } from 'react-router-dom'
import * as Actions from '../../redux/actions'

import AnalyticsCard from './AnalyticsCard'


const mapStateToProps = (state, ownProps) => ({
  numberElements: countMOPS(state, ownProps) ,
  deviceID: ownProps.deviceID.toString()
})

class AnalyticsList extends React.Component {
  constructor(props) {
    super(props);
  }

  render () {
    
    var inputs = {
      thisCard: {
        deviceID: this.props.deviceID,
        element: 0,
        key: 0
      }
      
    }

    var analyticsCards = [];

    for (var i = 0; i < this.props.numberElements; i++) {
      inputs.thisCard.element = i;
      inputs.thisCard.key = "MOP_" + i.toString();
      analyticsCards.push( <AnalyticsCard {...inputs.thisCard}/>);
    }

    return (
      <div>
        {analyticsCards} 
      </div>
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