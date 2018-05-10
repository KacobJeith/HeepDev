import React from 'react'

import { Grid, Typography } from 'material-ui';

import SectionCard from '../utilities/SectionCard'
import AboutCard from './AboutCard'
import TeamModal from './TeamModal'

import { founders } from '../../assets/remote/Founders'
import { banners } from '../../assets/remote/Banners'
import { svgs } from '../../assets/remote/SVGs'
import { logos } from '../../assets/remote/Logos'
import photos from '../../assets/remote/photos.json'

class About extends React.Component {

  topBanner() {

    const inputs = {
      paddingTop: 25,
      paddingBottom: 25,
      backgroundColor: '#9fb4c4',
      imagePath: banners.brooklynBridge,
      minHeight: 400,
    }

    return(
      SectionCard(inputs, '')
    )
  };

  mission() {
    const inputs = {
      background: 'linear-gradient(to bottom, #9fb4c4, #FFF)',
    };

    return (
      SectionCard(inputs,
        <Grid container spacing={8} style={{
          maxWidth:'100%',
          margin: '0 auto',
          padding: 50
         }}
         justify='center' alignItems='center'>
          <Grid item xs={12}>
            <Typography variant='headline' align='center' gutterBottom paragraph>
              About Heep
            </Typography>
          </Grid>
          <Grid item xs={12} md={5}>
            <Typography variant='subheading' gutterBottom paragraph>
              Heep leverages connectedness to empower people to be more productive,
              make better decisions,
              and enjoy a better quality of life.
            </Typography>
            <Typography variant='subheading' paragraph>
              The Heep platform makes connectivity the simplest and most secure way to design any product.
              By reimagining IoT as a critical infrastructure rather than an add-on luxury,
              Heep is able to deliver a scalable and intuitive experience at a fraction of the cost.
            </Typography>
          </Grid>
          <Grid item xs={12} md={3}
            style={{
              textAlign: 'center',
              display: 'block',
          }}>
            <img
              src={photos.RFID}
              style={{maxHeight: 230}}
            />
          </Grid>
        </Grid>
      )
    );
  };

