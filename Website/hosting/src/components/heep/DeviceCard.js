import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { withRouter } from 'react-router-dom'
import * as actions from '../../redux/actions'
import { ListItem, ListItemText, ListItemIcon, ListItemSecondaryAction, IconButton}  from 'material-ui'
import { withTheme }       from 'material-ui/styles'
import { Visibility }  from 'material-ui-icons'

var mapStateToProps = (state, ownProps) => ({
  device: state.devices[ownProps.deviceID]
})

class DeviceCard extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      hover: false
    }
  }

  render() {

    var iconName = this.props.device.identity.iconName;
    var name = (iconName == 'light_on' ? 'lightbulb' : iconName);

    var inputs = {
      item: {
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
      },
      deleteButton: {
        'aria-label': 'Delete',
        onClick: () => console.log('delete this device'),
        onMouseEnter: () => this.setState({hover: true}),
        onMouseLeave: () => this.setState({hover: false}),
      }
    }

    
    return (
      <ListItem {...inputs.item}>
        <ListItemIcon>
            <object {...inputs.primary}/>
        </ListItemIcon>
        <ListItemText secondary={this.props.device.identity.name} />
        {(this.state.hover ? 
          <ListItemSecondaryAction>
            <IconButton {...inputs.deleteButton}>
              <Visibility />
            </IconButton>
          </ListItemSecondaryAction> : <ListItemSecondaryAction/> )}
        
      </ListItem>
    )

  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(withTheme()(DeviceCard)))

