import React from 'react'

import { Grid, Typography, Button } from 'material-ui';
import { HashLink } from "react-router-hash-link";
import { withTheme } from 'material-ui/styles';
import { withRouter }         from 'react-router-dom'

import SectionCard from '../utilities/SectionCard'
import VideoBackgroundCard from '../utilities/VideoBackgroundCard'
import AboutCard from '../AboutCard'
import TeamModal from '../TeamModal'
import SplitSectionCard from '../utilities/SplitSectionCard'

import { founders } from '../../assets/remote/Founders'
import { banners } from '../../assets/remote/Banners'
import { svgs } from '../../assets/remote/SVGs'

const titleVariant = 'title';
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
      imagePath: sectionInfo.imgSrc
    };

    return (
      SplitSectionCard(inputs,
        <Grid container id={sectionInfo.link} style={{
          maxWidth:'100%',
          margin: '0 auto'
         }}
         justify='center' alignItems='center'>
          <Grid item  xs={12} md={8}>
            <Typography variant={titleVariant} align={titleAlign}>
              {sectionInfo.title}
            </Typography>

            <Typography variant='subheading' align='left' gutterBottom paragraph>
              <ul>
                {sectionInfo.bullets.map((thisBullet) => (
                  <li>{thisBullet}</li> 
                ))}
              </ul>
            </Typography>

          </Grid>
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
        <Grid container style={{
          maxWidth:'100%',
          margin: '0 auto'
        }} justify ='center' alignItems ='center'>
          <Grid item xs={12}>
            <Typography variant='headline' align='center'>
              Let's Get Started.
            </Typography>
            <br/>
            <Typography variant='subheading' align='center' paragraph>
              Contact us for a consulation on how Heep products can augment your operations.
            </Typography>
           
            


          </Grid>

          <Grid item >
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
        imgSrc: 'http://talkdailynews.com/wp-content/uploads/2018/02/Global-Smart-Factory-Market-640x360.jpg',
        bullets: [
          'No cloud dependence',
          'Encrypted communications',
          'Protect legacy systems with Two-Factor Authentication'
        ]
      },
      {
        link: 'insights', 
        title: 'Insights',
        imgSrc: 'https://i1.wp.com/electronicpublic.com/wp-content/uploads/2018/03/industrial-control-and-factory-automation-market.jpg?fit=600%2C400&ssl=1',
        bullets: [
          'Optimizes your technology investment for data collection, not infrastructure overhead',
          'More actionable insights, less wasted overhead',
          'Become NIST SP 800-171 compliant with 100% asset utilization tracking coverage'
        ]
      },
      {
        link: 'interoperability', 
        title: 'Interoperability',
        imgSrc: 'https://dynaimage.cdn.cnn.com/cnn/q_auto,w_1024,c_fill,g_auto,h_576,ar_16:9/http%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F140104172932-boeing-assembly-line-file.jpg',
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
        imgSrc: 'http://www.maxxi.art/wp-content/uploads/2017/12/cern.jpg?x64602',
        bullets: [
          'Your data is your data. Period.',
          'Your operations should not be dependent on high-latency and interceptable cloud operations. ',
          'Empower your operations without the risk of relying on cloud uptime.'
        ]
      },
      {
        link: 'simple-integration', 
        title: 'Simplicity',
        imgSrc: 'http://www.newelectronics.co.uk/article-images/164720/24350701403_759e7c7e76_k_fitted1367x860_popup.jpg',
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
