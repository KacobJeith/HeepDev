import React                  from 'react'
import { bindActionCreators } from 'redux'
import { connect }            from 'react-redux'
import { withRouter }         from 'react-router-dom'

import { Grid }   from 'material-ui';

import * as Actions         from '../../redux/actions'

var mapStateToProps = (state) => ({
  collections: state.collections,
  products: state.shopify
})

class FeaturedItems extends React.Component {

  render() {
    return (
      <div>
        {console.log('WOO', this.props.collections)}
      </div>
    )
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(FeaturedItems))
