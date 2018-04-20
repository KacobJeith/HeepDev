import React from 'react'

import { Grid, Typography } from 'material-ui';

import SectionCard from '../utilities/SectionCard'
import AboutCard from '../AboutCard'
import TeamModal from '../TeamModal'
import SplitSectionCard from '../utilities/SplitSectionCard'

import { founders } from '../../assets/remote/Founders'
import { banners } from '../../assets/remote/Banners'
import { svgs } from '../../assets/remote/SVGs'

class IIOT extends React.Component {

  topBanner() {

    const inputs = {
      paddingTop: 25,
      paddingBottom: 25,
      backgroundColor: '#00adee',
      imagePath: banners.iiot,
      minHeight: 400,
    }

    return(
      SectionCard(inputs, 
        <Grid container direction='column' justify ='center' alignItems ='center' style={{
          maxWidth: '100%',
          minHeight: inputs.minHeight,
          margin: '0 auto'
        }}>
          <Grid item xs={12} sm={8}>
            <Typography variant='display1' align='center' style={{color:'white'}}>
              Leverage Embedded Insights 
            </Typography>
          </Grid>

          <Grid item xs={12} sm={8}>
            <Typography variant='subheading' align='center' style={{color:'white'}}>
              By embedding intelligence throughout your process, 
              you can unlock higher yields, more secure operation, and competitive advantages for your business.
            </Typography>
          </Grid>
        </Grid>
      )
    )
  };

  mission() {
    const inputs = {
      imageSide: 'left', 
      minHeight: 400,
      imagePath: 'https://user-images.githubusercontent.com/3604149/38447851-16ac9844-39ce-11e8-9fc3-1963cea40556.gif'
    };

    return (
      SplitSectionCard(inputs,
        <Grid container style={{
          maxWidth:'100%',
          margin: '0 auto'
         }}
         justify='center' alignItems='center'>
          <Grid item  xs={12} md={8}>
            <Typography variant='headline' align='center'>
              Our Mission
            </Typography>
            <br/>
            <Typography variant='subheading' align='center' gutterBottom paragraph>
              Heep leverages connectedness to empower people to be more productive, 
              make better decisions, 
              and enjoy a better quality of life. 
            </Typography>
            <Typography variant='subheading' align='center' paragraph>
              The Heep platform makes connectivity the simplest and most secure way to design any product. 
              By reimagining IoT as a critical infrastructure rather than an add-on luxury, 
              Heep is able to deliver a scalable and intuitive experience at a fraction of the cost.
            </Typography>
          </Grid>
        </Grid>
      )
    );
  };

  interoperability() {
    const inputs = {
      imageSide: 'right', 
      minHeight: 400,
      imagePath: 'https://user-images.githubusercontent.com/3604149/38447851-16ac9844-39ce-11e8-9fc3-1963cea40556.gif'
    };

    return (
      SplitSectionCard(inputs,
        <Grid container style={{
          maxWidth:'100%',
          margin: '0 auto'
         }}
         justify='center' alignItems='center'>
          <Grid item  xs={12} md={8}>
            <Typography variant='headline' align='center'>
              Interoperability
            </Typography>

          </Grid>
        </Grid>
      )
    );
  };

  controlSystem() {
    const inputs = {
      imageSide: 'left', 
      minHeight: 400,
      imagePath: 'https://user-images.githubusercontent.com/3604149/38447851-16ac9844-39ce-11e8-9fc3-1963cea40556.gif'
    };

    return (
      SplitSectionCard(inputs,
        <Grid container style={{
          maxWidth:'100%',
          margin: '0 auto'
         }}
         justify='center' alignItems='center'>
          <Grid item  xs={12} md={8}>
            <Typography variant='headline' align='center'>
              Design Rich Control Systems
            </Typography>
            
          </Grid>
        </Grid>
      )
    );
  };

  ourValues() {
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
              Our Values
            </Typography>
            <br/>
            <Typography variant='subheading' align='center' gutterBottom paragraph>
              Open Source, Secure, Easy even for the Technophobe
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
        desc: `Unbox, wire, and play. 
                Automate your home or booby trap it. 
                We can set it up for you, so you don't have to worry about code. 
                Heep makes connecting things easy.`
      },
      CloudLess: {
        title: 'Cloud Less',
        imagePath: svgs.cloudLess,
        desc: `Heep doesn't require an internet connection. 
                We don't send things to the cloud, so rest assured, no one's listening in or watching you. 
                You do you, so just relax.`
      },
      DeviceParty: {
        title: 'Device Party',
        imagePath: svgs.deviceParty,
        desc: `Connect your devices and get them to talk with you and other devices. 
                They send and receive commands, provide data, and interact with you. 
                Enable your environment.`
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
            <Typography variant='subheading' align='center' paragraph>
              Heep was founded in February 2017 with the dream of ubiquitous connectivity. 
              We thought long and hard about what the world needs to make that happen. 
              Thus, the Heep operating system was born. 
            </Typography>
          </Grid>
        </Grid>
      )
    )
  };

 

  render() {
    return (
      <div>
        {this.topBanner()}
        {this.mission()}
        {this.interoperability()}
        {this.controlSystem()}
      </div>
    );
  }
}

export default IIOT
