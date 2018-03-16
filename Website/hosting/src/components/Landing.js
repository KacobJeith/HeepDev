import React from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import { withRouter } from 'react-router-dom'
import * as Actions from '../redux/actions'

import { Grid, Paper, Typography } from 'material-ui'

import BedroomSVG from './BedroomSVG'
import SectionCard from './utilities/SectionCard'
import FeaturedItems from './landing/FeaturedItems'
import { banners } from '../assets/remote/Banners'


var mapStateToProps = (state) => ({
  collections: state.collections
});

class Landing extends React.Component {

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
          minHeight: inputs.minHeight
        }}>
          <Grid item>
            <Typography variant='display2'>
              Heepify Your World
            </Typography>
          </Grid>
        </Grid>
      )
    )
  };

  bedroomSVG() {
    const inputs = {
      bedroomContainer: {
        style: {
          maxWidth: '100%',
        },
      },
    };
    return (
      <Grid container justify='center' {...inputs.bedroomContainer}>
        <Grid item xs={8}>
          <BedroomSVG />
        </Grid>
      </Grid>
    )
  };

  featuredItems() {

    const inputs = {
      section: {
        backgroundColor: '#00adee',
        paddingTop: 30,
        paddingBottom: 30,
      },
      header: {
        paddingBottom: 30,
        paddingLeft: 30,
        fontWeight: 'bold',
      }
    };

    if (typeof this.props.collections['featuredItems'] !== 'undefined') {
      return (
        SectionCard(inputs.section,
          <div>
            <div>
              <Typography variant='display1'
                style={{...inputs.header}}>
                FEATURED COLLECTION
              </Typography>
            </div>
            <Grid container style={{maxWidth: '100%'}} justify ='center'>
              {Object.keys(this.props.collections['featuredItems'].products).map((key, index) => {
                if (key != 'type') {
                  return (
                    <Grid item xs= {5} md={2} key={key}>
                      <FeaturedItems key={key} productIndex={index}/>
                    </Grid>
                  )
                }
              })}
            </Grid>
          </div>
        )
      )
    }
  };

  render() {

  	return (
      <div>
        {this.topBanner()}
        {this.bedroomSVG()}
        {this.featuredItems()}
      </div>
      );
  }
}



function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(Landing))
