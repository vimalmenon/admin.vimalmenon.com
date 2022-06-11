import * as React from 'react';

import { Box } from '@mui/material';
import { ThemeProvider } from '@mui/material/styles';

import { Layout } from './common/Layout';
import { theme } from './theme';

export const App: React.FC = () => {
  return (
    <ThemeProvider theme={theme}>
      <Layout>
        <Box component="main" sx={{ width: '100%', flexGrow: 1, p: { xs: 2, sm: 3 } }}>
          <div>This is App</div>
        </Box>
      </Layout>
    </ThemeProvider>
  );
};
