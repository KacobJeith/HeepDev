import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../redux/actions'
import { NavLink, withRouter } from 'react-router-dom';

import DeviceIdentity from './DeviceIdentity'
import ControlBuilder from './ControlBuilder'
import DownloadSource from './DownloadSource'

export default class DeviceBuilder extends React.Component {
  constructor(props) {
    super(props);
  }

  render () {

    var inputs = {
      builder: {
        style: {
          backgroundColor: "black",
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
      }
    }

    return (
      <div {...inputs.builder}>
        <div {...inputs.contents}>
          <div {...inputs.spacer}/>
          <DeviceIdentity/>
          <ControlBuilder/>
          <DownloadSource/>
          <div {...inputs.spacer}/>
        </div>
     </div>
    );
  }
}

