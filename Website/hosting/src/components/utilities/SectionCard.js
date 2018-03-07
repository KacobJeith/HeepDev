import React from 'react';
import { Typography, Grid } from 'material-ui'

class SectionCard extends React.Component {

  headerText() {
    return (
      <Typography variant="headline" align="center">
        {this.props.headerText}
      </Typography>
    )
  };

  subText() {
    return (
      <Typography style={{paddingTop: 10}} variant="subheading" align="center">
        {this.props.subText}
      </Typography>
    )
  };

  render() {

    const inputs = {
      outerContainer: {
        style: {
          backgroundColor: this.props.backgroundColor,
          backgroundImage: `url(${this.props.imagePath})`,
          backgroundRepeat: 'no-repeat',
          backgroundSize:'cover',
          minHeight: this.props.containerHeight,
          maxWidth: '100%',
          paddingTop: this.props.paddingTop,
          paddingBottom: this.props.paddingBottom,
          margin: 0
        }
      }
    }

    return (
      <Grid container {...inputs.outerContainer} direction ='column' justify="center" alignItems="center">
        <Grid item xs={8}>
          {this.headerText()}
          {this.subText()}
        </Grid>
      </Grid>
    )
  }
}

export default SectionCard
