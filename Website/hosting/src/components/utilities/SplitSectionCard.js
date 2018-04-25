import React from 'react'
import { Grid } from 'material-ui'

const SplitSectionCard = (componentProps, richContent) => {

  const inputs = {
    imageContainer: {
      backgroundImage: componentProps.imagePath !== undefined ? `url(${componentProps.imagePath})` : '',
      backgroundRepeat: 'no-repeat',
      backgroundPosition: 'center',
      backgroundSize:'cover',
      maxWidth: '100%',
      margin: 'auto',
    }
  };

  return(
    <Grid container spacing={0} justify='center' alignItems='center' style={{...componentProps}}>
      <Grid item sm={6} xs={10} style={{overflow: 'hidden'}}>
        {componentProps.imageSide == 'left' ? <div style={{...inputs.imageContainer, ...componentProps}}/> : richContent}
      </Grid>
      <Grid item sm={6} xs={10} style={{overflow: 'hidden'}}>
        {componentProps.imageSide == 'right' ? <div style={{...inputs.imageContainer, ...componentProps}}/> : richContent}
      </Grid>
    </Grid>
  );
};

export default SplitSectionCard
