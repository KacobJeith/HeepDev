import { createMuiTheme } from 'material-ui/styles';
import bluegrey from 'material-ui/colors/blueGrey';
import blue from 'material-ui/colors/blue';

const Theme = createMuiTheme({
  palette: {
    primary: {
      main: bluegrey[700]
    },
    secondary: blue
  },
  typography: {
    htmlFontSize: 10,
  }
});

export default Theme;
