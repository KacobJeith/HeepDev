import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import Flowchart from '../components/Flowchart'
import * as Actions from '../actions/actions'

const mapStateToProps = (state) => ({
  clientArray: state.clients.clientArray,
  vertexPaths: state.vertexList,
  url: state.url
})

function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(Flowchart)