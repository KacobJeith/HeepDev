import React from 'react'

import { withStyles, withTheme } from 'material-ui/styles';
import Grid from 'material-ui/Grid';
import Typography from "material-ui/Typography";

import SectionCard from './SectionCard'
import AboutCard from './AboutCard'
import TeamModal from './TeamModal'

import { founders } from '../assets/remote/Founders'
import { banners } from '../assets/remote/Banners'
import { svg } from '../assets/remote/SVG'

class About extends React.Component {
  render() {

  	var inputs = {
      AboutInputs:{
    		PlugAndPlay: {
          title: 'Easy to Install',
          imagePath:svg.plugAndPlay,
          desc: "Unbox, wire, and play. Automate your home or booby trap it. We can set it up for you, so you don't have to worry about code. Heep makes connecting things easy."
        },
        CloudLess: {
          title: 'Cloud Less',
          imagePath: svg.cloudLess,
          desc: "Heep doesn't require an internet connection. We don't send things to the cloud, so rest assured, no one's listening in or watching you. You do you, so just relax."
        },
        DeviceParty: {
          title: 'Device Party',
          imagePath: svg.deviceParty,
          desc: "Connect your devices and get them to talk with you and other devices. They send and receive commands, provide data, and interact with you. Enable your environment."
        }
      },
      SectionInputs: {
        banner: {
          paddingTop: 25,
          paddingBottom: 25,
          backgroundColor: '#00adee',
          imagePath: banners.testPhoto
        },
        welcome: {
          paddingTop: 25,
          paddingBottom: 25,
          headerText: 'Connect your world with Heep.',
          subText: "We built a sophisticated operating system for your smart devices. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        },
        aboutUs: {
          paddingTop: 25,
          paddingBottom: 25,
          backgroundColor: '#B0BEC5',
          headerText: 'Our Story',
          subText: 'Heep was founded in February 2017 with the dream of ubiquitous connectivity. We thought long and hard about what the world needs to make that happen. Thus, the Heep operating system was born. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum'
        },
        ourTeam: {
          paddingTop: 25,
          paddingBottom: 0,
          headerText: 'Heep Team',
          subText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum'
        },
      },
      TeamInputs: {
        james: {
          name: 'James DeVito',
          //imagePath: '../src/assets/CloudLess.svg',
          imagePath: founders.james,
          imageButtonWidth: '75%',
          desc1: 'James is our hardware whisperer. Prior to Heep, he was an early employee at Adafruit, where he built hardware and engaged with the vast Adafruit community. James is also the founder of Smooth Technology, a group of designer-engineers whose art has been featured on the likes of Taylor Swift & Katy Perry and in the MoMA & Times Square.',
          desc2: 'James is the bassist of chiptune band Anamanaguchi, known for sending pizza into space. He earned a B.S. in Music Technology with a minor in Computer Science from New York University.'
        }
      }
    }

	return (
    <div>
      <SectionCard {...inputs.SectionInputs.banner}/>
      <SectionCard {...inputs.SectionInputs.welcome}/>
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
      <SectionCard {...inputs.SectionInputs.aboutUs}/>
      <SectionCard {...inputs.SectionInputs.ourTeam}/>
      <Grid container style={{maxWidth:'100%'}} justify='center'>
        <Grid item xs>
          <TeamModal {...inputs.TeamInputs.james}/>
        </Grid>
        <Grid item xs>
          <TeamModal {...inputs.TeamInputs.james}/>
        </Grid>
        <Grid item xs>
          <TeamModal {...inputs.TeamInputs.james}/>
        </Grid>
        <Grid item xs>
          <TeamModal {...inputs.TeamInputs.james}/>
        </Grid>
      </Grid>
    </div>
    );
  }
}

export default About
