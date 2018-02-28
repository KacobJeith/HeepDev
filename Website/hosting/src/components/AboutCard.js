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
        <Grid container justify='center'>
          <Grid item xs={10}>
            <img
              src={this.props.imagePath}
              alt={this.props.alt}
              style={{
                maxHeight: 500,
                maxWidth:'100%',
              }}
            />
          </Grid>
        </Grid>
        <div style={{
          paddingTop: 16,
        }}>
          <Typography variant="headline" variant="headline"
            align="center" color='inherit'>
              {this.props.title}
          </Typography>
          <Typography style={{
            paddingTop: 16
            }} component="p" align="center" color='inherit'>
              {this.props.desc}
          </Typography>
        </div>
      </Paper>

    )
  }
}

export default withStyles(styles)(AboutCard)
