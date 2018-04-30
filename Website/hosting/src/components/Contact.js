import React from 'react'
import { bindActionCreators } from 'redux'
import { Grid, Typography, TextField, Button, Hidden, Modal, Snackbar } from 'material-ui'
import { withStyles } from 'material-ui/styles'
import SectionCard from './utilities/SectionCard'
import * as Actions from '../redux/actions'
import { connect } from 'react-redux'
import { withRouter } from 'react-router-dom'
import * as validator from 'email-validator'

const mapStateToProps = (state) => ({
})

const styles = theme => ({
  root: theme.mixins.gutters({
    padding: 20,
    margin: theme.spacing.unit * 3,
  }),
  button: {
    margin: theme.spacing.unit,
  },
  paper: {
    position: 'absolute',
    backgroundColor: theme.palette.background.paper,
    boxShadow: theme.shadows[5],
    padding: theme.spacing.unit * 4
  }
});

class Contact extends React.Component {
  state = {
    Name: '',
    Company: '',
    Email: '',
    Message: '',
    NameError: false,
    CompanyError: false,
    EmailError: false,
    MessageError: false,
    modalOpen: false,
    snackBarOpen: false
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
          required
          error={this.state[label + 'Error']}
          placeholder={label}
          multiline={multiline}
          rows="5"
          margin="normal"
          value={this.state[label]}
          onChange={(event) => {this.setState({[label]: event.target.value})}}
          {...inputs.textField}
        />
      </Grid>
    )
  };

  contactHeadline() {
    return (
      <Grid item xs={12}>
        <Typography variant='headline' gutterBottom={true} align='left'>
          How can we help?
        </Typography>
        <Typography variant='subheading' align='left'>
          Fill out the form below and we'll get back to you shortly.
        </Typography>
      </Grid>
    )
  }

  validateInputs(successCallback = () => {console.log('success')}) {

    var setErrorState = {
      NameError: false,
      CompanyError: false,
      EmailError: false,
      MessageError: false,
      snackBarOpen: true
    }
    var blockSend = false;

    if ( this.state.Name == '') {
      setErrorState.NameError = true;
      blockSend = true;
    } else {
      setErrorState.NameError = false;
    }

    if (!validator.validate(this.state.Email)) {
      setErrorState.EmailError = true;
      blockSend = true;
    } else {
      setErrorState.EmailError = false;
    }

    if ( this.state.Company == '') {
      setErrorState.CompanyError = true;
      blockSend = true;
    } else {
      setErrorState.CompanyError = false;
    }

    if ( this.state.Message == '') {
      setErrorState.MessageError = true;
      blockSend = true;
    } else {
      setErrorState.MessageError = false;
    }

    this.setState(setErrorState)

    if (!blockSend) {
      successCallback()
    }

  }

  contactButton() {
    return (
      <Grid item xs={12} style={{
        paddingTop: 30,
      }}>
        <Grid container justify='flex-end' alignItems='center'>
          <Button variant='raised' color='secondary'
            onClick={() => {this.validateInputs( () => { 
              this.props.submitContactForm(this.state.Name, this.state.Company, this.state.Email, this.state.Message)
              this.setState({
                Name: '',
                Company: '',
                Email: '',
                Message: '',
                modalOpen: true
              })
            })}}
          >
            <Typography variant='title' style={{color: "white"}}>
              Submit
            </Typography>
          </Button>
        </Grid>
      </Grid>
    )
  }

  errorSnackBar() {

    const { classes } = this.props;

    return (
      <Snackbar
        anchorOrigin={{ 
          vertical: 'top', 
          horizontal: 'center' 
        }}
        open={this.state.snackBarOpen}
        autoHideDuration={5000}
        onClose={() => this.setState({snackBarOpen: false})}
        SnackbarContentProps={{
          'aria-describedby': 'message-id',
        }}
        message={<span id="message-id">We need a bit more information!</span>}
      />
    );
  
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
              Email us at inquiries@heep.io
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

  formSubmissionModal() {
    const { classes } = this.props;

    const inputs = {
      gridContainer: {
        style: {
          height: '100%',
          width: '100%',
          overflowX: 'hidden',
          outline: 'none',
          margin: 0
        }
      },
    };

    return (
      <Modal
        open={this.state.modalOpen}
        onClose={() => this.setState({ modalOpen: false })}>
        <Grid
          container {...inputs.gridContainer}
          justify='center'
          alignItems='center'
          onClick={() => this.setState({ modalOpen: false })}>
          <Grid item xs={12} sm={6} style={{maxHeight: '90%'}}>
            <div style={{position: 'relative'}} className={classes.paper}>
              Test test test
            </div>
          </Grid>
        </Grid>
      </Modal>
    )
  }


  render() {
    return(
      <div>
        <Grid container style={{
          margin: "0 auto",
          maxWidth: "100%",
          paddingTop: 40
        }}>
          {this.contactForm()}
          {this.contactDetails()}
        </Grid>
        {this.mapSection()}
        {this.formSubmissionModal()}
        {this.errorSnackBar()}
    </div>
    );
  }
}


function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)( withStyles(styles)(Contact)))
