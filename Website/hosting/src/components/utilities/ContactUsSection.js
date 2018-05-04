import React from 'react'

import { Grid, Typography, Button } from 'material-ui';
import { HashLink } from "react-router-hash-link";
import { withTheme } from 'material-ui/styles';
import { withRouter }         from 'react-router-dom'

import SectionCard from '../utilities/SectionCard'

class ContactUsSection extends React.Component {

  render() {
    const inputs = {
      paddingTop: 25,
      paddingBottom: 25,
      backgroundColor: '#C9D6DC'
    };

    return(
      SectionCard(inputs,
        <Grid container direction='column' style={{
          maxWidth:'100%',
          minHeight: 400,
          margin: '0 auto'
        }} justify='center' alignItems='center'>
          <Grid item xs={12}>
            <Typography variant='headline' align='center'>
              Let's Get Started.
            </Typography>
            <br/>
            <Typography variant='subheading' align='center' paragraph>
              Contact us for a consulation on how Heep products can augment your operations.
            </Typography>
           
          </Grid>

          <Grid item>
            <HashLink 
              smooth 
              to={"/Contact#top"} 
              style={{
                textDecoration: 'none',
                outline: 'none'
              }}
            >
            <Button variant='raised' color='secondary' style={{ textTransform: "capitalize"}}> 
                Contact Us
              </Button>
            </HashLink>
          </Grid>

        </Grid>
      )
    )
  };

}

export default withRouter(withTheme()(ContactUsSection))
