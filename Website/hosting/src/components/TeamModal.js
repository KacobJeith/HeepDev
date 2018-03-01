import React from "react";
import PropTypes from "prop-types";

import { withStyles } from "material-ui/styles";
import Typography from "material-ui/Typography";
import Modal from "material-ui/Modal";
import Button from "material-ui/Button";
import Grid from 'material-ui/Grid';

const styles = theme => ({
  paper: {
    position: "absolute",
    backgroundColor: theme.palette.background.paper,
    boxShadow: theme.shadows[5],
    padding: theme.spacing.unit * 4
  }
});

class TeamModal extends React.Component {
  state = {
    open: false
  };

  handleOpen = () => {
    this.setState({ open: true });
  };

  handleClose = () => {
    this.setState({ open: false });
  };

  bioText(bioText) {
    return (
      <Typography style={{
          paddingTop: 16
        }} variant="subheading" color="inherit">
          {bioText}
      </Typography>
    )
  };

  nameSubheading(nameSubheading) {
    return (
      <Typography variant="subheading" align='center' color="inherit">
          {nameSubheading}
      </Typography>
    )
  };

  nameTitle(nameTitle) {
    return (
      <Typography variant="title" align="center" color="inherit">
        {nameTitle}
      </Typography>
    )
  };

  render() {
    const { classes } = this.props;

    var inputs = {
      buttonContainer: {
        style: {
          textAlign: 'center'
        }
      },
      buttonImage: {
        src: this.props.imagePath,
        style: {
          maxWidth: this.props.imageButtonWidth,
        }
      },
      modalPosition: {
        style: {
          top: '50%',
          left: '50%',
          transform: 'translate(-50%, -50%)'
        }
      },
      modalImageContainer: {
        style: {
          paddingTop: 16,
          textAlign: 'center'
        }
      },
      modalImage: {
        src: this.props.imagePath,
        style: {
          maxWidth: '100%'
        }
      }
    };

    return (
      <div>
        <div {...inputs.buttonContainer}>
          <Button onClick={this.handleOpen}>
            <img {...inputs.buttonImage}/>
          </Button>
        </div>
        {this.nameSubheading(this.props.name)}
        <Modal
          open={this.state.open}
          onClose={this.handleClose}
        >
          <div {...inputs.modalPosition} className={classes.paper}>
            {this.nameTitle(this.props.name)}
            <div {...inputs.modalImageContainer}>
              <img {...inputs.modalImage}/>
            </div>
            {this.bioText(this.props.desc1)}
            {this.bioText(this.props.desc2)}
          </div>
        </Modal>
      </div>
    );
  }
}

TeamModal.propTypes = {
  classes: PropTypes.object.isRequired
};

export default withStyles(styles)(TeamModal);
