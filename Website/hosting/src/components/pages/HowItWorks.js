import React from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import { withRouter } from 'react-router-dom'
import { withStyles } from 'material-ui/styles';
import * as Actions from '../../redux/actions'
import { logPageView } from '../../GoogleAnalytics'
import { HashLink } from "react-router-hash-link";

import { Grid, Paper, Typography, Button, Avatar, Checkbox } from 'material-ui'
import SettingsInputComponent from 'material-ui-icons/SettingsInputComponent'
import Equalizer from 'material-ui-icons/Equalizer'
import VerifiedUser from 'material-ui-icons/VerifiedUser'
import ArrowForward from 'material-ui-icons/ArrowForward'

import SectionCard from '../utilities/SectionCard'
import CollectionPreview from '../utilities/CollectionPreview'
import photos from '../../assets/remote/photos.json'


var mapStateToProps = (state) => ({
});

const styles = theme => ({
  root: theme.mixins.gutters({
    paddingTop: 16,
    paddingBottom: 16,
    height: 'calc(100% - 32px)',
    margin: 0,
  }),
});

class HowItWorks extends React.Component {
  state = {
    control: false,
    analytics: false,
    authentication: false,
    controlSelected: false,
    analyticsSelected: false,
    authenticationSelected: false,
    RFID: false, 
    MagLockStraight: false,
    PlaygroundAndShield: false,
    RFIDSelected: false, 
    MagLockStraightSelected: false,
    PlaygroundAndShieldSelected: false,
  }

  render() {
    const inputs = {
      background: 'linear-gradient(to bottom, #B0BEC5, #FFF)',
    };

    return (
      SectionCard(inputs,
        <Grid container direction='column' spacing={8} style={{
          maxWidth:'100%',
          margin: '0 auto',
          padding: 50
         }}
         justify='center' alignItems='center'>

          {this.howItWorksSummary()}
          {this.customizeYourOS()}
          {this.chooseYourFleet()}
          {this.easyIntegration()}
            
        </Grid>
      )
    );
  }

  howItWorksSummary = () => (

    <Grid item>
      <Grid container spacing={8} style={{
        maxWidth:'100%',
        margin: '0 auto',
        padding: 50
       }}
       justify='center' alignItems='center'>
        <Grid item xs={12}>
          <Typography variant='display1' align='center' gutterBottom paragraph>
            How It Works
          </Typography>
        </Grid>
        <Grid item xs={12} md={7}>
          <Typography variant='subheading' gutterBottom paragraph>
            You have a great idea about how to improve industrial manufacturing by harnessing the power of the Internet of Things.
            Focus on improving your core service, not the mechanics of managing a fleet of sensors at the edge.
            This is where Heep can help. 
            The Heep OS enables you to extend the reach of your services by allowing you to intuitively manage devices on the edge.
            Your service will be more powerful, more resilient, and less costly. 
          </Typography>
        </Grid>
        <Grid item xs={12} md={4}
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
    </Grid>

  )

  customizeYourOS = () => {

    const iconStyle = {
      color: 'primary',
      style: {
        width: 100,
        height: 100
      }
    }

    const inputsSwFocus = {
      control: {
        title: 'Controls',
        icon: <SettingsInputComponent {...iconStyle}/>,
        desc: `Additional control types, extra interoperability options, and `
      },
      analytics: {
        title: 'Analytics',
        icon: <Equalizer {...iconStyle}/>,
        desc: `Capture granular control and custom events, 
                send ultra compressed analytic data to the destination of your choice.`
      },
      authentication: {
        title: 'Auth',
        icon: <VerifiedUser {...iconStyle}/>,
        desc: `Protect your fleet with device specific access codes, hashed to your user database.`
      }
    }

    return (

      <Grid item >

        {this.numberedItem(1, 
          <Grid container direction='column' justify='center' alignItems='center' style={{margin: 0}}>
            <Grid item >
              <Typography variant='title' gutterBottom paragraph>
                Customize Your OS.
              </Typography>
            </Grid>
            <Grid item >
              <Typography variant='body1' gutterBottom paragraph>
                Try out our free tier first, or jump right in to develop on one of our enterprise tiers. 
                Optimize for Control Systems, Analytics, Two-Factor Authentication, or any combination of the above. 
                No matter what, the full force of the Heep OS is at your disposal - 
                you can extend the OS with OP code custom to your needs. 
              </Typography>
            </Grid>

            <Grid item> 
              <Grid container style={{
                  maxWidth:'100%',
                  overflowX: 'hidden',
                  margin: '0 auto'
                }} spacing={24} justify='center' alignItems='stretch'
              >
              {Object.keys(inputsSwFocus).map((section) => (
                  this.optionPaper(inputsSwFocus[section].title, inputsSwFocus[section].desc, inputsSwFocus[section].icon, section)
              ))}
              </Grid>
              <Grid container style={{
                  maxWidth:'100%',
                  overflowX: 'hidden',
                  margin: '0 auto'
                }} spacing={24} justify='center' alignItems='stretch'
              >
                {Object.keys(inputsSwFocus).map((section) => (
                  <Grid item xs={12} md={4} 
                    style={{cursor: 'pointer'}}
                    key={section + 'select'}
                  >
                    <Grid container direction='column' justify='center' alignItems='center'>
                      <Grid item>
                        <Checkbox
                          checked={this.state[section + 'Selected']}
                          onChange={() => this.setState({[section + 'Selected']: !this.state[section + 'Selected']})}
                          value={section + 'Selected'}
                        />
                      </Grid>
                    </Grid>
                  </Grid>
                ))}
              </Grid>
            </Grid>
          </Grid>
        )}
      </Grid>

    )
  }

