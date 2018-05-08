import React from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import { withRouter } from 'react-router-dom'
import { withTheme } from 'material-ui/styles';
import * as Actions from '../../redux/actions'
import { HashLink } from "react-router-hash-link";

import { Grid, Paper, Typography, Button } from 'material-ui'
import Memory from 'material-ui-icons/Memory'
import DesktopWindows from 'material-ui-icons/DesktopWindows'
import ArrowForward from 'material-ui-icons/ArrowForward'

import SectionCard from '../utilities/SectionCard'
import AboutCard from '../AboutCard'
import CollectionPreview from '../utilities/CollectionPreview'
import VideoBackgroundCard from '../utilities/VideoBackgroundCard'
import { banners } from '../../assets/remote/Banners'
import { svgs } from '../../assets/remote/SVGs'
import ContactUsSection from '../utilities/ContactUsSection'

import SplitSectionCard from '../utilities/SplitSectionCard'
import assets from '../../assets/remote/general.json'

const titleVariant = 'title';
const titleAlign = 'center';

var mapStateToProps = (state) => ({
});

class LandingIIOT extends React.Component {

  topBanner() {

      const inputs = {
        backgroundColor: 'black',
        //TO-DO: Purchase video
        videoSrc: banners.networkVideo,
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
              <Typography variant='display1' align='center' style={{color:'white'}}>
                Heepify Your World
              </Typography>
            </Grid>

            <Grid item xs={12} sm={8}>
              <Typography variant='subheading' align='center' style={{color:'#bbbbbb'}}>
                Enchanted, Connected, Accessible Technology for Humans
              </Typography>

            </Grid>
          </Grid>
        )
      )
    };

  heepTechnology() {
    const inputs = [
      {
        title: 'Heep OS',
        // imagePath: svgs.cloudLess,
        desc: ` The Heep OS is a memory sharing distributed operating system and control system.
                It is designed to require the smallest possible footprint on any member device.
                `
      },
      {
        title: 'Heep API (HAPI)',
        // imagePath: svgs.deviceParty,
        desc: `
                HAPI is a local first IoT protocol designed for speed and reliability.
                All communication is distilled into simple input/output relationships.
                Connecting devices is as simple as loading a front end, and wiring two devices together in software.
                All of the operations are local and fast. `
      },
      {
        title: 'Heep Hardware',
        // imagePath: 'https://docs.particle.io/assets/images/raspberry-pi.svg',
        desc: ` We designed the Heep Core from first principles so that no electronic device is excluded, no matter what physical layer the device talks over.
                In concert with the Heep OS and HAPI, our products achieve maximum performance at application optimized costs.
                `
      }
    ]


    return (
          SectionCard({},
            <Grid container justify ='center' alignItems='center' spacing={24} style={{
              maxWidth: '100%',
              minHeight: inputs.minHeight,
              paddingTop: this.props.theme.spacing.unit * 5,
              paddingBottom: this.props.theme.spacing.unit * 5,
              margin: '0 auto'
            }}>
              <Grid item xs={12} sm={10}>
                <Typography variant='display1' align='center' paragraph>
                  Our Technology
                </Typography>

                <Grid container style={{
                    maxWidth:'100%',
                    overflowX: 'hidden',
                    margin: '0 auto'
                  }} spacing={24} justify='center' alignItems='stretch'
                >
                  {inputs.map((thisInput) => (
                    <Grid item xs={12} md={4} key={thisInput.title}>
                      <AboutCard {...thisInput}/>
                    </Grid>
                  ))}
                </Grid>
              </Grid>
            </Grid>
          )
        )
  };

  iiotCollection() {

    return(
      <CollectionPreview collectionName='Industrial Automation'/>
    )
  }

  bigQuote(quote) {
    const fontSize = 36

    const inputs = {
      sectionInputs: {
        paddingTop: 25,
        paddingBottom: 25,
        backgroundColor: '#B0BEC5'
      },
      icon: {
        color: 'primary',
        style: {
          width: 100,
          height: 100
        }
      }
    };


    return(
      SectionCard(inputs.sectionInputs,
        <Grid container justify ='center' alignItems='center' spacing={24} style={{
          maxWidth: '100%',
          minHeight: inputs.minHeight,
          paddingTop: this.props.theme.spacing.unit * 5,
          paddingBottom: this.props.theme.spacing.unit * 5,
          margin: '0 auto'
        }}>
          <Grid item xs={3}>
            <Grid container justify='center'>
              <Grid item>
                <Memory {...inputs.icon}/>
              </Grid>
            </Grid>
          </Grid>
          <Grid item xs={6}>
                <Typography variant='subheading' align='center' paragraph style={{fontSize: '1.8rem'}}>
                  {quote}
                </Typography>
          </Grid>
          <Grid item xs={3}>
            <Grid container justify='center'>
              <Grid item>
                <DesktopWindows {...inputs.icon}/>
            </Grid>
            </Grid>
          </Grid>
        </Grid>
      )
    )
  }


  splitSectionWithBlurb(sectionInfo, orientation) {
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
         justify='center' alignItems='center' key={sectionInfo.title}>
          <Grid item  xs={12} md={10}>
            <Typography variant={titleVariant} align={titleAlign}>
              {sectionInfo.title}
            </Typography>

            <Typography variant='body1' align='left' style={{color: '#999'}}>

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

  render() {
    const inputs = {
      quote1: `From the smallest embedded chip, to lightning fast gaming PCs,
                  Heep unlocks immersive, living, tangibly magical experiences.`,
      quote2: ``
    }

    const blurbs = [
      {
        title: 'Commercial Applications',
        link: 'missionChinese',
        moreInfoLink: {
          text: 'Learn More',
          link: '/Business'
        }
      },
      {
        title: 'Industrial Applications',
        link: 'interoperability',
        moreInfoLink: {
          text: 'Learn More',
          link: '/IndustrialHeep'
        }
      },
      {
        title: 'Consumer Applications',
        link: 'paperSignals',
        moreInfoLink: {
          text: 'Learn More',
          link: '/diy'
        }
      }
    ]

  	return (
      <div>
        {this.topBanner()}
{/*         {this.iiotCollection()} */}
        {this.heepTechnology()}
        {this.bigQuote(inputs.quote1)}
        {blurbs.map((sectionInfo, index) => {
          return this.splitSectionWithBlurb(sectionInfo, index % 2 == 0 ? 'left' : 'right')
        })}
        <ContactUsSection />
      </div>
      );
  }
}



function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(withTheme()(LandingIIOT)))
