import React from 'react'
import { Grid } from 'material-ui'

const imageSection = (inputs, componentProps) => (
  <div style={{position: 'relative', width: '100%', }}>
    <div style={{...inputs.imageContainer, ...componentProps}}/>
    <div style={{
      width: '100%', 
      height: '100%', 
      position: 'absolute', 
      top: 0, 
      left: 0, 
      backgroundColor: 'rgba(0,0,0,0.5)'
    }}/>
  </div>
)

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
        {componentProps.imageSide == 'left' ? imageSection(inputs, componentProps) : richContent}
      </Grid>
      <Grid item sm={6} xs={10} style={{overflow: 'hidden'}}>
        {componentProps.imageSide == 'right' ? imageSection(inputs, componentProps) : richContent}
      </Grid>
    </Grid>
  );
};

export default SplitSectionCard
