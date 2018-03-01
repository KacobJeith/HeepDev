import React from 'react';

import { withStyles } from 'material-ui/styles';
import Paper from 'material-ui/Paper';
import Typography from 'material-ui/Typography';
import Grid from 'material-ui/Grid';

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
  }

  render() {

    const { classes } = this.props;

    return (
      <Paper className={classes.root}>
        <div style={{textAlign: 'center'}}>
          <img
            src={this.props.imagePath}
            style={{
              maxWidth:'75%',
              maxHeight: '75%'
            }}
          />
        </div>
        <Typography style={{paddingTop: 16}}
          variant="headline" component="headline"
          align="center" color='inherit'>
            {this.props.title}
        </Typography>
        <Typography style={{paddingTop: 16}}
          component="p" align="center" color='inherit'>
            {this.props.desc}
        </Typography>
      </Paper>

    )
  }
}

export default withStyles(styles)(AboutCard)
