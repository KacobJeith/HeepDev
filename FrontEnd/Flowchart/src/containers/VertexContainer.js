import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import Vertex from '../components/Vertex'
import * as Actions from '../actions/actions'

const mapStateToProps = (state) => ({
  url: state.url
})

function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(Vertex)
