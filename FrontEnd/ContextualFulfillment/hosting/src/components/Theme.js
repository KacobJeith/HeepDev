import { createMuiTheme } from 'material-ui/styles';
import bluegrey from 'material-ui/colors/blueGrey';
import cyan from 'material-ui/colors/cyan';

const Theme = createMuiTheme({
  palette: {
    primary: {
      main: bluegrey[700]
    },
    secondary: {
      main: cyan[500]
    },
  },
  typography: {
    htmlFontSize: 11,
    fontSize: 10
  }
});

export default Theme;
