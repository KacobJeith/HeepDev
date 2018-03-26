import React                  from 'react';
import { Link, NavLink }      from 'react-router-dom'
import { connect }            from 'react-redux'
import { bindActionCreators } from 'redux'
import { withRouter }         from 'react-router-dom'
import PropTypes              from 'prop-types';
import classNames             from 'classnames';

import * as actions           from '../redux/actions'
import * as auth              from '../firebase/FirebaseAuth'

import {  AppBar,
          Avatar,
          Badge,
          Button,
          FormControlLabel,
          FormGroup,
          Grid,
          Hidden,
          IconButton,
          Menu,
          MenuItem,
          Switch,
          Toolbar,
          Typography }        from 'material-ui'

import MenuIcon               from 'material-ui-icons/Menu';
import AccountCircle          from 'material-ui-icons/AccountCircle';
import ShoppingCartIcon       from 'material-ui-icons/ShoppingCart';

import { withStyles }         from 'material-ui/styles';



import SmartBadge from './utilities/SmartBadge'
import { logos } from '../assets/remote/Logos'


var mapStateToProps = (state) => ({
  loginStatus: state.loginStatus,
  itemsInCart: state.shoppingCart.lineItems.length
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
  navLink: {
    textDecoration: 'none',
    outline: 'none'
  }
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
          <NavLink to="/User" style={styles.navLink}>
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
          <NavLink to="/auth" style={styles.navLink}>
            <MenuItem onClick={this.handleClose}>Login</MenuItem>
          </NavLink>

          <NavLink to="/auth" style={styles.navLink}>
            <MenuItem onClick={this.handleClose}>Create Account</MenuItem>
          </NavLink>
        </Menu>
      </div>
    );
  };

  appBarLink(navLink, linkText) {
    const inputs = {
      Typography: {
        style: {
          color: "white",
          paddingTop: 11,
          paddingBottom: 11
        }
      },
      Button: {
        style: {
          textTransform: "capitalize"
        }
      },
      NavLink: {
        style: {
          textDecoration: "none"
        }
      },
    };

    return (
      <Button {...inputs.Button}>
        <NavLink to={navLink} {...inputs.NavLink}>
          <Typography variant="subheading" {...inputs.Typography}>
            {linkText}
          </Typography>
        </NavLink>
      </Button>
    )
  };

  appBarCart() {
    return (
      <NavLink to="/MyCart" style={{textDecoration: 'none'}}>
        <IconButton aria-label="Add to shopping cart">
          {SmartBadge(
                    <ShoppingCartIcon style={{fill:"white"}}/>,
                    this.props.itemsInCart,
                    'secondary')
          }
        </IconButton>
      </NavLink>
    )
  };

  appBarLogo() {
    const inputs = {
      Logo: {
        src: logos.sideBySide,
        height: 50,
        style: {
          maxWidth: "250%"
        }
      },
    }

    return (
      <NavLink to="/">
        <Button {...inputs.Button}>
          <img {...inputs.Logo}/>
        </Button>
      </NavLink>
    )
  }

  render() {
    const { classes } = this.props;
    const { authed, anchorEl } = this.state;
    const open = Boolean(anchorEl);

    var loggedInNavs = [];

    if (this.props.loginStatus) {
      loggedInNavs = this.loggedOn();
    } else {
      loggedInNavs = this.notLoggedOn();
    }

    return (
      <div className={classes.root}>
        <AppBar position="static" style={{overflowX: 'hidden'}}>
          <Toolbar>
            {this.appBarLogo()}
            <div className={classes.flex}/>
            {this.appBarLink("/About", "About")}
            {this.appBarLink("/Shop", "Shop")}
            {this.appBarLink("/Developers", "Develop")}
            {this.appBarCart()}
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
