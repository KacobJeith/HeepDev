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
      welcome: {
        backgroundColor: '#00adee',
        header: 'Welcome to Heep',
        message: 'a connectivity driven ecosystem',
        image: '../src/assets/relay.png'
      },
      coreValue: {
        backgroundColor: '#00f9d1',
        header: 'Distributed Intelligence',
        message: 'Heep\'s distributed intelligence enables us to build you smarter, more affordable, more reliable, more intuitive connected things.',
        image: '../src/assets/relay.png'
      },
      distribution: {
        backgroundColor: '#ffd400',
        header: 'Welcome to Heep',
        message: 'Heep designs using distribution over centralization. In the context of applications such as Smart Homes, Heep solutions operate local-first, leveraging the cloud only when necessary and/or desired. This means that Heep devices respond faster, and are more secure than other platforms.',        
        image: '../src/assets/relay.png'
      },
      openSource: {
        backgroundColor: '#ffd400',
        header: 'Heep <3 Open Source',
        message: 'Heep supports and promotes connectivity-driven Open Source projects. Contact us to feature your project here. ',        
        image: '../src/assets/relay.png'
      },
      human: {
        backgroundColor: '#00adee',
        header: 'We are humans.',
        message: 'We should be able to interact as humans. Heep connected products use voice, tactile, and physical interfaces so that we can live in a connected world built for humans, not robots.',
        image: '../src/assets/relay.png'
      }
    }

  return (<div> 
            <div {...inputs.container}> 
                <MessageCard {...inputs.welcome}/>
                <MessageCard {...inputs.coreValue}/>
                <MessageCard {...inputs.openSource}/>
                <MessageCard {...inputs.human}/>
            </div>
          </div>
    );
  }
}


function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(Mission))
