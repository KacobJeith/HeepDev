import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../redux/actions'

import GenericButton from './GenericButton'

var mapStateToProps = (state) => ({})

class DownloadSource extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    
    const inputs = {
      downloadButton: {
        style: {
          marginLeft: "auto",
        },
        onClick: () => {this.props.packageSourceFiles()},
        text: "Download Source Zip"
      }
    }
    
    return <GenericButton {...inputs.downloadButton}/>
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(DownloadSource)