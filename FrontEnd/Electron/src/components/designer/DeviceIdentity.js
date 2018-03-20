import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions_designer'
import { withRouter } from 'react-router-dom'

import { withStyles } from 'material-ui/styles';
import { Grid, Select }  from 'material-ui'

import Input, { InputLabel } from 'material-ui/Input';
import { MenuItem } from 'material-ui/Menu';
import { FormControl, FormHelperText } from 'material-ui/Form';

import { sys_phy_files } from 'HeepDesigner/SystemPHYCompatibilities'
import GenericSelect from './GenericSelect'
import GenericTextInput from './GenericTextInput'
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
    margin: theme.spacing.unit,
    minWidth: 120,
    width: '60%'
  },
  selectEmpty: {
    marginTop: theme.spacing.unit * 2,
  },
});

class DeviceIdentity extends React.Component {

  nameDevice = () => (
    <FormControl className={this.props.classes.formControl}>
      <InputLabel htmlFor="name-input">Name</InputLabel>
      <Input id="name-input" />
      <FormHelperText>Name your Device</FormHelperText>
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
      <FormHelperText>Select the hardware used for this device</FormHelperText>
    </FormControl>

  )

  render () {

    console.log("display icon: ", iconMappings[this.props.icon]);

    var inputs = {
      numControls: {
        defaultValue: 1,
        onChange: (value) => {this.props.updateNumControls(value)},
        options: Array.from(Array(10).keys()),
        title: "Controls"
      },
      deviceName: {
        title: "Device Name",
        defaultValue: "DefaultName",
        onChange: (value) => {this.props.updateDeviceName(value)}
      },
      systemType: {
        title: "Select System Type",
        defaultValue: "Simulation",
        options: Object.keys(sys_phy_files),
        onChange: (value) => {this.props.updateSystemType(value)}
      },
      physicalLayer: {
        title: "Select Physical Layer",
        defaultValue: sys_phy_files[this.props.systemType][0],
        options: Object.keys(sys_phy_files[this.props.systemType]),
        onChange: (value) => {this.props.updatePhysicalLayer(value)}
      },
      ssid: {
        key: 'ssid',
        title: "Enter WiFi SSID",
        defaultValue: '',
        onChange: (value) => {this.props.updateSSID(value)}
      },
      ssidPassword: {
        key: 'ssidpwd',
        title: "Enter WiFi Password",
        defaultValue: '',
        onChange: (value) => {this.props.updateSSIDPassword(value)}
      },
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
      },
      fullWidth: {
        style: {
          width: "100%"
        }
      }
    }

    // var optionalInputs = [];

    // if (this.props.physicalLayer == 'wifi') {
    //   optionalInputs.push(<Row> <div {...inputs.fullWidth}> <GenericTextInput {...inputs.ssid}/> </div> </Row>)
    //   optionalInputs.push(<Row> <div {...inputs.fullWidth}> <GenericTextInput {...inputs.ssidPassword}/> </div> </Row>)
    // }

    return (
      <Grid container direction='column' spacing={24}>
        <Grid item>
          <IconSVGSelect />
        </Grid>
        <Grid item>
          <div {...inputs.iconContainer}>
            <GenericSVG {...inputs.iconSVG}/>
          </div>
        </Grid>
        <Grid item >
          {this.nameDevice()}
        </Grid>
        <Grid item>
          {this.selectSystemType()}
        </Grid>
        <Grid item>
          <GenericSelect {...inputs.physicalLayer}/>
        </Grid>

            
      </Grid>
    );
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)( withStyles(styles)(DeviceIdentity)))
