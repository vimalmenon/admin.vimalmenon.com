import * as React from 'react';

import Box from '@mui/material/Box';
import CssBaseline from '@mui/material/CssBaseline';
import { ReactChildren } from '@types';

import { useAppContext } from '../context';
import { DrawerHeader } from './DrawerHeader';
import { Header } from './Header';
import { Main } from './Main';
import { Sidebar } from './Sidebar';

export const Layout: React.FC<ReactChildren> = ({ children }) => {
  const { drawerWidth, isDrawerOpen } = useAppContext();
  return (
    <Box sx={{ display: 'flex' }}>
      <CssBaseline />
      <Header />
      <Sidebar />
      <Main open={isDrawerOpen} drawerWidth={drawerWidth}>
        <DrawerHeader />
        {children}
      </Main>
    </Box>
  );
};
