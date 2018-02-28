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
    width: theme.spacing.unit * 80,
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

  render() {
    const { classes } = this.props;

    return (
      <div>
        <div style={{textAlign: 'center'}}>
          <Button onClick={this.handleOpen}>
            <img
              src={this.props.imagePath}
              style={{
                maxWidth:'75%',
              }}
            />
          </Button>
        </div>

        <Typography variant="subheading" align='center' color="inherit">
            {this.props.name}
        </Typography>

        <Modal
          open={this.state.open}
          onClose={this.handleClose}
        >
          <div style={{
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
          }} className={classes.paper}>
            <Typography variant="title" id="modal-title" align="center" color="inherit">
              {this.props.name}
            </Typography>
            <div style={{
              paddingTop: 16,
              textAlign:'center'
            }}>
              <img
                src={this.props.imagePath}
                style={{
                  maxWidth:'100%',
                }}/>
            </div>
            <Typography style={{
                paddingTop: 16
              }} variant="subheading" color="inherit">
                {this.props.desc1}
            </Typography>
            <Typography style={{
                paddingTop: 16
              }} variant="subheading" color="inherit">
                {this.props.desc2}
            </Typography>
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