  chooseYourFleet = () => (
    <Grid item >
      {this.numberedItem(2, 
        <Grid container direction='column' justify='center' alignItems='center' style={{margin: 0}}>
          <Grid item >
            <Typography variant='title' gutterBottom paragraph>
              Choose your Fleet.
            </Typography>
          </Grid>
          <Grid item >
            <Typography variant='body1' gutterBottom paragraph>
              Choose from a diverse array of supported hardware, or develop on your hardware of choice! 
              Heep is designed for ultimate cross compatibility, so with a little bit of setup, 
              the power of the Heep OS can be extended to your hardware, guaranteed.
              If you do choose to build on Heep hardware, 
              we can offer additional support in cloning your system to new facilities at the touch of a button. 
            </Typography>
          </Grid>

          <Grid item>
            {this.productLanding()}
          </Grid>

          <Grid item>

            <HashLink
              smooth
              to='/#top'
              style={{
                textDecoration: 'none',
                outline: 'none'
              }}
            >
            <Button variant='flat' color='secondary' style={{ textTransform: "capitalize"}}>
                Explore Heep Hardware
                <ArrowForward style={{marginLeft: this.props.theme.spacing.unit}}/>
              </Button>
            </HashLink>
          </Grid>
        </Grid>
      )}
    </Grid>
  )

  easyIntegration = () => (
    <Grid item >
      {this.numberedItem(2, 
        <Grid container direction='column' justify='center' alignItems='center' style={{margin: 0}}>
          <Grid item >
            <Typography variant='title' gutterBottom paragraph>
              Supercharge Your Service
            </Typography>
          </Grid>
          <Grid item >
            <Typography variant='body1' gutterBottom paragraph>
              With the Enterprise license, your Heep devices don't just integrate seamlessly with each other, 
              they seamlessly connect to your codebase to augment your offering. 
            </Typography>
            <Typography variant='body1' gutterBottom paragraph>
              Check out our developer documentation for more details on how Heep plugs right in to your existing project.
            </Typography>
          </Grid>

          <Grid item>

            <HashLink
              smooth
              to='/Developers#top'
              style={{
                textDecoration: 'none',
                outline: 'none'
              }}
            >
            <Button variant='flat' color='secondary' style={{ textTransform: "capitalize"}}>
                Learn More
                <ArrowForward style={{marginLeft: this.props.theme.spacing.unit}}/>
              </Button>
            </HashLink>
          </Grid>
        </Grid>
      )}
    </Grid>
  )

  productLanding() {
    const inputs = {
      padding: 5,
      // background: 'linear-gradient(to bottom, #fff, #B0BEC5)'
    }

    const productStyles = {
      grid: {
        style: {
          display: 'block',
          textAlign: 'center'
        }
      },
      product: {

        style: {
          maxWidth: 200
        }
      }
    }

    const productIDs = ['RFID', 'MagLockStraight', 'PlaygroundAndShield']

    return (
      SectionCard(inputs,
        <Grid container justify='center' style={{maxWidth: '100%', margin: 0}}>

          {productIDs.map((thisProduct) => (
            <Grid item xs={4} {...productStyles.grid}
              key={thisProduct + 'image'}
              onMouseEnter={() => this.setState({[thisProduct]: true })} 
              onMouseLeave={() => this.setState({[thisProduct]: false })}
              onClick={() => this.setState({[thisProduct + 'Selected']: !this.state[thisProduct + 'Selected']})}
              style={{
                transition: "transform 400ms",
                transform: this.state[thisProduct] ? "translate(0px, -5px)" : "translate(0px, 0px)"
              }}
            >
              <img src={photos[thisProduct]} {...productStyles.product}/>
            </Grid>
          ))}

        </Grid>
      )
    )
  }

  optionPaper(title, desc, image, section) {
    const { classes } = this.props;

    return (
      <Grid item xs={12} md={4} 
        style={{cursor: 'pointer'}}
        key={section}
      >

            <Paper className={classes.root} 
              elevation={this.state[section] ? 4 : 2}
              onMouseEnter={() => this.setState({[section]: true })} 
              onMouseLeave={() => this.setState({[section]: false })}
              onClick={() => this.setState({[section + 'Selected']: !this.state[section + 'Selected']})}
              style={{
                transition: "transform 400ms",
                transform: this.state[section] ? "translate(0px, -5px)" : "translate(0px, 0px)"
              }}
            >
              <div style={{textAlign: 'center', display: 'block'}}>
                {image}
              </div>
              <Typography
                variant="headline" component="headline"
                align="center"
                style={{paddingTop: 24, paddingBottom: 8}}>
                  {title}
              </Typography>
              <Typography component="p">
                {desc}
              </Typography>
            </Paper>
{/*           </Grid> */}
{/*         </Grid> */}
      </Grid>
    )
  }


  numberedItem = (number, wrappedComponent) => (
    <Grid container spacing={8} style={{
      maxWidth:'100%',
      margin: '0 auto',
      padding: 50
     }}
     justify='center' alignItems='center'>
      <Grid item xs={2}>
        <Typography variant='display3' gutterBottom >
          <Avatar style={{backgroundColor: '#455a64'}}> {number} </Avatar>
        </Typography>
      </Grid>

      <Grid item xs={10}>
        {wrappedComponent}
      </Grid>

     </Grid>
  )
}



function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(withStyles(styles, {withTheme: true})(HowItWorks)))
