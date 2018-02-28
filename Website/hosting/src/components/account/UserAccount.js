import React                  from 'react';
import { connect }            from 'react-redux'
import { bindActionCreators } from 'redux'
import { withRouter }         from 'react-router-dom'
import * as actions           from '../../redux/actions'
import * as auth              from '../../firebase/FirebaseAuth'

import { withTheme }       from 'material-ui/styles'
import { Grid, Typography, Avatar, Divider, IconButton}  from 'material-ui'
import { Edit }  from 'material-ui-icons'

var mapStateToProps = (state) => ({
  loginStatus: state.loginStatus,
  user: auth.currentUser()
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
        <Grid container justify='space-between' alignItems='center'>
          <Grid item xs >
            <Typography variant="title">
              {this.props.user.displayName}
            </Typography>
          </Grid>
          <Grid item xs >
            <IconButton style={{float:'right'}}>
              <Edit />
            </IconButton>
          </Grid>
        </Grid>

        <Divider/>

        <Typography variant="caption" gutterBottom paragraph wrap>
          {this.props.user.email}
        </Typography>
      </div>
    )
  }

  render() {

    return (
      <Grid container justify='center' style={{paddingTop: 50}}>
        <Grid item xs={10}>
          <Grid container spacing={24} alignItems='center'>
            <Grid item xs={3}>
              {this.userProfileImage()}
            </Grid>
            <Grid item xs={9}>
              {this.userDetails()}
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
