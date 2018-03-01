import React from "react";

import { withStyles } from "material-ui/styles";
import { Typography,
         Modal,
         Button,
         Grid } from 'material-ui'

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

  nameSubheading() {
    return (
      <Typography variant="subheading" align='center' color="inherit">
          {this.props.name}
      </Typography>
    )
  };

  nameTitle() {
    return (
      <Typography variant="title" align="center" color="inherit">
        {this.props.name}
      </Typography>
    )
  };

  buttonImage() {
    const inputs = {
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
    }

    return (
      <div {...inputs.buttonContainer}>
        <Button onClick={this.handleOpen}>
          <img {...inputs.buttonImage}/>
        </Button>
      </div>
    )
  };

  modalImage() {
    const inputs = {
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
      },
    }

    return (
      <div {...inputs.modalImageContainer}>
        <img {...inputs.modalImage}/>
      </div>
    )
  };

  render() {
    const { classes } = this.props;

    const inputs = {
      modalPosition: {
        style: {
          top: '50%',
          left: '50%',
          transform: 'translate(-50%, -50%)'
        }
      },
    };

    return (
      <div>
        {this.buttonImage()}
        {this.nameSubheading()}
        <Modal
          open={this.state.open}
          onClose={this.handleClose}>
          <div {...inputs.modalPosition} className={classes.paper}>
            {this.nameTitle()}
            {this.modalImage()}
            {this.bioText(this.props.desc1)}
            {this.bioText(this.props.desc2)}
          </div>
        </Modal>
      </div>
    );
  }
}

export default withStyles(styles)(TeamModal);
