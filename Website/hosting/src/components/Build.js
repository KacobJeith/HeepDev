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
    var gameInstance = UnityLoader.instantiate("gameContainer", "src/WebGL/Build/testBlank.json", {onProgress: UnityProgress});

  }
  
  render() {
    
  	const styles = {
        container : { 
     		  display: "flex",
     		  flexDirection: "row",
     		  flexFlow: "row wrap",
          position: "relative",
          top: 70
        },
        webGL: {
          width: 960,
          height: 600
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
		      <div {...inputs.webGLContainer}>
            <div {...inputs.webGL}/>
          </div>
        </div>
    );
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(Build))

