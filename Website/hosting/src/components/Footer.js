import React                          from 'react';
import { connect }                    from 'react-redux'
import { bindActionCreators }         from 'redux'
import {  Link, NavLink, withRouter } from 'react-router-dom'
import PropTypes                      from 'prop-types';

import Grid        from 'material-ui/Grid';
import Paper       from 'material-ui/Paper';
import IconButton  from 'material-ui/IconButton';
import Typography  from 'material-ui/Typography';

import * as actions from '../redux/actions'


var mapStateToProps = (state, ownProps) => ({
})


class Footer extends React.Component { 

  checkBreakpoint() {

  }

  render() {
    
    
    return (
      <footer 
        style={{
          flexShrink: 0
        }}>
        <div style={{
                padding: 24
              }}>
            <Grid 
              container
              spacing={24}
              justify={'center'}
              alignItems={'center'}
              >
              <Grid item xs>
              Hello
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

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(Footer))
