import React from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import { withRouter } from 'react-router-dom'
import * as Actions from '../redux/actions'
import MessageCard from './MessageCard'

import AboutCard from './AboutCard'
import Grid from 'material-ui/Grid';

const mapStateToProps = (state) => ({
})


class About extends React.Component {
  render() {

  	var inputs = {
  		PlugAndPlay: {
        title: 'Easy to Install',
        path: '../src/assets/PlugAndPlay.svg',
        alt: 'Plug and Play',
        description: "Unbox, wire, and play. Automate your home or booby trap it. We can set it up for you, so you don't have to worry about code. Heep makes connecting things easy."
      },
      CloudLess: {
        title: 'Cloud Less',
        path: '../src/assets/CloudLess.svg',
        alt: 'Cloud Less',
        description: "Heep doesn't require an internet connection. We don't send things to the cloud, so rest assured, no one's listening in or watching you. You do you, so just relax."
      },
      DeviceParty: {
        title: 'Device Party',
        path: '../src/assets/CloudLess.svg',
        alt: 'Device Party',
        description: "Connect your devices and get them to talk with you and other devices. They send and receive commands, provide data, and interact with you. You design and control your environment."
      }
    }

	return (
    <div>
      <Grid container spacing={24} justify='center'>
        <Grid item xs={6} sm={3}>
          <AboutCard {...inputs.PlugAndPlay}/>
        </Grid>
        <Grid item xs={6} sm={3}>
          <AboutCard {...inputs.CloudLess}/>
        </Grid>
        <Grid item xs={6} sm={3}>
          <AboutCard {...inputs.DeviceParty}/>
        </Grid>
      </Grid>
    </div>
    );
  }
}


function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(About))
