import React from 'react'

import { Grid, Typography, Button } from 'material-ui';
import ArrowForward from 'material-ui-icons/ArrowForward'
import { HashLink } from "react-router-hash-link";
import { withTheme } from 'material-ui/styles';
import { withRouter }         from 'react-router-dom'

import SectionCard from '../utilities/SectionCard'
import VideoBackgroundCard from '../utilities/VideoBackgroundCard'
import AboutCard from '../AboutCard'
import TeamModal from '../TeamModal'
import SplitSectionCard from '../utilities/SplitSectionCard'

import assets from '../../assets/remote/iiotAssets.json'

const titleVariant = 'title';
const titleAlign = 'center';

class IIOT extends React.Component {

  topBanner() {

    const inputs = {
      backgroundColor: '#00adee',
      //TO-DO: Purchase video
      videoSrc: assets.bannerVideo,
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
            <Typography variant='display1' align={titleAlign} style={{color:'white'}}>
              Manufacturing has never been so Simple
            </Typography>
          </Grid>

          <Grid item xs={12} sm={8}>
            <Typography variant='subheading' align='center' style={{color:'#bbbbbb'}}>
              By embedding intelligence throughout your process, 
              you can unlock higher yields, 
              more secure operation, 
              and competitive advantages for your business.
            </Typography>

          </Grid>
        </Grid>
      )
    )
  };


  sectionLinks(sections) {

    return (
      <Grid container alignItems='center' justify='center' spacing={0} 
        style={{
          backgroundColor: this.props.theme.palette.primary.dark, 
          padding: this.props.theme.spacing.unit,
          width: '100%',
          margin: '0 auto'
        }}
      >
        {sections.map((nextSection) => (
          <Grid item key={nextSection.link + 'key'} 
            style={{marginRight: 20}}

          >    
            <HashLink 
                smooth 
                to={"#" + nextSection.link} 
                style={{
                  textDecoration: 'none',
                  outline: 'none',
                  color: 'white'
                }}
                >

                <Button variant='flat' style={{ textTransform: "capitalize", color: this.props.theme.palette.primary.contrastText}}> 
                  {nextSection.title}
                </Button>
              </HashLink>
          </Grid>
        ))}
      </Grid>
    )
  }

  splitSectionWithBullets(sectionInfo, orientation) {
    const inputs = {
      imageSide: orientation, 
      minHeight: 400,
      imagePath: assets[sectionInfo.link]
    };

    return (
      SplitSectionCard(inputs,
        <Grid container id={sectionInfo.link} style={{
          maxWidth:'100%',
          margin: '0 auto'
         }}
         justify='center' alignItems='center'>
          <Grid item  xs={12} md={10}>
            <Typography variant={titleVariant} align={titleAlign}>
              {sectionInfo.title}
            </Typography>

            <Typography variant='body1' align='left' gutterBottom style={{color: '#999'}}>
              <ul>
                {sectionInfo.bullets.map((thisBullet, index) => (
                  <li key={sectionInfo.link + index}>{thisBullet}</li> 
                ))}
              </ul>
            </Typography>

          </Grid>
          {sectionInfo.moreInfoLink && (
            <Grid item xs={12}>
              <Grid container justify='center' alignItems='center'>
                <HashLink 
                  smooth 
                  to={sectionInfo.moreInfoLink.externalLink ? 
                    'IndustrialHeep' : 
                    sectionInfo.moreInfoLink.link} 
                  style={{
                    textDecoration: 'none',
                    outline: 'none'
                  }}
                >
                <Button variant='flat' color='secondary' style={{ textTransform: "capitalize"}}
                  onClick={sectionInfo.moreInfoLink.externalLink ? 
                    () => window.open(sectionInfo.moreInfoLink.externalLink, '_blank') : 
                    () => {}}> 
                    {sectionInfo.moreInfoLink.text}
                    <ArrowForward style={{marginLeft: this.props.theme.spacing.unit}}/>
                  </Button>
                </HashLink>
              </Grid>
            </Grid>
          )}
          
        </Grid>
      )
    );
  };

  contactUs() {
    const inputs = {
      paddingTop: 25,
      paddingBottom: 25,
      backgroundColor: 'white'
    };

    return(
      SectionCard(inputs,
        <Grid container direction='column' style={{
          maxWidth:'100%',
          minHeight: 400,
          margin: '0 auto'
        }} justify='center' alignItems='center'>
          <Grid item xs={12}>
            <Typography variant='headline' align='center'>
              Let's Get Started.
            </Typography>
            <br/>
            <Typography variant='subheading' align='center' paragraph>
              Contact us for a consulation on how Heep products can augment your operations.
            </Typography>
           
          </Grid>

          <Grid item>
            <HashLink 
              smooth 
              to={"/Contact#top"} 
              style={{
                textDecoration: 'none',
                outline: 'none'
              }}
            >
            <Button variant='raised' color='secondary' style={{ textTransform: "capitalize"}}> 
                Contact Us
              </Button>
            </HashLink>
          </Grid>

        </Grid>
      )
    )
  };

  render() {

    const sections = [
      {
        link: 'security', 
        title: 'Security',
        bullets: [
          'Heep networks require no cloud connectivity. You control where your data gets sent.',
          'All Heep devices encrypt even their local communications. No other edge computing platform takes security this seriously.',
          'Leverage Heep to protect your legacy systems with two-factor Authentication'
        ],
        moreInfoLink: {
          text: 'Learn More',
          link: '/product/Z2lkOi8vc2hvcGlmeS9Qcm9kdWN0VmFyaWFudC8xMjYxODQ1MjE3MzA5'
        }
      },
      {
        link: 'insights', 
        title: 'Insights',
        bullets: [
          'Optimize your technology investment for actionable insights, without the often costly overhead',
          'Heep Analytics store locally on the edge and across the distributed OS, with option for centralized storage',
          'Become NIST SP 800-171 compliant with 100% asset utilization tracking coverage'
        ],
        moreInfoLink: {
          text: 'Learn More',
          externalLink: 'https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-171r1.pdf'
        }
      },
      {
        link: 'interoperability', 
        title: 'Interoperability',
        bullets: [
          'Focus on your product, not vender technology integrations',
          'Leveraging the Heep application programming interface (HAPI), your assets communicate seamlessly for light fast operation',

        ]
      },
      // {
      //   link: 'powerful-control-systems', 
      //   title: 'Control System',
      //   imgSrc: 'http://www.tdworld.com/sites/tdworld.com/files/distributed-network-MickeyCZ.jpg',
      //   bullets: [
      //     // '',
      //     // '',
      //     // ''
      //   ]
      // },
      {
        link: 'local-first', 
        title: 'Local First',
        bullets: [
          'Your data is your data. Period.',
          'Your operations should not be dependent on high-latency and interceptable cloud operations. ',
          'Empower your operations without the risk of relying on cloud uptime.'
        ]
      },
      {
        link: 'simple-integration', 
        title: 'Simplicity',
        bullets: [
          'Single wire design for plug & play installation',
          'No software installation required on existing systems'
        ]
      }
    ];

    return (
      <div>
        {this.topBanner()}
        {this.sectionLinks(sections)}
        {sections.map((sectionInfo, index) => {
          return this.splitSectionWithBullets(sectionInfo, index % 2 == 0 ? 'left' : 'right')
        })}
        {this.contactUs()}
      </div>
    );
  }
}

export default withRouter(withTheme()(IIOT))
