import React from 'react'
import { Typography, Grid } from 'material-ui'

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
      {wrappedComponent}
    </div>
  );
};

export default SectionCard
