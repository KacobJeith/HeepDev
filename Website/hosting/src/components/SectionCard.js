import React from 'react';
import Typography from 'material-ui/Typography';
import Grid from 'material-ui/Grid';

class SectionCard extends React.Component {

  constructor() {
    super()
  }

  render() {
    return (
      <Grid container
        style={{
          height: window.innerHeight*this.props.cardHeight,
          backgroundImage: `url(${this.props.imagePath})`,
          backgroundSize: '100%',
          backgroundColor: this.props.backgroundColor,
          maxWidth: '100%',
          margin: 0
        }} direction='column' justify='center'>
        <Grid container item spacing={0} justify="center" >
          <Grid item xs={8}>
            <Typography variant="headline" align="center" color='inherit'>
              {this.props.headerText}
            </Typography>
            <Typography style={{
              paddingTop: 10,
            }} component="p" align="center" color='inherit'>
              {this.props.subText}
            </Typography>
            {this.props.otherContent}
          </Grid>
        </Grid>
      </Grid>
    )
  }
}

export default SectionCard
