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

import * as actions from '../redux/actions'


var mapStateToProps = (state, ownProps) => ({
})

const styles = theme => ({
  root: {
    backgroundColor:  theme.palette.primary.main,
    color: theme.palette.primary.contrastText
  },
});


class Footer extends React.Component { 

  checkBreakpoint() {

  }

  render() {

    return (
      <footer >
        <div
            style={{
                padding: 24,
                flexShrink: 0,
                backgroundColor: this.props.theme.palette.primary.main,
                color: this.props.theme.palette.primary.contrastText
              }}>

            <Grid 
              container
              spacing={24}
              justify={'center'}
              alignItems={'center'}
              >
              <Grid 
                item 
                xs
                >
                <Grid 
                  container
                  spacing={8}
                  justify={'center'}
                  alignItems={'left'}
                  direction='column'
                >
                  <Grid item >
                    <NavLink to="/Shop" 
                    style={{
                      textDecoration: 'none', 
                      color: this.props.theme.palette.primary.contrastText
                    }}>
                      <Typography variant="body1" color='inherit'>
                        Shop
                      </Typography>
                    </NavLink>
                  </Grid>
                  <Grid item >
                  <Typography variant="body1" color='inherit'>
                    &#169; 2018 Heep
                  </Typography>
                  </Grid>
                  <Grid item >
                  <Typography variant="body1" color='inherit'>
                    Made with <span style={{color: 'red'}}>&#9829;</span> in Brooklyn
                  </Typography>
                  </Grid>
                </Grid>

              </Grid>

              <Grid 
                item 
                xs
                >
                
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
