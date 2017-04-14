import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import Flowchart from '../components/Flowchart'
import 'babel-polyfill'
import * as Actions from '../redux/actions'

const mapStateToProps = (state) => ({
  clientArray: state.clients.clientArray,
  url: state.url
})

function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(Flowchart)