import React from 'react';

import { withStyles } from 'material-ui/styles';

import { Paper, Typography, Grid } from 'material-ui';

const styles = theme => ({
  root: theme.mixins.gutters({
    paddingTop: 16,
    paddingBottom: 16,
    marginBottom: theme.spacing.unit * 3,
  }),
});

class AboutCard extends React.Component {
  constructor(props) {
    super(props);
  };

  imageAbout() {
    const inputs = {
      imageContainer: {
        style: {
          textAlign: 'center'
        }
      },
      imageAbout: {
        src: this.props.imagePath,
        style: {
          maxWidth: '75%',
          maxHeight: '75%',
        }
      },
    };

    return(
      <div {...inputs.imageContainer}>
        <img {...inputs.imageAbout}/>
      </div>
    )
  };

  titleAbout() {
    return (
      <Typography style={{paddingTop: 16}}
        variant="headline" component="headline"
        align="center" color='inherit'>
          {this.props.title}
      </Typography>
    )
  };

  descAbout() {
    return (
      <Typography style={{paddingTop: 16}}
        component="p" align="center" color='inherit'>
          {this.props.desc}
      </Typography>
    )
  };

  render() {
    const { classes } = this.props;

    return (
      <Paper className={classes.root}>
        {this.imageAbout()}
        {this.titleAbout()}
        {this.descAbout()}
      </Paper>

    )
  }
}

export default withStyles(styles)(AboutCard)
