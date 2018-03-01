import React                  from 'react';
import { connect }            from 'react-redux'
import { bindActionCreators } from 'redux'
import { withRouter }         from 'react-router-dom'
import * as actions           from '../../redux/actions'
import * as auth              from '../../firebase/FirebaseAuth'

import { withTheme }       from 'material-ui/styles'
import { Grid, Typography, Avatar, Divider, IconButton, List, ListItem, ListItemText, ListItemIcon}  from 'material-ui'
import { Edit }  from 'material-ui-icons'

import DeviceCard from '../heep/DeviceCard'
import PlaceCard from '../heep/PlaceCard'
import AddPlaceModal from './AddPlaceModal'

var mapStateToProps = (state) => ({
  loginStatus: state.loginStatus,
  user: auth.currentUser(),
  devices: state.devices,
  places: state.places
})

class UserAccount extends React.Component {
  constructor(props) {
    super(props);
  }

  userProfileImage() {
    var inputs = {
      avatar: {
        alt: this.props.user.displayName,
        src: this.props.user.photoURL,
        style: {
          width: '100%',
          height: 'auto'
        }
      }
    }

    return (
      <Avatar {...inputs.avatar}/>
    )
  }

  userDetails() {

    return (
      <div>
        {this.titleEditDivider(this.props.user.displayName, () => console.log('edit username or email'))}

        <Typography variant="caption" gutterBottom paragraph wrap>
          {this.props.user.email}
        </Typography>
      </div>
    )
  }

  titleEditDivider(title, onClick) {

    return (
      <div>
        <Grid container alignItems='center' >
          <Grid item xs>
            <Typography variant="title">
              {title}
            </Typography>
          </Grid>
          <Grid item xs>
            <IconButton 
              style={{float:'right'}}
              onClick={onClick}
            >
              <Edit />
            </IconButton>
          </Grid>
        </Grid>

        <Divider/>
      </div>
    )
  }

  userPlaces() {

    return(
      <div>
        {this.titleEditDivider('Heep Places', () => console.log('Edit Places'))}
        <List>
          {Object.keys(this.props.places).map((placeID) => (
            <PlaceCard placeID={placeID} key={placeID}/>
          ))}
          <AddPlaceModal/>
        </List>
      </div>
    )
  }

  userDevices() {
    return(
      <div>
        {this.titleEditDivider('Heep Devices', () => console.log('Edit Device Details Remotely'))}
        <List >
          {Object.keys(this.props.devices).map((deviceID) => (
            <DeviceCard deviceID={deviceID} key={deviceID}/>
          ))}
        </List>
      </div>
    )
  }

  render() {

    return (
      <Grid container justify='center' style={{paddingTop: 50, maxWidth:'100%'}}>
        <Grid item xs={10}>
          <Grid container spacing={24} alignItems='center'>
            <Grid item xs={3}>
              {this.userProfileImage()}
            </Grid>
            <Grid item xs={9}>
              {this.userDetails()}
            </Grid>
            <Grid item xs={12}>
              {this.userPlaces()}
            </Grid>

            <Grid item xs={12}>
              {this.userDevices()}
            </Grid>
          </Grid>
        </Grid>
      </Grid>
    );

  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(withTheme()(UserAccount)))
