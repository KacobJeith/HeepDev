import React from 'react'
import { Grid } from 'material-ui'

const SplitSectionCard = (componentProps, richContent) => {

  const inputs = {
    imageContainer: {
      backgroundImage: componentProps.imagePath !== undefined ? `url(${componentProps.imagePath})` : '',
      backgroundRepeat: 'no-repeat',
      backgroundSize:'cover',
      maxWidth: '100%',
      margin: 0,
    }
  };

  return(
    <Grid container spacing={0} justify='center' alignItems='center' style={{...componentProps}}>
      <Grid item xs={6}>
        {componentProps.imageSide == 'left' ? <div style={{...inputs.imageContainer, ...componentProps}}/> : richContent}
      </Grid>
      <Grid item xs={6}>
        {componentProps.imageSide == 'right' ? <div style={{...inputs.imageContainer, ...componentProps}}/> : richContent}
      </Grid>
    </Grid>
  );
};

export default SplitSectionCard
