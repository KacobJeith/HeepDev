import React from 'react';

import { connect }            from 'react-redux'
import { bindActionCreators } from 'redux'
import { withRouter }         from 'react-router-dom'
import * as actions           from '../../redux/actions'

import { withTheme } from 'material-ui/styles';
import { Drawer, Button, List, Divider } from 'material-ui';

var mapStateToProps = (state) => ({
  deviceID:  state.detailsPanelDeviceID,
  device: state.devices[state.detailsPanelDeviceID]
})

class DeviceDetailsPanel extends React.Component {
  state = {
    right: false,
  };

  toggleDrawer = (side, open) => () => {
    this.setState({
      [side]: open,
    });
  };

  render() {
    return (
      <div>
        <Button onClick={this.toggleDrawer('right', !this.state.right)}>Open Right</Button>
        
        <Drawer anchor="right" variant='permanent' open={this.state.right}>
            <div style={{width: this.state.right ? 250 : 0}}/>
        </Drawer>
      </div>
    );
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(withTheme()(DeviceDetailsPanel)))