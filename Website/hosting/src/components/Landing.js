import React from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import { withRouter } from 'react-router-dom'
import * as Actions from '../redux/actions'

import { Grid, Paper } from 'material-ui'

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
      banner: {
        paddingTop: 25,
        paddingBottom: 25,
        backgroundColor: '#00adee',
        imagePath: banners.testPhoto,
        containerHeight: 200,
        headerText: 'Heepify Your World',
      },
    };
    return (
      <SectionCard {...inputs.banner} />
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
    if (typeof this.props.collections['featuredItems'] !== 'undefined') {
      return (
        <Grid container justify='center' spacing={2}>
          {Object.keys(this.props.collections['featuredItems'].products).map((key, index) => {
            if (key != 'type') {
              return (
                <Grid item xs={2.5}>
                  <FeaturedItems key={key} productIndex={index}/>
                </Grid>
              )
            }
          })}
        </Grid>
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
