import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import VertexList from '../components/Vertex'
import * as Actions from '../actions/actions'

const mapStateToProps = (state) => ({
  vertexList: state.vertexList,
  url: state.url
})

function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(VertexList)
