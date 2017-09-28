import React from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import { withRouter } from 'react-router-dom'
import * as Actions from '../redux/actions'
import MessageCard from './MessageCard'

const mapStateToProps = (state) => ({
})


class Mission extends React.Component {
  
  render() {

  	var inputs = {
  		container: {
  			style: {
          display: 'flex',
          backgroundColor: '#21ea94',
          flexDirection: 'column'
        }
  		},
      card1: {
        backgroundColor: '#00adee',
        message: 'Heep makes things easy',
        image: '../src/assets/relay.png'
      },
      card2: {
        backgroundColor: '#00f9d1',
        message: 'Secure, yet accessible to you',
        image: '../src/assets/relay.png'
      },
      card3: {
        backgroundColor: '#ffd400',
        message: 'Possible, in ways we don\'t yet know how to value',        
        image: '../src/assets/relay.png'
      }
    }

	return (<div> 
            <div {...inputs.container}> 
                <MessageCard {...inputs.card1}/>
                <MessageCard {...inputs.card2}/>
                <MessageCard {...inputs.card3}/>
            </div>
          </div>
    );
  }
}


function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(Mission))
