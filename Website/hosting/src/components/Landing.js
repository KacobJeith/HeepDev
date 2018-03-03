import React from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import { withRouter } from 'react-router-dom'
import * as Actions from '../redux/actions'
import BedroomSVG from './BedroomSVG'
import SectionCard from './utilities/SectionCard'
import { Grid, Paper } from 'material-ui'
import { banners } from '../assets/remote/Banners'


const mapStateToProps = (state) => ({
})

class Landing extends React.Component {

  render() {
    const inputs = {
      banner: {
        paddingTop: 25,
        paddingBottom: 25,
        backgroundColor: '#00adee',
        imagePath: banners.testPhoto,
        containerHeight: 200,
        headerText: 'Heepify Your World',
      },

      bedroomContainer: {
        style: {
          maxWidth: '100%',
        }
      }
    }

	return (
    <div>
      <SectionCard {...inputs.banner} />
      <Grid container justify='center' {...inputs.bedroomContainer}>
        <Grid item xs={8}>
          <BedroomSVG />
        </Grid>
      </Grid>
    </div>
    );
  }
}



function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(Landing))
