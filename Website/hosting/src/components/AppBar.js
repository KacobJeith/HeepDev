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
import { LinkContainer } from 'react-router-bootstrap';

import Badge from 'material-ui/Badge';
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

  render() {
    const { classes } = this.props;
    const { auth, anchorEl } = this.state;
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
                  style={{textDecoration: 'none', marginRight: 20}}>
                <NavLink to="/" style={{textDecoration: 'none', marginRight: 20}}>
                  <Typography variant="title" style={{color:"white"}}>
                    About  
                  </Typography>
                </NavLink>
              </IconButton>

              <IconButton
                  color="inherit">
                <NavLink to="/Shop" style={{textDecoration: 'none', marginRight: 20}}>
                  <Typography variant="title" style={{color:"white"}}>
                    Shop
                  </Typography>
                </NavLink>
              </IconButton>


              <NavLink to="/Checkout" style={{textDecoration: 'none'}}>
                
                <IconButton className={classes.button} aria-label="Add to shopping cart" tooltip="Cart">
                  <Badge color="secondary" badgeContent={4} className={classes.margin}>
                    <ShoppingCartIcon style={{fill:"white"}}/>
                  </Badge>
                </IconButton>
              </NavLink>

            {auth && (
              <div>
                <IconButton
                  aria-owns={open ? 'menu-appbar' : null}
                  aria-haspopup="true"
                  onClick={this.handleMenu}
                  color="inherit"
                >
                  <AccountCircle />
                </IconButton>
                <Menu
                  id="menu-appbar"
                  anchorEl={anchorEl}
                  anchorOrigin={{
                    vertical: 'top',
                    horizontal: 'right',
                  }}
                  transformOrigin={{
                    vertical: 'top',
                    horizontal: 'right',
                  }}
                  open={open}
                  onClose={this.handleClose}
                >
                  <MenuItem onClick={this.handleClose}>Profile</MenuItem>
                  <MenuItem onClick={this.handleClose}>My account</MenuItem>
                </Menu>
              </div>
            )}
          </Toolbar>
        </AppBar>
      </div>
    );
  }
}

MenuAppBar.propTypes = {
  classes: PropTypes.object.isRequired,
};

export default withStyles(styles)(MenuAppBar);