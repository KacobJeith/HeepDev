import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import App from '../components/app'
import * as Actions from '../actions/actions'

const mapStateToProps = (state) => ({
})

function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(App)
