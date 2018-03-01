import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { withRouter } from 'react-router-dom'
import * as actions from '../../redux/actions'
import { List,
         ListItem, 
         ListItemText, 
         ListItemIcon, 
         ListItemSecondaryAction, 
         IconButton,
         Divider,
         Collapse }                 from 'material-ui'
import { withTheme }                from 'material-ui/styles'
import {  ExpandLess, 
          ExpandMore, 
          Redo,
          Undo,
          LinearScale,
          PowerSettingsNew }   from 'material-ui-icons'

var mapStateToProps = (state, ownProps) => ({
  device: state.devices[ownProps.deviceID]
})

class DeviceCard extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      hover: false,
      view: false
    }
  }

  displayDeviceControls() {

    var inputs = {
      nested: {
        style: { 
          paddingLeft: this.props.theme.spacing.unit * 12,
        }
      }
      
    }

    return (
      <Collapse in={this.state.view} timeout="auto" unmountOnExit>
        <div>
          {this.props.device.controls.map((thisControl) => {

            return(
             <List disablePadding key={this.props.deviceID + thisControl.controlName}>
               <ListItem  {...inputs.nested}>
                 <ListItemIcon>
                   {thisControl.controlDirection == 0 ? <Redo /> : <Undo/>}
                 </ListItemIcon>
                 <ListItemIcon>
                   {thisControl.controlType == 1 ?  <LinearScale/> : <PowerSettingsNew /> }
                 </ListItemIcon>
                 <ListItemText inset secondary={thisControl.controlName} />
               </ListItem>
             </List>
             )
          })}
        </div>
      </Collapse>
    )
  }

  render() {

    var iconName = this.props.device.identity.iconName;
    var name = (iconName == 'light_on' ? 'lightbulb' : iconName);

    var inputs = {
      item: {
        button: true,
        onClick: () => this.setState({view: !this.state.view}),
        onMouseEnter: () => this.setState({hover: true}),
        onMouseLeave: () => this.setState({hover: false}),
        style: {
          backgroundColor: this.state.hover ?  this.props.theme.palette.background.paper : 'transparent'
        }
      },
      primary: {
        style: {
          maxHeight: '100%',
          maxWidth: '100%'
        },
        type:"image/svg+xml",
        data: "../src/assets/svg/" + name + ".svg"
      }
    }

    
    return (
      <div>
        <ListItem {...inputs.item}>
          <ListItemIcon>
              <object {...inputs.primary}/>
          </ListItemIcon>
          <ListItemText inset  primary={this.props.device.identity.name} />
          {this.state.view ? <ExpandLess /> : <ExpandMore />}
        </ListItem>
        {this.displayDeviceControls()}
        <Divider inset/>

      </div>
    )

  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(withTheme()(DeviceCard)))

