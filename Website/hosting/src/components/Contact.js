import React from 'react'
import { Grid, Typography, TextField, Button, Hidden } from 'material-ui'
import { withStyles } from 'material-ui/styles'
import SectionCard from './utilities/SectionCard'

const styles = theme => ({
  root: theme.mixins.gutters({
    padding: 20,
    // paddingTop: 16,
    // paddingBottom: 16,
    margin: theme.spacing.unit * 3,
  }),
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
          <Grid item  xs={10} md={8}>
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

  contactTextField(label, multiline=false) {
    const inputs = {
      textField: {
        style: {
          width: "100%",
        }
      }
    }

    return (
      <Grid item xs={12}
         style={{
           maxWidth: "100%",
           margin: "0"
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

  contactHeadline() {
    return (
      <Grid item xs={12}>
        <Typography variant='headline' gutterBottom={true} align='left'>
          Give Us A Shout
        </Typography>
        <Typography variant='subheading' align='left'>
          Fill out the form below and we'll get back to you.
        </Typography>
      </Grid>
    )
  }

  contactButton() {
    return (
      <Grid item xs={12} style={{
        paddingTop: 30,
      }}>
        <Grid container justify='flex-end' alignItems='center'>
          <Button variant='raised' color='secondary'>
            <Typography variant='title' style={{color: "white"}}>
              Submit
            </Typography>
          </Button>
        </Grid>
      </Grid>
    )
  }

  contactForm() {
    const { classes } = this.props;

    return (
      <Grid item xs={12} md={6}>
          <Grid container direction="column"
            alignItems="stretch"
            justify="center"
            style={{
              maxWidth: "100%",
              margin: "0 auto",
              paddingLeft: 40,
              paddingRight: 40
            }}>
            {this.contactHeadline()}
            {this.contactTextField("Name", false)}
            {this.contactTextField("Company", false)}
            {this.contactTextField("Email", false)}
            {this.contactTextField("Message", true)}
            {this.contactButton()}
          </Grid>
      </Grid>
    )
  };

  contactDetails() {
    return(

      <Grid item xs={12} md={6}>
        <Grid container direction="column"
          alignItems="center"
          justify="center"
          style={{
            maxWidth: "100%",
            margin: "0 auto"
          }}>
          <Grid item xs={12}>
            <Typography variant='subheading'
              align='center'
              gutterBottom={true}
              style={{fontWeight: "bold"}}>
              <br/>
              <br/>
              Connect with us:
            </Typography>
            <Typography variant='subheading'
              align='center'>
              Email us at support@heep.io
            </Typography>
            <br/>
            <br/>
            <Typography variant='subheading'
              align='center'
              style={{
                fontWeight: "bold"
              }}>
              Heep Inc
            </Typography>
            <Typography variant='subheading' align='center'>
              250 44th St, Suite 211 <br/>
              Brooklyn, New York 11232 <br/>
              (347) - 921 - 4337
            </Typography>
          </Grid>
        </Grid>
      </Grid>
    )
  }

  mapSection() {
    return (
      <Grid container style={{
        paddingTop: 40,
      }}>
        <Grid item xs={12}>
          <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d138871.76625127273!2d-74.15451278130566!3d40.70334362282912!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zNDDCsDM5JzA1LjUiTiA3NMKwMDAnNDQuNCJX!5e0!3m2!1sen!2sus!4v1524508764529"
            frameBorder="0"
            style={{border: 0,
            width: "100%",
            height: 400,
            margin: 0
          }}
            allowFullScreen
          />
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
        {this.mapSection()}
    </div>
    );
  }
}

export default withStyles(styles)(Contact)
