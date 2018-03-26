import React                          from 'react';
import { connect }                    from 'react-redux'
import { bindActionCreators }         from 'redux'
import {  Link, NavLink, withRouter } from 'react-router-dom'
import PropTypes                      from 'prop-types';


import List, {
       ListItem,
       ListItemIcon,
       ListItemText } from 'material-ui/List';
import Grid           from 'material-ui/Grid';
import Paper          from 'material-ui/Paper';
import IconButton     from 'material-ui/IconButton';
import Typography     from 'material-ui/Typography';
import { withStyles, withTheme } from 'material-ui/styles';


import Icon from 'material-ui/Icon';
import DeleteIcon from 'material-ui-icons/Delete';
import AddShoppingCartIcon from 'material-ui-icons/AddShoppingCart';
import PhotoCamera from 'material-ui-icons/PhotoCamera';

import * as actions from '../redux/actions'


var mapStateToProps = (state, ownProps) => ({
})

const styles = theme => ({
  root: {
    backgroundColor:  theme.palette.primary.main,
    color: theme.palette.primary.contrastText
  },
  button: {
    margin:1,
  }
});


class Footer extends React.Component {

  socialLogoLinks() {
    return(
      <Grid item xs>
        <Grid container spacing={8}
          justify='center'
          alignItems='center'
        >
          {this.socialLogo('instagram', 'https://www.instagram.com/heep_inc/')}
          {this.socialLogo('facebook-box', 'https://www.facebook.com/heepio/')}
          {this.socialLogo('linkedin-box', 'https://www.linkedin.com/company/heep-inc/')}
          {this.socialLogo('pinterest', 'https://heep.io')}
          {this.socialLogo('twitter', 'https://twitter.com/HeepCo')}
          {this.socialLogo('github-circle', 'https://github.com/HeepIO')}
        </Grid>
      </Grid>
    )
  };

  socialLogo(svg, url) {
    return (
      <Grid item xs={4} sm={2}>
        <a href={url}>
          <img src={'../src/assets/svg_social/' + svg + '.svg'}
            style={{maxHeight: 40}}
          />
        </a>
      </Grid>
    )
  }

  copyrightMadeInBrooklyn() {
    return(
      <Grid item xs={12}>
        <Typography variant="caption" color='inherit'>
          &#169; 2018 Heep - Made with <span style={{color: 'red'}}>&#9829;</span> in Brooklyn
        </Typography>
      </Grid>
    )
  };

  heepLogo() {
    return(
      <Grid item xs={2}>
        <NavLink to='/' style={{textDecoration: 'none'}}>
          <img
            src="../src/assets/Heep_Gradient.png"
            style={{
              maxHeight: 50
            }}/>
        </NavLink>
      </Grid>
    )
  };

  textNavLink(text, url) {

    return(
      <Grid item xs={12}>
        <NavLink to={url}
        style={{
          textDecoration: 'none',
          color: this.props.theme.palette.primary.contrastText
        }}>
          <Typography variant="caption" color='inherit'>
            {text}
          </Typography>
        </NavLink>
      </Grid>
    )
  };

  footerLeft() {
    return (
      <Grid item xs={3}>
        <Grid
          container
          spacing={8}
          justify='center'
          direction='column'
        >
          {this.textNavLink('Account', '/User')}
          {this.textNavLink('Shop', '/Store')}
          {this.textNavLink('Blog', '/Blog')}
          {this.textNavLink('Developers', '/Developers')}
        </Grid>
      </Grid>
    )
  };

  footerCenter() {
    return (
      <Grid item xs={6}>
        <Grid
          container
          spacing={8}
          direction='column'
          alignItems='center'
          justify='center'
        >
          {this.heepLogo()}
          {this.socialLogoLinks()}
          {this.copyrightMadeInBrooklyn()}
        </Grid>
    </Grid>
    )
  };

  footerRight() {
    return(
      <Grid item xs={3}>
        <Grid
          container
          spacing={8}
          direction='column'
          alignItems='flex-end'
        >
          {this.textNavLink('About Us', '/About')}
          {this.textNavLink('Contact Us', '/Contact')}
          {this.textNavLink('Privacy Policy', '/privacypolicy')}
          {this.textNavLink('Terms of Service', '/tos')}
        </Grid>
      </Grid>
    )
  }

  render() {
    const { classes } = this.props;

    const inputs = {
      footerContainer: {
        style: {
          padding: 24,
          backgroundColor: this.props.theme.palette.primary.main,
          color: this.props.theme.palette.primary.contrastText,
          overflowX: 'hidden'
        }
      }
    }

    return (
      <footer >
        <div {...inputs.footerContainer}>
          <Grid
            container
            spacing={24}
            justify='space-between'
            alignItems='center'
            >
              {this.footerLeft()}
              {this.footerCenter()}
              {this.footerRight()}
          </Grid>
        </div>
      </footer>
    );

  }

}


var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(actions, dispatch)
}

Footer.propTypes = {
  classes: PropTypes.object.isRequired,
};

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(withTheme()(withStyles(styles)(Footer))));
