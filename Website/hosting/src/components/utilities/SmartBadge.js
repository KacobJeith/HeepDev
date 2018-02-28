import React from 'react'
import {Badge}   from 'material-ui'

const wrapHOC = (count, WrappedComponent) => {

	return (
		<div>
		{count > 0 ? 
	            (<Badge color="primary" badgeContent={count}>
	              {WrappedComponent}
	            </Badge>)
            : WrappedComponent
          }
          </div>
          )
}

export default wrapHOC