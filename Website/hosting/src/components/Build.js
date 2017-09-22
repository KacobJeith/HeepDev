import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { withRouter } from 'react-router-dom'
import * as Actions from '../redux/actions'
// import UnityLoader from '../WebGL/Build/UnityLoader'
// import UnityProgress from '../WebGL/TemplateData/UnityProgress'

var mapStateToProps = (state) => ({
	
})

class Build extends React.Component {

  componentDidMount() {

    setTimeout(instantiateUnity(), 500);
  }
  
  render() {
    
  	const styles = {
        container : { 
          backgroundColor: '#21ea94',
          justifyContent: "center",
          height: "100vh - 50px",
          width: "100vw - 50px",
          top: 50,
          left: 50,
          position: "relative"
        },
        webGL: {
          width: 960,
          height: 600,
          marginLeft: 50,
          marginTop: 50,
          position: "absolute"
        }
      };

    const inputs = {
      container: {
        style: styles.container,
        id: "page-wrap"
      },
      webGL: {
        id: "gameContainer" ,
        style: styles.webGL
      },
      webGLContainer: {
        className: "webgl-content"
      }
    }

    
    return (
        <div {...inputs.container}>
        <div>
          <div {...inputs.webGLContainer}>
            <div {...inputs.webGL}/>
          </div>
          </div>
        </div>
    );
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(Build))

