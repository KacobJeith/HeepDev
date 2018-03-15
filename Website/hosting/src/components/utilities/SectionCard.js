import React from 'react'
import { Typography, Grid } from 'material-ui'

const SectionCard = (componentProps, wrappedComponent) => {

  const inputs = {
    outerContainer: {
      backgroundImage: componentProps.imagePath !== undefined ? `url(${componentProps.imagePath})` : '',
      backgroundRepeat: 'no-repeat',
      backgroundSize:'cover',
      maxWidth: '100%',
      margin: 0
    }
  };

  return(
    <Grid container style={{...inputs.outerContainer, ...componentProps}} direction ='column' justify="center" alignItems="center">
      <Grid item xs={8}>
        {wrappedComponent}
      </Grid>
    </Grid>
  );
};

export default SectionCard
