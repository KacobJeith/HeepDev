import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { withRouter } from 'react-router-dom'
import * as actions from '../redux/actions'

var mapStateToProps = (state) => ({
	webGLStatus: state.webGLStatus
})

class Build extends React.Component {

  componentDidMount() {

    var webgl = document.getElementById("webgl");
    webgl.style.display = "inherit";
  }

  componentWillUnmount() {
    var webgl = document.getElementById("webgl");
    webgl.style.display = "none";
  }
  
  render() {
    
    return null
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(Build))

