import React from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import { withRouter } from 'react-router-dom'
import * as Actions from '../../redux/actions'

import { Grid, Paper, Typography } from 'material-ui'

import SectionCard from '../utilities/SectionCard'
import CollectionPreview from '../utilities/CollectionPreview'
import { banners } from '../../assets/remote/Banners'


var mapStateToProps = (state) => ({
});

class LandingIIOT extends React.Component {

  topBanner() {
    const inputs = {
      paddingTop: 25,
      paddingBottom: 25,
      backgroundColor: '#00adee',
      imagePath: banners.testPhoto,
      minHeight: 200,
    };

    return (
      SectionCard(inputs,
        <Grid container justify ='center' alignItems ='center' style={{
          maxWidth: '100%',
          minHeight: inputs.minHeight,
          margin: '0 auto'
        }}>
          <Grid item xs={12} sm={8}>
            <Typography variant='display1' align='center'>
              Heepify Your World
            </Typography>
          </Grid>
        </Grid>
      )
    )
  };

  iiotCollection() {

    return(
      <CollectionPreview collectionName='Industrial Automation'/>
    )
  }


  render() {

  	return (
      <div>
        {this.topBanner()}
        {this.iiotCollection()}
      </div>
      );
  }
}



function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(LandingIIOT))
