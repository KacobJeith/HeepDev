import React from 'react';
import ClientInputList from './ClientInput';

class ClientGraphic extends React.Component {
	constructor() {
		super();
		this.state = {
			radius: 5
		}
	}

	render() {
		const styles = {
			clientContainer: {
				backgroundColor: 'black',
				margin: 15,
				width: 200,
				height: 200,
				display: 'inline-block',
				color: 'white'
			},
			svgContainer: {
				display: 'absolute'
			}
		}

		const inputs = {
			clientContainer: {
				style: styles.clientContainer
			},
			svgContainer: {
				style: styles.svgContainer
			},
			clientInput:{
				controlList: this.props.client['ControlList']
			},
			svg: {
				width: "100",
				height: "100",
				viewBox: "0 0 120 120"
			},
			rect: {
				x: "10",
				y: "10",
				width: "100",
				height: "100",
				rx: "15",
				ry: "15",
				fill: "blue",
			},
			circle: {
				onClick: () => console.log("click!"),
				onMouseEnter: () => this.setState({radius: 8}),
				onMouseLeave: () => this.setState({radius: 5}),
				cx: "50%",
				cy: "10%",
				r: this.state.radius,
				fill: "green"
			}
		}

		console.log(this.props.client);
		return (<div {...inputs.clientContainer}> 
					<p>{this.props.client['ClientName']}</p>
					<div {...inputs.svgContainer}>
						<svg {...inputs.svg}>
							  <rect {...inputs.rect}/>
							  <circle {...inputs.circle}/>
						</svg>
					</div>
				</div>
			);
	}
}

export default ClientGraphic;