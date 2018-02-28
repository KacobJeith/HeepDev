import React from 'react'
import {findDOMNode} from 'react-dom'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import { withRouter } from 'react-router-dom'
import * as Actions from '../redux/actions'
import { LinkContainer } from 'react-router-bootstrap'

const mapStateToProps = (state, ownProps) => ({
  scrollPosition: state.scrollPosition,
  message: ownProps.message,
  backgroundColor: ownProps.backgroundColor,
  imagepath: ownProps.image
})

class MessageCard extends React.Component {
  constructor() {
    super()
    this.state = {}
    this.image = {top: window.innerHeight*0.6}
  }

  componentDidUpdate() {
    // this.image = findDOMNode(this.refs.image).getBoundingClientRect();
  }

  calculateParallax() {

    var elementHeight = window.innerHeight*0.4;
    var ratio = (0.6 - (window.innerHeight - this.image.top)/window.innerHeight);
    var newval =  ratio*elementHeight/2 - elementHeight/2;
    return newval
  }


  render() {

  	var inputs = {
      container: {
        style: {
          width: '100%',
          position: 'relative',
          backgroundColor: this.props.backgroundColor,
          height: window.innerHeight*0.6
        }
      },
      textCard: {
        style: {
          width: '100%',
          position: 'relative',
          backgroundColor: this.props.backgroundColor,
          height: window.innerHeight*0.6
        }
      },
  		header: {
  			style: {
          display: 'block',
          position: 'absolute',
          top:'50%',
          left:'50%',
          bottom:'auto',
          right:'auto',
          transform: 'translate(-50%,-50%)',
          verticalAlign: 'middle',
          textAlign: 'center',
          color: '.secondary',
          font: '400 22px/45px Roboto,sans-serif',
        }
  		},
      headerText: {
        font: '400 40px/90px Roboto,sans-serif'
      },
      imageCard: {
        style: {
          backgroundImage: `url(${this.props.imagepath})`,
          height:  window.innerHeight*0.4,
          backgroundSize: 'cover',
          backgroundPositionY: this.calculateParallax()
        }
      }
  	}

	return (<div {...inputs.container}>
            <div {...inputs.messageCard}>
              <div {...inputs.header}>
                <h1 > {this.props.header}</h1>
                <small > {this.props.message} </small>
              </div>
            </div>
          </div>
    );
  }
}


function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(MessageCard))
