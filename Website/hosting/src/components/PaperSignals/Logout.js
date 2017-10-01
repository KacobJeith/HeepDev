import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions'

var mapStateToProps = (state, ownProps) => ({
})

class Logout extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      hover: false,
    }
  }

  render() {

    const styles = {
        addCard : {
          height: 300,
          width: 300,
          backgroundColor: "darkGray", 
          color: "white",
          display: "flex",
          flexDirection: "row",
          marginTop: 25,
          marginLeft: 25,
          fontSize: 40,
          alignItems: "center",
          justifyContent: "center",
          cursor: "pointer",
          boxShadow: this.state.hover ? "5px 5px 5px #555" : "" 
        }
      };

    const inputs = {
      addCard: {
        style: styles.addCard,
        onClick: () => {this.props.logout()},
        onMouseEnter: () => this.setState({hover: true}),
        onMouseLeave: () => this.setState({hover: false}),
        key: "add"
      }
    }

    return (<div {...inputs.addCard}> 
                Logout
            </div>
    );
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(Logout)