import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../redux/actions'
import Flowchart from './Flowchart'

var mapStateToProps = (state) => ({
})

class App extends React.Component {
  render() {
    const styles = {
        header: {
          backgroundColor: "#43464c", 
          position: 'fixed',
          height: 40,
          width: "100%",
          color: "#e1e3e8",
          textIndent: 10
        },
        flowchartContainer: {
          position: "absolute",
          top: 40,
          transition: "left .3s ease-in-out",
          left: 0,
          height: "100%",
          width: "100%",
          overflow: "auto"
        },
        footer : {
          position: "fixed",
          bottom:0,
          left:0,
          right:0,
          height: 30,
          backgroundColor: "#43464c", 
          color: "#e1e3e8"
        }
      };

    const inputs = {
      header: {
        style: styles.header,
        key: "Header"
      },
      flowchartContainer: {
        style: styles.flowchartContainer
      },
      footer : {
        style: styles.footer,
      }
    }
    
    this.props.storeURL(window.location.protocol.concat('//', window.location.hostname));

    return (<div>
              <h1 {...inputs.header}> Heep Device Portal <hr></hr></h1>
              <div {...inputs.flowchartContainer}>
                <Flowchart />
              </div>
              <footer {...inputs.footer}> <hr></hr> &copy; 2017 Heep </footer>
            </div>
    );
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(App)