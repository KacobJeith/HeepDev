import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { withRouter } from 'react-router-dom'
import * as actions from '../redux/actions'
import {Grid, Row, Col, Image, PageHeader, Media, Button} from 'react-bootstrap'

var mapStateToProps = (state, ownProps) => ({
  place: state.places[ownProps.placeID]
})

class PlaceCard extends React.Component {

  render() {

    var inputs = {
      section: {
        key: this.props.place.placeID,
        style: {
          marginTop: 10
        }
      },
      linkButton: {
        bsStyle: "primary",
        bsSize: "small",
        onClick: () => {}
      },
      image: {
        width: 64,
        height: 64,
        src: "https://www.misskatecuttables.com/uploads/shopping_cart/7903/med_house.png", 
        alt: "PlacePic" 
      }
    }
    
    return (
<Row {...inputs.section}>
  <Col xsOffset={1}>
    <Media >
     <Media.Left>
        <img {...inputs.image}/>
      </Media.Left>
      <Media.Body>
        <h1><small>{this.props.place.placeID}</small></h1>
      </Media.Body>
    </Media>
  </Col>
</Row>);

  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(PlaceCard))

