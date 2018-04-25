import React from 'react'

import { Grid, Typography } from 'material-ui';

import SectionCard from '../utilities/SectionCard'
import VideoBackgroundCard from '../utilities/VideoBackgroundCard'
import AboutCard from '../AboutCard'
import TeamModal from '../TeamModal'
import SplitSectionCard from '../utilities/SplitSectionCard'

import { founders } from '../../assets/remote/Founders'
import { banners } from '../../assets/remote/Banners'
import { svgs } from '../../assets/remote/SVGs'

const titleVariant = 'display1';
const titleAlign = 'center';

class IIOT extends React.Component {

  topBanner() {

    const inputs = {
      backgroundColor: '#00adee',
      imagePath: banners.iiot,
      //TO-DO: Purchase video
      videoSrc: 'https://media.istockphoto.com/videos/male-asian-engineer-inspecting-the-work-process-of-the-robots-their-video-id804872590',
      minHeight: 400,
    }

    return(
      VideoBackgroundCard(inputs, 
        <Grid container direction='column' justify ='center' alignItems ='center' style={{
          width: '100%',
          minHeight: inputs.minHeight,
          margin: '0 auto'
        }}>
          <Grid item xs={12} sm={8}>
            <Typography variant={titleVariant} align={titleAlign} style={{color:'white'}}>
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

  security(imageSide) {
    const inputs = {
      imageSide: imageSide, 
      minHeight: 400,
      imagePath: 'https://ujg433eawlo3i4uqknhm8e1b-wpengine.netdna-ssl.com/wp-content/uploads/2016/11/iot-security-attacks.jpg'
    };

    return (
      SplitSectionCard(inputs,
        <Grid container style={{
          maxWidth:'100%',
          margin: '0 auto'
         }}
         justify='center' alignItems='center'>
          <Grid item  xs={12} md={8}>
            <Typography variant={titleVariant} align={titleAlign}>
              Secure
            </Typography>
            <br/>
            <Typography variant='subheading' align='left' gutterBottom paragraph>
              <ul>
                <li>No cloud dependence</li>
                <li>Encrypted communications</li>
                <li>Protect legacy systems with Two-Factor Authentication</li>
              </ul>
            </Typography>

          </Grid>
        </Grid>
      )
    );
  };

  insights(imageSide) {
    const inputs = {
      imageSide: imageSide, 
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
            <Typography variant={titleVariant} align={titleAlign}>
              Collect Actionable Insights
            </Typography>

            <Typography variant='subheading' align='left' gutterBottom paragraph>
              <ul>
                <li>Optimizes your technology investment for data collection, not infrastructure overhead</li> 
                <li>More actionable insights, less wasted overhead</li>
                <li>Become NIST SP 800-171 compliant with 100% asset utilization tracking coverage</li>
              </ul>
            </Typography>

          </Grid>
        </Grid>
      )
    );
  };

  interoperability(imageSide) {
    const inputs = {
      imageSide: imageSide, 
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
            <Typography variant={titleVariant} align={titleAlign}>
              Interoperability
            </Typography>

             <Typography variant='subheading' align='left' gutterBottom paragraph>
              <ul>
                <li>Optimizes your technology investment for data collection, not infrastructure overhead</li> 
                <li>More actionable insights, less wasted overhead</li>
                <li>Become NIST SP 800-171 compliant with 100% asset utilization tracking coverage</li>
              </ul>
            </Typography>

          </Grid>
        </Grid>
      )
    );
  };

  controlSystem(imageSide) {
    const inputs = {
      imageSide: imageSide, 
      minHeight: 400,
      imagePath: 'http://www.tdworld.com/sites/tdworld.com/files/distributed-network-MickeyCZ.jpg'
    };

    return (
      SplitSectionCard(inputs,
        <Grid container style={{
          maxWidth:'100%',
          margin: '0 auto'
         }}
         justify='center' alignItems='center'>
          <Grid item  xs={12} md={8}>
            <Typography variant={titleVariant} align={titleAlign} paragraph>
              Design Powerful Robust Control Systems
            </Typography>
            
          </Grid>
        </Grid>
      )
    );
  };

  simplicity(imageSide) {
    const inputs = {
      imageSide: imageSide, 
      minHeight: 400,
      imagePath: 'http://www.tdworld.com/sites/tdworld.com/files/distributed-network-MickeyCZ.jpg'
    };

    return (
      SplitSectionCard(inputs,
        <Grid container style={{
          maxWidth:'100%',
          margin: '0 auto'
         }}
         justify='center' alignItems='center'>
          <Grid item  xs={12} md={8}>
            <Typography variant={titleVariant} align={titleAlign} paragraph>
              Simple Integration
            </Typography>
            <Typography variant='subheading' align='center' paragraph>
              <ul>
                <li>Single wire design for plug & play installation</li> 
                <li>No software installation required on existing systems</li>
              </ul>
            </Typography>
          </Grid>
        </Grid>
      )
    );
  };

  localFirst(imageSide) {
    const inputs = {
      imageSide: imageSide, 
      minHeight: 400,
      imagePath: 'http://ideflorbio.pa.gov.br/wp-content/uploads/2016/11/sl1.png'
    };

    return (
      SplitSectionCard(inputs,
        <Grid container style={{
          maxWidth:'100%',
          margin: '0 auto'
         }}
         justify='center' alignItems='center'>
          <Grid item  xs={12} md={8}>
            <Typography variant={titleVariant} align={titleAlign} paragraph>
              Local First Design
            </Typography>
            <Typography variant='subheading' align='center' paragraph>
              Your data is your data. Period. 
            </Typography>
            <Typography variant='subheading' align='center' paragraph>
              Your operations should not be dependent on high-latency and interceptable cloud operations.
              Empower your operations without the risk of relying on cloud uptime.
            </Typography>
          </Grid>
        </Grid>
      )
    );
  };

  render() {
    return (
      <div>
        {this.topBanner()}
        {this.simplicity('left')}
        {this.security('right')}
        {this.insights('left')}
        {this.interoperability('right')}
        {this.controlSystem('left')}
        {this.localFirst('right')}
      </div>
    );
  }
}

export default IIOT
