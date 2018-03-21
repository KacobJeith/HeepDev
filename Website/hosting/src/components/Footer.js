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
          justify={'center'}
          direction='row'
        >
          {[{svg:'instagram',     url:'https://www.instagram.com/heep_inc/'},
            {svg:'facebook-box',  url:'https://www.facebook.com/heepio/'},
            {svg:'linkedin-box',  url:'https://www.linkedin.com/company/heep-inc/'},
            {svg:'pinterest',     url:'https://heep.io'},
            {svg:'twitter',       url:'https://twitter.com/HeepCo'},
            {svg:'github-circle', url:'https://github.com/HeepIO'}].map((social) => (
            <Grid item xs={4} sm={2} key={social.svg} style={{position:'relative'}}>
                <object
                  width='100%'
                  height='100%'
                  style={{fill:'blue'}}
                  fill='blue'
                  type='image/svg+xml'
                  data={'../src/assets/svg_social/' + social.svg + '.svg'}
                />
                <a href={social.url}
                   style={{
                      width:'100%',
                      height:'100%',
                      position:'absolute',
                      left:0,
                      top:0
                    }}>
                </a>
            </Grid>
          ))}
        </Grid>
      </Grid>
    )
  }

  copyrightHeep() {
    return (
      <Grid item >
        <Typography variant="caption" color='inherit'>
          &#169; 2018 Heep
        </Typography>
      </Grid>
    )
  }

  madeInBrooklyn() {
    return(
      <Grid item >
        <Typography variant="caption" color='inherit'>
          Made with <span style={{color: 'red'}}>&#9829;</span> in Brooklyn
        </Typography>
      </Grid>
    )
  }

  copyrightMadeInBrooklyn() {

    return(
      <Grid item >
        <Typography variant="caption" color='inherit'>
          &#169; 2018 Heep - Made with <span style={{color: 'red'}}>&#9829;</span> in Brooklyn
        </Typography>
      </Grid>
    )

  }

  heepLogo() {
    return(
      <Grid item xs={6}>
        <img
          src="../src/assets/Heep_Gradient.png"
          style={{
            maxWidth: '100%',
            maxHeight: '100%'
          }}/>
      </Grid>
    )
  }

  textNavLink(text, url, align = 'left') {

    return(
      <Grid item >
        <NavLink to={url}
        style={{
          textDecoration: 'none',
          color: this.props.theme.palette.primary.contrastText
        }}>
          <Typography variant="caption" color='inherit' align={align}>
            {text}
          </Typography>
        </NavLink>
      </Grid>
    )
  }

  render() {
    const { classes } = this.props;


    return (
      <footer >
        <div
            style={{
                padding: 24,
                flexShrink: 0,
                backgroundColor: this.props.theme.palette.primary.main,
                color: this.props.theme.palette.primary.contrastText,
                overflowX: 'hidden'
              }}>

            <Grid
              container
              spacing={24}
              justify={'center'}
              alignItems={'center'}
              >
              <Grid item xs>
                <Grid
                  container
                  spacing={8}
                  justify={'center'}
                  direction='column'
                >
                  {this.textNavLink('Account', '/User')}
                  {this.textNavLink('Shop', '/Store')}
                  {this.textNavLink('Blog', '/Blog')}
                  {this.textNavLink('Developers', '/Developers')}

                </Grid>

              </Grid>



              <Grid item xs>
                <Grid
                  container
                  spacing={8}
                  justify={'center'}
                  alignItems={'center'}
                  direction='column'
                >
                </Grid>

              </Grid>



              <Grid item xs md={2} lg={1}>
                <Grid
                  container
                  spacing={8}
                  direction='column'
                  alignItems='center'
                  justify='center'
                >
                {this.heepLogo()}
                {this.socialLogoLinks()}

              </Grid>

            </Grid>

            <Grid item xs>
                <Grid
                  container
                  spacing={8}
                  direction='column'
                />
              </Grid>

            <Grid item xs>
                <Grid
                  container
                  spacing={8}
                  direction='column'
                >
                  {this.textNavLink('About Us', '/About', 'right')}
                  {this.textNavLink('Contact Us', '/Contact', 'right')}
                  {this.textNavLink('Privacy Policy', '/privacypolicy', 'right')}
                  {this.textNavLink('Terms of Service', '/tos', 'right')}
              </Grid>
            </Grid>


          </Grid>

          <Grid container alignItems='center' justify='center'>
            <Grid item>

                {this.copyrightMadeInBrooklyn()}
                </Grid>
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
