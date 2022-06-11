import { createTheme } from '@mui/material/styles';

import { Typography } from './typography';

export const theme = createTheme({
  typography: Typography,
  breakpoints: {
    values: {
      xs: 0,
      sm: 768,
      md: 1024,
      lg: 1266,
      xl: 1536,
    },
  },
  mixins: {
    toolbar: {
      minHeight: 60,
      paddingTop: 8,
      paddingBottom: 8,
    },
  },
  direction: 'ltr',
  palette: {},
});
