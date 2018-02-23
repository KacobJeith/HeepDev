import React from 'react';
import PropTypes from 'prop-types';
import { withStyles } from 'material-ui/styles';
import AppBar from 'material-ui/AppBar';
import Toolbar from 'material-ui/Toolbar';
import Typography from 'material-ui/Typography';
import IconButton from 'material-ui/IconButton';
import Button from 'material-ui/Button';
import MenuIcon from 'material-ui-icons/Menu';
import AccountCircle from 'material-ui-icons/AccountCircle';
import ShoppingCartIcon from 'material-ui-icons/ShoppingCart';
import Switch from 'material-ui/Switch';
import { FormControlLabel, FormGroup } from 'material-ui/Form';
import Menu, { MenuItem } from 'material-ui/Menu';
import { NavLink } from 'react-router-dom'
import { connect } from 'react-redux'
import * as actions from '../redux/actions'
import { bindActionCreators } from 'redux'
import { withRouter } from 'react-router-dom'
import Badge from 'material-ui/Badge';
import * as auth from '../firebase/FirebaseAuth'
import Avatar from 'material-ui/Avatar';

import classNames from 'classnames';

var mapStateToProps = (state) => ({
  loginStatus: state.loginStatus,
  itemsInCart: state.itemsInCart
})

const styles = {
  root: {
    flexGrow: 1,
  },
  flex: {
    flex: 1,
  },
  menuButton: {
    marginLeft: -12,
    marginRight: 20,
  },
  avatar: {
    margin: 10,
  },
  bigAvatar: {
      width: 60,
      height: 60,
    },
};

const ShopLink = props => <Link to="/Shop" {...props} style={{ textDecoration: 'none' }}/>


class MenuAppBar extends React.Component {
  state = {
    auth: true,
    anchorEl: null,
  };

  handleChange = (event, checked) => {
    this.setState({ auth: checked });
  };

  handleMenu = event => {
    this.setState({ anchorEl: event.currentTarget });
  };

  handleClose = () => {
    this.setState({ anchorEl: null });
  };

  handleLogout = () => {
    auth.logout();
    this.handleClose();
  }

  loggedOn() {
    return (
      <div style={{marginLeft: 15}}>
        <IconButton
          aria-owns={open ? 'menu-appbar' : null}
          aria-haspopup="true"
          onClick={this.handleMenu}
          color="inherit"
        >
          <Avatar
            alt="Adelle Charles"
            src={auth.getMyUserImagePath()}
            className={classNames(this.props.avatar, this.props.bigAvatar)}
          />
        </IconButton>
        <Menu
          id="menu-appbar"
          anchorEl={this.state.anchorEl}
          anchorOrigin={{
            vertical: 'top',
            horizontal: 'right',
          }}
          transformOrigin={{
            vertical: 'top',
            horizontal: 'right',
          }}
          open={Boolean(this.state.anchorEl)}
          onClose={this.handleClose}
        >
          <NavLink to="/User" style={{textDecoration: 'none', marginRight: 20}}>
            <MenuItem onClick={this.handleClose}>Profile</MenuItem>
          </NavLink>
          <MenuItem onClick={this.handleLogout}>Logout</MenuItem>
        </Menu>
      </div>
    );
  }

  notLoggedOn() {
    return (
      <div>
        <IconButton
          aria-owns={Boolean(this.state.anchorEl) ? 'menu-appbar' : null}
          aria-haspopup="true"
          onClick={this.handleMenu}
          color="inherit"
        >
          <AccountCircle />
        </IconButton>
        <Menu
          id="menu-appbar"
          anchorEl={this.state.anchorEl}
          anchorOrigin={{
            vertical: 'top',
            horizontal: 'right',
          }}
          transformOrigin={{
            vertical: 'top',
            horizontal: 'right',
          }}
          open={Boolean(this.state.anchorEl)}
          onClose={this.handleClose}
        >
          <NavLink to="/auth" style={{textDecoration: 'none', margin: 0}}>
            <MenuItem onClick={this.handleClose}>Login</MenuItem>
          </NavLink>

          <NavLink to="/auth" style={{textDecoration: 'none', margin: 0}}>
            <MenuItem onClick={this.handleClose}>Create Account</MenuItem>
          </NavLink>
        </Menu>
      </div>
    );
  }

  render() {
    const { classes } = this.props;
    const { authed, anchorEl } = this.state;
    const open = Boolean(anchorEl);

    var inputs = {
      Logo: {
        src: "https://firebasestorage.googleapis.com/v0/b/heep-3cddb.appspot.com/o/assets%2FLogo%2FSideBySide.png?alt=media&token=fa835081-275d-445e-be34-8241b08d687a",
        height: 50,
        style: {
          marginTop: 0,
          display: 'inline',
          left: 0,
          position: 'absolute',
          maxWidth: "250%"
        }
      }
    }

    var loggedInNavs = [];

    if (this.props.loginStatus) {
      loggedInNavs = this.loggedOn();
    } else {
      loggedInNavs = this.notLoggedOn();
    }

    return (
      <div className={classes.root}>
        <AppBar position="static">
          <Toolbar>
            <NavLink to="/">
              <IconButton >
                  <img {...inputs.Logo}/>
              </IconButton>
            </NavLink>

            <div className={classes.flex}/>

              <IconButton
                  color="inherit"
                  style={{textDecoration: 'none', marginRight: 50}}>
                <NavLink to="/" style={{textDecoration: 'none', marginRight: 20}}>
                  <Typography variant="title" style={{color:"white"}}>
                    About  
                  </Typography>
                </NavLink>
              </IconButton>

              <IconButton
                  color="inherit">
                <NavLink to="/Shop" style={{textDecoration: 'none', marginRight: 90}}>
                  <Typography variant="title" style={{color:"white"}}>
                    Shop
                  </Typography>
                </NavLink>
              </IconButton>

              <IconButton
                  color="inherit">
                <NavLink to="/Shop" style={{textDecoration: 'none', marginRight: 40}}>
                  <Typography variant="title" style={{color:"white"}}>
                    Develop
                  </Typography>
                </NavLink>
              </IconButton>


              <NavLink to="/Checkout" style={{textDecoration: 'none'}}>
                
                <IconButton className={classes.button} aria-label="Add to shopping cart">
                  <Badge color="secondary" badgeContent={this.props.itemsInCart} className={classes.margin}>
                    <ShoppingCartIcon style={{fill:"white"}}/>
                  </Badge>
                </IconButton>
              </NavLink>

              {loggedInNavs}
            
          </Toolbar>
        </AppBar>
      </div>
    );
  }
}

MenuAppBar.propTypes = {
  classes: PropTypes.object.isRequired,
};

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(withStyles(styles)(MenuAppBar)))