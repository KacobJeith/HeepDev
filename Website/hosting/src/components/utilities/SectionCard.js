import React from 'react'
import { Grid } from 'material-ui'

const SectionCard = (componentProps, wrappedComponent) => {

  const inputs = {
    outerContainer: {
      backgroundImage: componentProps.imagePath !== undefined ? `url(${componentProps.imagePath})` : '',
      backgroundRepeat: 'no-repeat',
      backgroundSize:'cover',
      maxWidth: '100%',
      margin: 0,
      overflowX: 'hidden',
    }
  };

  return(
    <div style={{...inputs.outerContainer, ...componentProps}}>
      <Grid container justify='center'>
        {wrappedComponent}
      </Grid>
    </div>
  );
};

export default SectionCard
