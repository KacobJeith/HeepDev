import React from 'react';

import { connect }            from 'react-redux'
import { bindActionCreators } from 'redux'
import { withRouter }         from 'react-router-dom'
import * as actions           from '../../redux/actions'

import { withTheme } from 'material-ui/styles'
import { Divider, Typography, Collapse, Tooltip } from 'material-ui'
import List, { ListItem, ListItemIcon, ListItemText, ListSubheader } from 'material-ui/List'
import { Redo, Undo, LinearScale, PowerSettingsNew, ExpandLess, ExpandMore } from 'material-ui-icons'

var mapStateToProps = (state, ownProps) => ({
  thisControl: state.controls[ownProps.controlID]
})

class DetailsPanelControlBlock extends React.Component {
  state = {
    view: false
  }

  listField(field, value) {

    return (
      <ListItem key={field} > 
        <ListItemText primary={field + ' : '} />
        <Typography >
          {value.toString()}
        </Typography>
      </ListItem>
    )
  }

  controlIcons() {
    return (
      <div>
        <ListItemIcon>
          {this.props.thisControl.controlDirection == 0 ? 
             <Tooltip id='tooltip-input' title='Input' placement="left"> 
               <Redo /> 
             </Tooltip>: 
             <Tooltip id='tooltip-output' title='Output' placement="left"> 
               <Undo/>
             </Tooltip>}
        </ListItemIcon>
        <ListItemIcon>
          {this.props.thisControl.controlType == 1 ?  
           <Tooltip id='tooltip-range' title='Range' placement="left"> 
               <LinearScale/> 
           </Tooltip> : 
           <Tooltip id='tooltip-onoff' title='On/Off' placement="left"> 
               <PowerSettingsNew /> 
           </Tooltip> }
        </ListItemIcon>

      </div>
    )
  }

  render() {

    return (  
        <List 
            disablePadding 
            dense
          >
            <ListItem 
              button 
              onClick={() => this.setState({view: !this.state.view})}
              style={{paddingLeft: 4}}>

              {this.controlIcons()}
              <ListItemText primary={this.props.thisControl.controlName}/>
              {this.state.view ? <ExpandLess /> : <ExpandMore />}

            </ListItem>
            
            <Collapse in={this.state.view} timeout="auto" unmountOnExit>
              <div>

                {Object.keys(this.props.thisControl).map((field) => (
                  this.listField(field, this.props.thisControl[field])
                ))}

              </div>
            </Collapse>
            <Divider/>
          </List>
        
    );
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(withTheme()(DetailsPanelControlBlock)))