import React from 'react';
import Typography from 'material-ui/Typography';
import Grid from 'material-ui/Grid';

class SectionCard extends React.Component {

  headerText(headerText) {
    return (
      <Typography variant="headline" align="center" color='inherit'>
        {headerText}
      </Typography>
    )
  }

  subText(subText) {
    return (
      <Typography style={{paddingTop: 10}} component="p" align="center" color='inherit'>
        {subText}
      </Typography>
    )
  }

  render() {

    var inputs = {
      outerContainer: {
        style: {
          backgroundImage: this.props.backgroundImage,
          backgroundSize: 'cover',
          backgroundColor: this.props.backgroundColor,
          maxWidth: '100%',
          paddingTop: this.props.paddingTop,
          paddingBottom: this.props.paddingBottom,
          margin: 0
        }
      }
    }

    return (
      <Grid {...inputs.outerContainer} container direction='column' justify='center'>
        <Grid container item spacing={0} justify="center" >
          <Grid item xs={8}>
            {this.headerText(this.props.headerText)}
            {this.subText(this.props.subText)}
          </Grid>
        </Grid>
      </Grid>
    )
  }
}

export default SectionCard
