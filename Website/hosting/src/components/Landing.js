import React from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import { withRouter } from 'react-router-dom'
import * as Actions from '../redux/actions'
import BedroomSVG from './BedroomSVG'

const mapStateToProps = (state) => ({
})


class Landing extends React.Component {

  render() {

  	var styles = {
  		container: {
        display: 'flex',
        backgroundColor: '#21ea94',
        flexDirection: 'column'
  		}
  	}

  	var inputs = {
  		container: {
  			style: styles.container
  		},
      card1: {
        message: 'Discover your world',
        image: '../src/assets/relay.png'
      },
      card2: {
        message: 'Testing 2',
        image: '../src/assets/relay.png'
      },
      objectSVG: {
        width: '100%',
        height: '100%',
        type: 'image/svg+xml',
        data: '../src/assets/Bedroom.svg'
  	   }
     }

	return (<div>
            <BedroomSVG />
          </div>
    );
  }
}



function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(Landing))
