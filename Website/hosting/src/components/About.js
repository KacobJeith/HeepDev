import React from 'react'

import { Grid, Typography } from 'material-ui';

import SectionCard from './utilities/SectionCard'
import AboutCard from './AboutCard'
import TeamModal from './TeamModal'

import { founders } from '../assets/remote/Founders'
import { banners } from '../assets/remote/Banners'
import { svgs } from '../assets/remote/SVGs'

class About extends React.Component {

  topBanner() {

    const inputs = {
      paddingTop: 25,
      paddingBottom: 25,
      backgroundColor: '#00adee',
      imagePath: banners.testPhoto,
      minHeight: 400,
    }

    return(
      SectionCard(inputs, '')
    )
  };

  aboutUs() {
    const inputs = {
      paddingTop: 25,
      paddingBottom: 25,
    };

    return (
      SectionCard(inputs,
        <Grid container style={{
          maxWidth:'100%',
          margin: '0 auto'
         }}
         justify='center' alignItems='center'>
          <Grid item  xs={12} md={8}>
            <Typography variant='headline' align='center'>
              Connect Your World
            </Typography>
            <br/>
            <Typography variant='subheading' align='center'>
              We built a sophisticated operating system for your smart devices. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum
            </Typography>
          </Grid>
        </Grid>
      )
    );
  };

  aboutGraphics() {
    const inputs = {
      PlugAndPlay: {
        title: 'Easy to Install',
        imagePath: svgs.plugAndPlay,
        desc: "Unbox, wire, and play. Automate your home or booby trap it. We can set it up for you, so you don't have to worry about code. Heep makes connecting things easy."
      },
      CloudLess: {
        title: 'Cloud Less',
        imagePath: svgs.cloudLess,
        desc: "Heep doesn't require an internet connection. We don't send things to the cloud, so rest assured, no one's listening in or watching you. You do you, so just relax."
      },
      DeviceParty: {
        title: 'Device Party',
        imagePath: svgs.deviceParty,
        desc: "Connect your devices and get them to talk with you and other devices. They send and receive commands, provide data, and interact with you. Enable your environment."
      },
    };

    return (
      <div>
        <Grid container style={{
          maxWidth:'100%',
          overflowX: 'hidden',
          margin: '0 auto'
        }}
          spacing={24} justify='center'>
          <Grid item xs={12} md={3}>
            <AboutCard {...inputs.PlugAndPlay}/>
          </Grid>
          <Grid item xs={12} md={3}>
            <AboutCard {...inputs.CloudLess}/>
          </Grid>
          <Grid item xs={12} md={3}>
            <AboutCard {...inputs.DeviceParty}/>
          </Grid>
        </Grid>
      </div>
    );
  };

  ourStory() {
    const inputs = {
      paddingTop: 25,
      paddingBottom: 25,
      backgroundColor: '#B0BEC5'
    };

    return(
      SectionCard(inputs,
        <Grid container style={{
          maxWidth:'100%',
          margin: '0 auto'
        }} justify ='center' alignItems ='center'>
          <Grid item xs={12} md={8}>
            <Typography variant='headline' align='center'>
              Our Story
            </Typography>
            <br/>
            <Typography variant='subheading' align='center'>
              Heep was founded in February 2017 with the dream of ubiquitous connectivity. We thought long and hard about what the world needs to make that happen. Thus, the Heep operating system was born. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum
            </Typography>
          </Grid>
        </Grid>
      )
    )
  };

  teamSection() {
    const inputs = {
      section: {
        paddingTop: 25,
        paddingBottom: 16,
      },
      teamModal: {
        james: {
          name: 'James DeVito',
          imagePath: founders.james,
          imageButtonWidth: '75%',
          desc1: 'James is our hardware whisperer. Prior to Heep, he was an early employee at Adafruit, where he built hardware and engaged with the vast Adafruit community. James is also the founder of Smooth Technology, a group of designer-engineers whose art has been featured on the likes of Taylor Swift & Katy Perry and in the MoMA & Times Square.',
          desc2: 'James is the bassist of chiptune band Anamanaguchi, known for sending pizza into space. He earned a B.S. in Music Technology with a minor in Computer Science from New York University.'
        },
      }
    };

    return (
      <div>
        {SectionCard(inputs.section,
          <Typography variant='headline' align='center'>
            Our Team
          </Typography>
        )}
        <Grid container style={{
          maxWidth:'100%',
          margin: '0 auto'
        }} justify='center'>
          <Grid item xs={12} md={3}>
            <TeamModal {...inputs.teamModal.james}/>
          </Grid>
          <Grid item xs={12} md={3}>
            <TeamModal {...inputs.teamModal.james}/>
          </Grid>
          <Grid item xs={12} md={3}>
            <TeamModal {...inputs.teamModal.james}/>
          </Grid>
          <Grid item xs={12} md={3}>
            <TeamModal {...inputs.teamModal.james}/>
          </Grid>
        </Grid>
    </div>
    )
  };

  render() {
  	return (
      <div>
        {this.topBanner()}
        {this.aboutUs()}
        {this.aboutGraphics()}
        {this.ourStory()}
        {this.teamSection()}
      </div>
    );
  }
}

export default About
