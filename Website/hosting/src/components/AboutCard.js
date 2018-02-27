import React from 'react';
import { withStyles } from 'material-ui/styles';
import Paper from 'material-ui/Paper';
import Typography from 'material-ui/Typography';
import Grid from 'material-ui/Grid';

const mapStateToProps = (state, ownProps) => ({
})

const styles = theme => ({
  root: theme.mixins.gutters({
    paddingTop: 16,
    paddingBottom: 16,
    marginTop: theme.spacing.unit * 3,
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
              src={this.props.path}
              alt={this.props.alt}
              style={{
                maxHeight: 500,
                maxWidth:'100%',
              }}
            />
          </Grid>
        </Grid>
        <br/>
        <Typography variant="headline" variant="headline" align="center">
          {this.props.title}
        </Typography>
        <br/>
        <Typography component="p" align="center">
          {this.props.description}
        </Typography>
      </Paper>
    )
  }
}

export default withStyles(styles)(AboutCard)
