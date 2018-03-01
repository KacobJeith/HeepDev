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
         Button,
         Divider,
         Grid,
         Collapse }                 from 'material-ui'
import { withTheme }                from 'material-ui/styles'
import {  ExpandLess, 
          ExpandMore, 
          Home,
          NetworkWifi,
          Delete,
          Save,
          Edit }   from 'material-ui-icons'

var mapStateToProps = (state, ownProps) => ({
  place: state.places[ownProps.placeID],
  placeID: ownProps.placeID
})

class PlaceListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      edit: false,
      view: false
    }
  }

  editPanel() {
    const inputs = {
      buttonIcon: {
        style: {
          marginLeft:this.props.theme.spacing.unit
        }
      }
    }

    return (
      <Grid container justify='flex-end' style={{padding:0}}>
        <Grid item xs={3}>
          <Button 
            style={{width:'100%', color: 'red'}}
            color='primary'
            variant='flat'
            size='small'
            onClick={() => this.props.deletePlace(this.props.placeID)}
          >
            Delete Place
            <Delete {...inputs.buttonIcon}/>
          </Button>
        </Grid>
        <Grid item xs={3}>
          <Button 
            style={{width:'100%'}}
            color='secondary'
            variant='raised'
            size='small'
            onClick={() => this.setState({edit:false})}
          >
            Save
            <Save {...inputs.buttonIcon}/>
          </Button>
        </Grid>
      </Grid>

    )
  }

  editButton() {
    const inputs = {
      buttonIcon: {
        style: {
          marginLeft:this.props.theme.spacing.unit
        }
      }
    }

    return (
      <Grid container justify='flex-end'>
        <Grid item xs={3}>
          <Button 
            style={{width:'100%'}}
            color='primary'
            variant='flat'
            size='small'
            onClick={() => this.setState({edit: true})}
          >
            Edit Place
            <Edit {...inputs.buttonIcon}/>
          </Button>
        </Grid>
      </Grid>
    )
  }

  displayPlaceDetails() {

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
          {Object.keys(this.props.place.networks).map((thisNetwork) => {
            const thisNetworkInfo = this.props.place.networks[thisNetwork];

            return(
             <List disablePadding key={this.props.deviceID + thisNetwork.controlName}>
               <ListItem  {...inputs.nested}>
                 <ListItemIcon>
                   <NetworkWifi/>
                 </ListItemIcon>
                 <ListItemText inset secondary={thisNetworkInfo.ssid} />
               </ListItem>
             </List>
             )
          })}

            
          <List disablePadding key={this.props.deviceID + 'options'}>
            <ListItem  {...inputs.nested}>
                
                  {this.state.edit ? this.editPanel() : this.editButton()}
                
            </ListItem>
          </List>
        </div>
      </Collapse>
    )
  }

  render() {

    var inputs = {
      item: {
        button: true,
        onClick: () => this.setState({view: !this.state.view}),
        onMouseEnter: () => this.setState({hover: true}),
        onMouseLeave: () => this.setState({hover: false})
      }
    }

    
    return (
      <div>
        <ListItem {...inputs.item}>
          <ListItemIcon >
              <Home style={{
                color:this.props.theme.palette.primary.main
              }}/>
          </ListItemIcon>
          <ListItemText inset  primary={this.props.place.name} />
          {this.state.view ? <ExpandLess /> : <ExpandMore />}
        </ListItem>
        {this.displayPlaceDetails()}
        <Divider inset/>

      </div>
    )

  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(withTheme()(PlaceListItem)))

