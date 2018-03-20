import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions_designer'

import GenericSVG from './GenericSVG'

var mapStateToProps = (state, ownProps) => ({
	selected: state.designer.iconSelected == ownProps.iconID,
	actualSelected: state.designer.iconSelected,
	iconID: ownProps.iconID,
  	icon: ownProps.iconName
})

class IconSelectWrapper extends React.Component {

	constructor(props) {
		super(props);

		this.state = {
			hover: false
		}
	}

	render() {

		var inputs = {
			container: {
				style: {
					backgroundColor: this.props.actualSelected == parseInt(this.props.iconID) ? "#00FEA4" : (this.state.hover ? "#E6E6E6" : "white"),
					cursor: "pointer",
					margin: 5,
					height: 100,
					width: 100
				},
				onMouseEnter: () => {this.setState({hover: true})},
				onMouseLeave: () => {this.setState({hover: false})},
				onClick: () => {console.log("clicked: ", this.props.icon); this.props.selectIcon(this.props.iconID)}
			},
			svg: {
				height: 100,
				width: 100,
				iconName: this.props.icon
			}
		}

		return (<div {...inputs.container}> 
					<GenericSVG {...inputs.svg}/> 
				</div>)
	}
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(IconSelectWrapper);
