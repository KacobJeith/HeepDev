import React from 'react'

import { withStyles, withTheme } from 'material-ui/styles';
import Grid from 'material-ui/Grid';

import SectionCard from './SectionCard'
import AboutCard from './AboutCard'
import TeamModal from './TeamModal'

class About extends React.Component {
  render() {

  	var inputs = {
      AboutInputs:{
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
          path: '../src/assets/DeviceParty.svg',
          alt: 'Device Party',
          description: "Connect your devices and get them to talk with you and other devices. They send and receive commands, provide data, and interact with you. Enable your environment."
        }
      },
      SectionInputs: {
        banner: {
          cardHeight: 0.4,
          backgroundColor: '#00adee',
          imagePath: '../src/assets/TestPhoto.jpg'
        },
        welcome: {
          cardHeight:0.2,
          headerText: 'Connect your world with Heep.',
          subText: "We built a sophisticated operating system for your smart devices. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        },
        aboutUs: {
          cardHeight: 0.3,
          backgroundColor: '#B0BEC5',
          headerText: 'Our Story',
          subText: 'Heep was founded in February 2017 with the dream of ubiquitous connectivity. We thought long and hard about what the world needs to make that happen. Thus, the Heep operating system was born. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum'
        },
        ourTeam: {
          cardHeight: 0.15,
          headerText: 'The Heep Team',
        }
      }
    }

	return (
    <div>
      <div>
        <SectionCard {...inputs.SectionInputs.banner}/>
        <SectionCard {...inputs.SectionInputs.welcome}/>
      </div>
      <div>
        <Grid container style={{maxWidth:'100%'}}
          spacing={24} justify='center'>
          <Grid item xs={6} sm={3}>
            <AboutCard {...inputs.AboutInputs.PlugAndPlay}/>
          </Grid>
          <Grid item xs={6} sm={3}>
            <AboutCard {...inputs.AboutInputs.CloudLess}/>
          </Grid>
          <Grid item xs={6} sm={3}>
            <AboutCard {...inputs.AboutInputs.DeviceParty}/>
          </Grid>
        </Grid>
      </div>
      <div>
        <SectionCard {...inputs.SectionInputs.aboutUs}/>
      </div>
      <div>
        <SectionCard {...inputs.SectionInputs.ourTeam}/>
        <TeamModal/>
      </div>
    </div>
    );
  }
}

export default About
