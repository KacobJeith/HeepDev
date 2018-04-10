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
          Divider,
          Drawer,
          FormControlLabel,
          FormGroup,
          Grid,
          Hidden,
          IconButton,
          Menu,
          MenuItem,
          List,
          Switch,
          Toolbar,
          Typography }        from 'material-ui'

import MenuIcon               from 'material-ui-icons/Menu';
import AccountCircle          from 'material-ui-icons/AccountCircle';
import ShoppingCartIcon       from 'material-ui-icons/ShoppingCart';
import ShopIcon               from 'material-ui-icons/ShoppingBasket'
import AboutIcon              from 'material-ui-icons/Contacts'
import DevelopIcon            from 'material-ui-icons/Code'

import { withStyles }         from 'material-ui/styles';



import SmartBadge from './utilities/SmartBadge'
import { logos } from '../assets/remote/Logos'


var mapStateToProps = (state) => ({
  loginStatus: state.loginStatus,
  itemsInCart: calculateQuantity(state)
})

const calculateQuantity = (state) => {
  var quantity = 0;

  for (var i =0; i < state.shoppingCart.lineItems.length; i++) {

    quantity += state.shoppingCart.lineItems[i].quantity;
  }

  return quantity
}

const styles = {
  root: {
    flexGrow: 1,
  },
  flex: {
    flex: 1,
    alignItems: 'center'
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
  },
  navLinkMenu: {
    textDecoration: 'none',
    outline: 'none',
    width: 250
  }
};

const ShopLink = props => <Link to="/Shop" {...props} style={{ textDecoration: 'none' }}/>


class MenuAppBar extends React.Component {
  state = {
    auth: true,
    anchorAccountMenu: null,
    mobileMenu: false
  };

  handleChange = (event, checked) => {
    this.setState({ auth: checked });
  };

  handleAccountMenu = event => {
    this.setState({ anchorAccountMenu: event.currentTarget });
  };

  handleAccountMenuClose = () => {
    this.setState({ anchorAccountMenu: null });
  };

  handleMobileMenuOpen = () => {
    this.setState({ mobileMenu: true })
    console.log('click open!')
  };

  handleMobileMenuClose = () => {
    this.setState({ mobileMenu: false })
    console.log('click close!')
  };

  handleLogout = () => {
    auth.logout();
    this.handleClose();
  };

  loggedOn() {
    return (
      <div style={{marginLeft: 15}}>
        <IconButton
          aria-owns={open ? 'menu-appbar' : null}
          aria-haspopup="true"
          onClick={this.handleAccountMenu}
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
          anchorEl={this.state.anchorAccountMenu}
          anchorOrigin={{
            vertical: 'top',
            horizontal: 'right',
          }}
          transformOrigin={{
            vertical: 'top',
            horizontal: 'right',
          }}
          open={Boolean(this.state.anchorAccountMenu)}
          onClose={this.handleAccountMenuClose}
        >
          <NavLink to="/User" style={styles.navLink}>
            <MenuItem onClick={this.handleAccountMenuClose}>Profile</MenuItem>
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
          aria-owns={Boolean(this.state.anchorAccountMenu) ? 'menu-appbar' : null}
          aria-haspopup="true"
          onClick={this.handleAccountMenu}
          color="inherit"
        >
          <AccountCircle />
        </IconButton>
        <Menu
          id="menu-appbar"
          anchorEl={this.state.anchorAccountMenu}
          anchorOrigin={{
            vertical: 'top',
            horizontal: 'right',
          }}
          transformOrigin={{
            vertical: 'top',
            horizontal: 'right',
          }}
          open={Boolean(this.state.anchorAccountMenu)}
          onClose={this.handleAccountMenuClose}
        >
          <NavLink to="/auth" style={styles.navLink}>
            <MenuItem onClick={this.handleAccountMenuClose}>Login</MenuItem>
          </NavLink>

          <NavLink to="/auth" style={styles.navLink}>
            <MenuItem onClick={this.handleAccountMenuClose}>Create Account</MenuItem>
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
      <Hidden xsDown={true}>
        <Button {...inputs.Button}>
          <NavLink to={navLink} {...inputs.NavLink}>
            <Typography variant="subheading" {...inputs.Typography}>
              {linkText}
            </Typography>
          </NavLink>
        </Button>
      </Hidden>
    )
  };

  appBarCart() {

    const inputs = {
      iconSize: {
        width: 40,
        height: 40
      }
    };

    return (
      <NavLink to="/MyCart" style={{textDecoration: 'none'}}>
        <IconButton aria-label="Add to shopping cart"
          style={{marginBottom: 0}}
        >
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

  mobileMenu() {

    const inputs = {
      menuButton: {
        style:{
          fontSize: 30,
          marginBottom: 3,
          marginRight: 10
        }
      }
    }

    return (
      <Hidden smUp={true}>
          <IconButton
            {...inputs.menuButton}
            onClick={this.handleMobileMenuOpen}
            color="inherit"
          >
            <MenuIcon/>

            <Drawer
              anchor='left'
              open={this.state.mobileMenu}
              onChange={this.handleMobileMenuClose}
              ModalProps={{ onBackdropClick: this.handleMobileMenuClose }}
              variant='temporary'
              >

              <div
                tabIndex={0}
                role="button"
                onClick={this.handleMobileMenuClose}
                onKeyDown={this.handleMobileMenuClose}
                style={{width: 250}}
                >

                <NavLink to="/" style={styles.navLink}>
                  <MenuItem>Home</MenuItem>
                </NavLink>

                <Divider />

                <NavLink to="/About" style={styles.navLink}>
                  <MenuItem>
                    <IconButton>
                      <AboutIcon/>
                    </IconButton>
                    About
                  </MenuItem>
                </NavLink>

                <Divider />

                <NavLink to="/Shop" style={styles.navLink}>
                  <MenuItem>
                    <IconButton>
                      <ShopIcon/>
                    </IconButton>
                    Shop
                  </MenuItem>
                </NavLink>

                <Divider />

                <NavLink to="/Developers" style={styles.navLink}>
                <MenuItem>
                  <IconButton>
                    <DevelopIcon/>
                  </IconButton>
                  Develop
                </MenuItem>
                </NavLink>

              </div>

            </Drawer>

          </IconButton>
      </Hidden>
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
            {this.mobileMenu()}
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
