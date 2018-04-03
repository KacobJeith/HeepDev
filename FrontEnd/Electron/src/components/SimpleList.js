import React from 'react';
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { withRouter, NavLink } from 'react-router-dom'
import * as Actions from './../redux/actions_classic'

import PropTypes from 'prop-types';
import { withStyles } from 'material-ui/styles';
import ListSubheader from 'material-ui/List/ListSubheader';
import List, { ListItem, ListItemIcon, ListItemText } from 'material-ui/List';
import Collapse from 'material-ui/transitions/Collapse';
import { Refresh, Build, TrackChanges, Home } from 'material-ui-icons';

import { Divider } from 'material-ui'

var mapStateToProps = (state) => ({
  liveMode: state.liveModeReference
})

const styles = theme => ({
  root: {
    width: '100%',
    maxWidth: 360,
    backgroundColor: theme.palette.background.paper,
  },
  nested: {
    paddingLeft: theme.spacing.unit * 4,
  },
});

class NestedList extends React.Component {
  state = { open: true };

  handleClick = () => {
    this.setState({ open: !this.state.open });
  };

  refreshFlowchart = () => (
    <ListItem button>
      <ListItemIcon>
        <Refresh onClick={ () => this.props.refreshFlowchart()}/>
      </ListItemIcon>
      <ListItemText inset primary="Refresh" />
    </ListItem>
  )

  deviceBuilder = () => (
    <NavLink to="/designer" style={{
      textDecoration: 'none',
      outline: 'none'
    }}>
      <ListItem button>
        <ListItemIcon>
          <Build />
        </ListItemIcon>
        <ListItemText inset primary="Design" />
      </ListItem>
    </NavLink>
  )

  flowchartNav = () => (
    <NavLink to="/" style={{
      textDecoration: 'none',
      outline: 'none'
    }}>
      <ListItem button>
        <ListItemIcon>
          <Home />
        </ListItemIcon>
        <ListItemText inset primary="Home" />
      </ListItem>
    </NavLink>
  )

  liveModeToggle = () => (
    <ListItem button onClick={ () => this.props.liveMode == null ? this.props.startLiveMode() : this.props.stopLiveMode()}>
      <ListItemIcon>
        <TrackChanges color={this.props.liveMode == null ? 'disabled' : 'secondary'}/>
      </ListItemIcon>
      <ListItemText inset primary="Live Mode" />
    </ListItem>
  )

  render() {
    const { classes } = this.props;

    return (
      <div className={classes.root}>
        <List
          component="nav"
        >
          {this.flowchartNav()}
          {this.deviceBuilder()}
          <Divider/>
          {this.liveModeToggle()}
          {this.refreshFlowchart()}
          
        
        </List>
      </div>
    );
  }
}

NestedList.propTypes = {
  classes: PropTypes.object.isRequired,
};

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(withStyles(styles)(NestedList)))
