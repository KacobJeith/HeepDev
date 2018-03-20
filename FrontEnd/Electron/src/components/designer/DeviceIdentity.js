import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions_designer'
import { withRouter } from 'react-router-dom'

import { withStyles } from 'material-ui/styles';
import { Grid, Select, Collapse, Paper }  from 'material-ui'

import Input, { InputLabel } from 'material-ui/Input';
import { MenuItem } from 'material-ui/Menu';
import { FormControl, FormHelperText } from 'material-ui/Form';

import { sys_phy_files } from 'HeepDesigner/SystemPHYCompatibilities'
import GenericSelect from '../utilities/GenericSelect'
import GenericTextInput from '../utilities/GenericTextInput'
import IconSVGSelect from './IconSVGSelect'
import {iconMappings} from '../../assets/svg/iconMappings'
import GenericSVG from './GenericSVG'

var mapStateToProps = (state, ownProps) => ({
  deviceName: state.designer.deviceName,
  systemType: state.designer.systemType,
  physicalLayer: state.designer.physicalLayer,
  controls: state.designer.controls,
  icon: state.designer.iconSelected
})

const styles = theme => ({
  root: {
    display: 'flex',
    flexWrap: 'wrap',
  },
  formControl: {
    minWidth: 120,
    width: '60%'
  },
  formControlSimple: {
  },
  selectEmpty: {
    marginTop: theme.spacing.unit * 2,
  },
});

class DeviceIdentity extends React.Component {

  nameDevice = () => (
    <FormControl className={this.props.classes.formControl}>
      <InputLabel htmlFor="name-input">Device Name</InputLabel>
      <Input id="name-input"  
        onChange={ (event) => {this.props.updateDeviceName(event.target.value)}}/>

    </FormControl>
  )

  selectSystemType = () => (

    <FormControl className={this.props.classes.formControl}>
      <InputLabel htmlFor="type-helper">System Type</InputLabel>
      <Select
        value={this.props.systemType}
        onChange={ (event) => {this.props.updateSystemType(event.target.value)}}
        input={<Input name="type-helper" id="type-helper" />}
      >
        {Object.keys(sys_phy_files).map((thisKey) => (
          <MenuItem value={thisKey} key={thisKey}>{thisKey}</MenuItem>
        ))}
      </Select>
    </FormControl>

  )

  inputWifiCredentials = () => (

    <Collapse in={this.props.physicalLayer == 'wifi'} timeout={750} unmountOnExit>

      <GenericTextInput 
        width='33%'
        title='SSID'
        onChange={(event) => {this.props.updateSSID(event.target.value)}}
        helperText='WiFi Network Name'
      />
      <GenericTextInput 
        width='33%'
        title='Password'
        onChange={(event) => {this.props.updateSSIDPassword(event.target.value)}}
        helperText='WiFi Password'
      />
      
    </Collapse>
  )

  render () {

    var inputs = {
      iconSVG: {
        height: 150,
        width: 150,
        iconName: iconMappings[this.props.icon]
      },
      iconContainer: {
        style: {
          backgroundColor: "white",
          border: "10px solid white",
          borderRadius: 5,
          cursor: "pointer",
          display: "flex",
          justifyContent: "center",
          width: 170,
          height: 170,
          margin: "auto"
        },
        onClick: () => {this.props.openIconModal()}
      }
    }

    return (
      <Grid container spacing={24}>
        <Grid item xs={5}>
          <Paper>
            <GenericSVG {...inputs.iconSVG}/>
          </Paper>
        </Grid>
        <Grid item xs={7}>
          <Grid container direction='column' spacing={24}>
            <Grid item >
              {this.nameDevice()}
            </Grid>
            <Grid item>
              {this.selectSystemType()}
            </Grid>
            <Grid item>

              {this.inputWifiCredentials()}
            </Grid>
          </Grid>
        </Grid>
      </Grid>
    );
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)( withStyles(styles)(DeviceIdentity)))
