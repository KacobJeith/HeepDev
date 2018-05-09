import React from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import { withRouter } from 'react-router-dom'
import { withTheme } from 'material-ui/styles';
import * as Actions from '../../redux/actions'

import { Grid, Paper, Typography } from 'material-ui'
import policy from '../../assets/PrivacyPolicy.json'

var mapStateToProps = (state) => ({
});

class PrivacyPolicy extends React.Component {

  render() {
    return (
      <Grid container direction='column' alignItems='center' 
      spacing={24}>
        <Grid item xs={10}>
          {policy.sections.map((thisSection, sectionIndex) => (
            <div key={'section' + sectionIndex}>
              <Typography variant='title' paragraph>
                {thisSection.title}
              </Typography>
              
              {thisSection.content.map((thisParagraph, paragraphIndex) => (
                <Typography variant='body1' paragraph key={'paragraph' + sectionIndex + paragraphIndex}>
                  {thisParagraph}
                </Typography>
              ))}
            </div>
          ))}
        </Grid>
      </Grid>
    );
  }
}



function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(withTheme()(PrivacyPolicy)))
