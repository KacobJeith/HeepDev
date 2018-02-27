import { createMuiTheme } from 'material-ui/styles';
import blue from 'material-ui/colors/blue';

const Theme = createMuiTheme({
  palette: {
    primary: {
      main: '#616161',
      light: '#8e8e8e',
      dark: '#373737'
    },
    secondary: blue
  },
  typography: {
    htmlFontSize: 10,
  }
});

export default Theme;
