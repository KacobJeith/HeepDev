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
        headerText: 'Connect your world with Heep.',
        subText: 'Heep was founded in February 2017 with the dream of ubiquitous connectivity. We thought long and hard about what the world needs to make that happen. Thus, the Heep operating system was born. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum'
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