  ourValues() {
    const inputs = {
    };

    return (
      SectionCard(inputs,
        <Grid container style={{
          maxWidth:'100%',
          margin: '0 auto',
          paddingTop: 50,
         }}
         justify='center' alignItems='center'>
          <Grid item xs={12} md={8}>
            <Typography variant='headline' align='center' gutterBottom paragraph>
              Open Source, Secure, and Easy.
            </Typography>
          </Grid>
          <Grid item xs={12}>
            {this.aboutGraphics()}
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
                You do you, so just relax and enjoy.`
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
          margin: '0 auto',
          paddingBottom: 50
        }}
          spacing={24} justify='center'>
          <Grid item xs={8} sm={4} md={4} lg={3}>
            <AboutCard {...inputs.PlugAndPlay}/>
          </Grid>
          <Grid item xs={8} sm={4} md={4} lg={3}>
            <AboutCard {...inputs.CloudLess}/>
          </Grid>
          <Grid item xs={8} sm={4} md={4} lg={3}>
            <AboutCard {...inputs.DeviceParty}/>
          </Grid>
        </Grid>
      </div>
    );
  };

  ourStory() {
    const inputs = {
      padding: 50,
      background: "linear-gradient(to bottom, #0e2d3c, #16465c, #0e2d3c)"
    };

    return(
      SectionCard(inputs,
        <Grid container style={{
          maxWidth:'100%',
          margin: '0 auto'
        }} justify ='center' alignItems ='center'>
          <Grid item xs={12}>
            <Typography variant='headline' align='center' style={{color: "#f1f1f1"}} paragraph gutterBottom>
              Our Story
            </Typography>
          </Grid>
          <Grid item xs={12} md={2}
            style={{
              textAlign: 'center',
              display: 'block',
              paddingBottom: 10
          }}>
            <img
              src={logos.gradientLogo}
              style={{maxHeight: 150}}
            />
          </Grid>
          <Grid item xs={12} md={6}>
            <Typography variant='subheading' style={{color: "#f1f1f1"}} paragraph>
              Heep was founded in February 2017 with the dream of ubiquitous connectivity.
              We thought long and hard about what the world needs to make that happen.
              Thus, the Heep operating system was born.
              The Heep team hails from a diverse set of backgrounds.
            </Typography>
          </Grid>
        </Grid>
      )
    )
  };

  teamSection() {
    const inputs = {
      teamModal: {
        james: {
          name: 'James DeVito',
          imagePath: founders.james,
          imageButtonWidth: '75%',
          desc1: 'James is our hardware whisperer. Prior to Heep, he was an early employee at Adafruit, where he built hardware and engaged with the vast Adafruit community. James is also the founder of Smooth Technology, a group of designer-engineers whose art has been featured on the likes of Taylor Swift & Katy Perry and in the MoMA & Times Square.',
          desc2: 'James is the bassist of chiptune band Anamanaguchi, known for sending pizza into space. He earned a B.S. in Music Technology with a minor in Computer Science from New York University.'
        },
        jacob:{
          name: 'Jacob Keith',
          imagePath: founders.jacob,
          imageButtonWidth: '75%',
          desc1: 'Jacob Keith, Founder & CEO, is responsible for Heep’s vision, strategy, and full-stack frontend development. Prior to Heep, he was Product Director at Nanotronics, where he juggled his roles writing computer vision algorithms for industrial process control, managing an engineering team spread across three states, and heading customer relations in Asia.',
          desc2: 'Jacob speaks fluent Mandarin Chinese and slays at the violin. He earned a B.S. in Materials Science & Engineering from Columbia University'
        },
        yenny: {
          name: 'Yenny Su',
          imagePath: founders.yenny,
          imageButtonWidth: '75%',
          desc1: 'Yenny Su, Founder & CRO, spends her time on strategy, finance, and business development. Prior to Heep, she was a consultant at BlackRock, where she helped build its fledgling advisory business and provided investment strategy to the firm’s largest institutional clients, ranging from $300 million to $50 billion in assets under management.',
          desc2: 'Yenny loves the outdoors and spent most of 2017 hiking from Mexico to Canada on the Pacific Crest Trail. She earned a B.A., with honors, in Financial Economics and Political Science from Columbia University.'
        },
        dylan: {
          name: 'Dylan Fashbaugh',
          imagePath: founders.dylan,
          imageButtonWidth: '75%',
          desc1: 'Dylan Fashbaugh, Founder & CTO, is the architect behind the Heep platform. Prior to Heep, he led Software Engineering at Nanotronics and focused on image processing and motion control algorithms. Along with James, he is a co-founder of Smooth Technology.',
          desc2: 'Dylan is a serial inventor, speaks fluent byte code, and can do the fourier transformation in his head. His brain controlled guitar pedals won the entrepreneurship portion of Cornell and Intel’s National Systems Engineering Competition. He earned a B.S. in Computer Engineering from the University of Akron.'
        }
      }
    };

    return (
      <div style={{
        paddingTop: 50,
        paddingBottom: 50
      }}>
        <Grid container style={{
          maxWidth:'100%',
          margin: '0 auto',
        }} justify='center'>
          <Grid item xs={12} style={{paddingBottom: 20}}>
            <Typography variant='headline' align='center'>
              Our Team
            </Typography>
          </Grid>
          <Grid item xs={8} sm={5} md={3} style={{paddingBottom: 15}}>
            <TeamModal {...inputs.teamModal.jacob}/>
          </Grid>
          <Grid item xs={8} sm={5} md={3} style={{paddingBottom: 15}}>
            <TeamModal {...inputs.teamModal.dylan}/>
          </Grid>
          <Grid item xs={8} sm={5} md={3} style={{paddingBottom: 15}}>
            <TeamModal {...inputs.teamModal.james}/>
          </Grid>
          <Grid item xs={8} sm={5} md={3} style={{paddingBottom: 15}}>
            <TeamModal {...inputs.teamModal.yenny}/>
          </Grid>
        </Grid>
    </div>
    )
  };

  render() {
  	return (
      <div>
        {this.topBanner()}
        {this.mission()}
        {this.ourValues()}
        {this.ourStory()}
        {this.teamSection()}
      </div>
    );
  }
}

export default About
