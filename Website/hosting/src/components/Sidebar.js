import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../redux/actions'
import { NavLink, withRouter } from 'react-router-dom';

var mapStateToProps = (state) => ({
})

class Sidebar extends React.Component {

  render () {

    var styles = {
      sidebar: {
        //fontSize: 13,
        overflow: "auto",
        position: "fixed",
        height: "100%",
        width: 250,
        top: 0,
        left: 0,
        bottom: 0,
        display: "block",
        backgroundColor: "#111",
        fontFamily: "-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Oxygen-Sans,Ubuntu,Cantarell,Helvetica Neue,sans-serif"
      },
      links: {
        padding: '8px 8px 8px 32px',
        textDecoration: 'none',
        //fontSize: 25,
        color: '#818181',
        display: 'block',
      },
      spacer: {
        height: 70
      },
      active: {
        fontWeight: 'bold',
        color: "white"
      }
    }

    var inputs = {
      sidebar: {
        style: styles.sidebar
      },
      home: {
        style: styles.links,
        activeStyle: styles.active,
        to: "/signals"
      },
      store: {
        style: styles.links,
        activeStyle: styles.active,
        to: "/store"
      },
      build: {
        style: styles.links,
        activeStyle: styles.active,
        to: "/build"
      },
      spacer: {
        style: styles.spacer
      },
      blank: {
        style: styles.links,
        to: "/"
      }
    }


    return (
      <div {...inputs.sidebar}>
        <div {...inputs.spacer}/>
        <NavLink {...inputs.store}>Shop</NavLink>
        <NavLink {...inputs.build}>Build</NavLink>
        <NavLink {...inputs.blank}>Learn</NavLink>
        <NavLink {...inputs.blank}>Join</NavLink>
     </div>
    );
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(Sidebar))
