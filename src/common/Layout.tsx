import * as React from 'react';

import Box from '@mui/material/Box';
import CssBaseline from '@mui/material/CssBaseline';

import { ReactFC } from '../types';
import { Header } from './Header';

export const Layout: React.FC<ReactFC> = ({ children }) => {
  return (
    <Box sx={{ display: 'flex' }}>
      <CssBaseline />
      <Header />
      {children}
    </Box>
  );
};
