import React from 'react'
import { Grid, Paper, Typography, TextField, Button } from 'material-ui'
import { withStyles } from 'material-ui/styles'
import SectionCard from './utilities/SectionCard'

const styles = theme => ({
  button: {
    margin: theme.spacing.unit,
  },
});

class Contact extends React.Component {

  headerSection() {

    const inputs = {
      paddingBottom: 25,
    };

    return (
      SectionCard(inputs,
        <Grid container style={{
          maxWidth:'100%',
          margin: '0 auto',
          backgroundColor: '#B0BEC5',
          paddingTop: 25,
          paddingBottom: 25,
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
    )
  }

  createTextField(label, multiline=false) {
    const inputs = {
      textField: {
        style: {
          width: "100%"
        }
      }
    }

    return (
      <Grid item xs={12}
         style={{
           maxWidth: "100%",
           marginLeft: 40,
         }}>
        <TextField
          label={label}
          placeholder={label}
          multiline={multiline}
          rows="5"
          margin="normal"
          {...inputs.textField}
        />
      </Grid>
    )
  };

  contactForm() {
    return (
      <Grid item xs={7}>
        <Grid container direction="column"
          alignItems="stretch"
          justify="center"
          style={{
            maxWidth: "100%",
            margin: "0 auto"
          }}>
          <Grid item xs={12} style={{
            marginLeft: 40
          }}>
            <Typography variant='headline' gutterBottom={true} align='left'>
              Give Us A Shout
            </Typography>
            <Typography variant='subheading' align='left'>
              Fill out the form below and we'll get back to you.
            </Typography>
          </Grid>
          {this.createTextField("Name", false)}
          {this.createTextField("Company", false)}
          {this.createTextField("Email", false)}
          {this.createTextField("Message", true)}
          <Grid item xs={12} style={{
            paddingTop: 30,
          }}>
            <Grid container justify='flex-end' alignItem='center'>
              <Button variant='raised' color='secondary'>
                <Typography variant='title' style={{color: "white"}}>
                  SUBMIT
                </Typography>
              </Button>
            </Grid>
          </Grid>
        </Grid>
      </Grid>
    )
  };

  contactDetails() {
    return(
      <Grid item xs={5}>
        <Grid container direction="column"
          alignItems="center"
          justify="center"
          style={{
            maxWidth: "100%",
            margin: "0 auto"
          }}>
          <Grid item xs={12}
            style={{
              marginLeft: 40
            }}>
            <Typography variant='body2'
              align='left'
              gutterBottom={true}
              style={{fontWeight: "bold"}}>
              <br/>
              <br/>
              Connect with us:
            </Typography>
            <Typography variant='body1'
              align='left'>
              Email us at support@heep.io
            </Typography>
            <br/>
            <br/>
            <Typography variant='body1'
              align='left'
              style={{
                fontWeight: "bold"
              }}>
              Heep Inc
            </Typography>
            <Typography variant='body1' align='left'>
              250 44th St, Suite 211 <br/>
              Brooklyn, New York 11232 <br/>
              (347) - 921 - 4337
            </Typography>
          </Grid>
        </Grid>
      </Grid>
    )
  }


  render() {
    return(
      <div>
        {this.headerSection()}
        <Grid container style={{
          margin: "0 auto",
          maxWidth: "100%"
        }}>
          {this.contactForm()}
          {this.contactDetails()}
        </Grid>
    </div>
    );
  }
}

export default withStyles(styles)(Contact)
