import React from 'react'
import { Link } from 'react-router-dom'
import { Button }   from 'material-ui'

export const buttonLink = (text, path, float = 'right') => (
    <Link to={path} style={{textDecoration: 'none', float: float}}>
      <Button variant='raised' color="primary">
        {text}
      </Button>
    </Link>
  )