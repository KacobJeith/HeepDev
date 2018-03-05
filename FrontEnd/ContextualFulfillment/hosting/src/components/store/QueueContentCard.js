import React from 'react'
import { connect } from 'react-redux'
import { Link } from 'react-router-dom'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions'
import {  Grid, 
          Typography,
          MenuItem,
          InputLabel,
          FormControl, 
          TextField,
          IconButton, 
          Badge, 
          Button,
          Paper, 
          Select }   from 'material-ui';
import { AddShoppingCart } from 'material-ui-icons';
import { withStyles, withTheme } from 'material-ui/styles';

var mapStateToProps = (state, ownProps) => ({
  product: state.shopify[ownProps.productID],
  productID: ownProps.productID,
  associatedPlace: state.places[ownProps.placeID],
  quantity: ownProps.quantity,
  titleBar: ownProps.titleBar,

})

const styles = theme => ({
  card: {
    maxWidth: 400,
  }
});

class QueueContentCard extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      hover: false,
      deletionHover: false,
      quantity: props.quantity
    }
  }

  productTitle() {

    return (
      <Link to={'/product/' + this.props.productID}>
        <Typography align='left' variant="body1" gutterBottom paragraph >
          {this.props.product.title}
        </Typography>
      </Link>
    )
  }

  handleChange = event => {
    this.setState({ [event.target.name]: event.target.value });
  };

  handlePlaceUpdate = event => {
    this.props.updateCartContext(this.props.productID, event.target.value);
  }

  associatedPlace() {

    const inputs = {
      formControl: {
        style: {
          margin: this.props.theme.spacing.unit,
          minWidth: 120,
        }
      }
    }



    return (
      <FormControl {...inputs.formControl}>
        <Select
          value={this.props.associatedPlace ? this.props.associatedPlace.name : 'None'}
          onChange={this.handlePlaceUpdate}
          inputProps={{
            name: 'associatedPlace',
            id: 'associated-place',
          }}
          disabled
        >
          <MenuItem value="none">
            <em>None</em>
          </MenuItem>
          <MenuItem  value={this.props.associatedPlace ? this.props.associatedPlace.name : this.props.productID + 'wifi'} key={this.props.productID + 'wifi'}>
            {this.props.associatedPlace ? this.props.associatedPlace.name : this.props.productID + 'wifi'}
          </MenuItem>
        </Select>
      </FormControl>
    )
  }

  productQuantity() {

    const inputs = {
      formControl: {
        style: {
          margin: this.props.theme.spacing.unit,
          minWidth: 120,
        }
      }
    }

    return (
      <TextField
        id="quantity"
        value={this.props.quantity}
        onChange={(event) => {this.props.updateProductQuantity(this.props.lineItemID, event.target.value)}}
        type="number"
        InputLabelProps={{
          shrink: true,
        }}
        margin="normal"
        style={{maxWidth:'80%'}}
        disabled
      />
    )
  }


  imageWithOverlay() {

    const inputs = {
      image: {
        src: this.props.product.images[0].src,
        style: {
          maxHeight: "100%",
          maxWidth: "100%",
          display: 'block',
          margin: 'auto'
        }
      },
      imageAndOverlayContainer: {
        style: {
          height:'100%',
          width:'100%',
          position:'relative'
        }
      },
      overlay: {
        style: {
          backgroundColor:'white',
          opacity: this.state.hover ? 0.15 : 0.0,
          height:'100%',
          position:'absolute',
          top:0,
          width:'100%'
        },
        onMouseEnter: ()=> this.setState({hover: true}),
        onMouseLeave: ()=> this.setState({hover: false})
      },
    }

    return (
      <Link to={'/product/' + this.props.productID}>
        <div {...inputs.imageAndOverlayContainer}> 
          <img {...inputs.image}/>
          <div {...inputs.overlay}/>
        </div>
      </Link>
    )
  }


  titleBarItem = (title) => (
    <Typography variant='body2' align="left">
          {title}
    </Typography>
  )

  programButton = (title) => (
    <Button variant='flat' size='small' color='secondary' onClick={
      () => this.props.downloadSourceForVariant(this.props.productID, this.props.associatedPlace.placeID)
    }>
      Download Source
    </Button>
  )


  render() {

    return (
       <Grid item xs={12} >
         <Grid container alignItems='center' direction='row' justify='space-between' spacing={16} >
           <Grid item xs={2}>
             {this.props.titleBar ? this.titleBarItem() : this.imageWithOverlay() }
           </Grid>

           <Grid item xs={3} >
             {this.props.titleBar ? this.titleBarItem('Product') : this.productTitle()}
           </Grid>

           <Grid item xs={2} >
             {this.props.titleBar ? this.titleBarItem('Place') : this.associatedPlace()}
           </Grid>


           <Grid item xs={1} >
             {this.props.titleBar ? this.titleBarItem('Quantity') : this.productQuantity()}
           </Grid>

           <Grid item xs={2} >
             {this.props.titleBar ? this.titleBarItem('Program') : this.programButton()}
           </Grid>

         </Grid>
      </Grid>
    )
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(withTheme()(withStyles(styles)(QueueContentCard)))

