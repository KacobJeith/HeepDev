import React from 'react'
import { Typography, Grid } from 'material-ui'

const SectionCard = (componentProps, wrappedComponent) => {

  const inputs = {
    outerContainer: {
      style: {
        backgroundColor: componentProps.backgroundColor,
        backgroundImage: `url(${componentProps.imagePath})`,
        backgroundRepeat: 'no-repeat',
        backgroundSize:'cover',
        minHeight: componentProps.containerHeight,
        maxWidth: '100%',
        paddingTop: componentProps.paddingTop,
        paddingBottom: componentProps.paddingBottom,
        margin: 0
      }
    }
  };

  return(
    <Grid container {...inputs.outerContainer} direction ='column' justify="center" alignItems="center">
      <Grid item xs={8}>
        {wrappedComponent}
      </Grid>
    </Grid>
  );
};

export default SectionCard
