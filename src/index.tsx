import * as React from 'react';

import CssBaseline from '@mui/material/CssBaseline';
import { ThemeProvider } from '@mui/material/styles';
import { createRoot } from 'react-dom/client';
import { BrowserRouter } from 'react-router-dom';

import { App } from './App.widget';
import { AppContext } from './context';
import { theme } from './theme';

const root = createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <ThemeProvider theme={theme}>
      <CssBaseline />

      <BrowserRouter>
        <AppContext>
          <App />
        </AppContext>
      </BrowserRouter>
    </ThemeProvider>
  </React.StrictMode>
);
