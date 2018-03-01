import React from "react";
import PropTypes from "prop-types";

import {  withStyles } from "material-ui/styles";
import {  Typography,
          Modal,
          Grid,
          Button,
          ListItem,
          ListItemIcon,
          ListItemText } from "material-ui";
import { Add }  from 'material-ui-icons'

import VerticalStepper from '../utilities/VerticalStepper'

const styles = theme => ({
  paper: {
    position: "absolute",
    backgroundColor: theme.palette.background.paper,
    boxShadow: theme.shadows[5],
    padding: theme.spacing.unit * 4,
    minWidth: 500,
    top: '50%',
    left: '50%',
    transform: 'translate(-50%, -50%)'
  }
});

class AddPlaceModal extends React.Component {
  state = {
    open: false
  };

  handleOpen = () => {
    this.setState({ open: true });
  };

  handleClose = () => {
    this.setState({ open: false });
  };

  addPlaceListButton() {

    return (
      <ListItem button color='secondary' onClick={()=> this.setState({open: true})}>
        <ListItemIcon>
          <Add/>
        </ListItemIcon>
        <ListItemText inset secondary='Add a New Place' />
      </ListItem>
    )
  }

  modalTitle() {
    return (
      <Typography variant="title" align='center' color="inherit">
          Create a New Place
      </Typography>
    )
  };

  createPlaceForm() {

    const inputs = {
      stepper: {
        steps: [
          {
            title: 'Create a new place',
            description: `Let's create a new place for you. What would you like to name this place?`
          },
          {
            title: 'How should Heep talk when on this network?',
            description: `Not all places have the same network topology. Save your wifi credentials to 
                          your place, and all future Heep Devices will be automatically logged in to your
                          network - it has never been so easy to install a new device!`
          },
          {
            title: 'Associate devices with this place',
            description: `Now that we have your place set up, are there any devices you would like to add?`
          },
          {
            title:'Invite friends & Family',
            description: `Share this network with close friends and family - people you trust. They will be 
                          able to purchase new Heep devices for this place, and bring their own devices seamlessly
                          into this network.`
          }
        ]
      }
    }

    return (
      <div>
        {this.modalTitle()}
        <VerticalStepper {...inputs.stepper}/>
      </div>
    )
  }

  render() {
    const { classes } = this.props;

    return (
      <div>
        {this.addPlaceListButton()}
        <Modal
          open={this.state.open}
          onClose={this.handleClose}>
          <div className={classes.paper}>
            {this.createPlaceForm()}
          </div>
        </Modal>
      </div>
    );
  }
}

AddPlaceModal.propTypes = {
  classes: PropTypes.object.isRequired
};

export default withStyles(styles)(AddPlaceModal);
