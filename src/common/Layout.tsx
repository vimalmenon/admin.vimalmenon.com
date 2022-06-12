import * as React from 'react';

import Box from '@mui/material/Box';
import CssBaseline from '@mui/material/CssBaseline';
import { styled } from '@mui/material/styles';
import { ReactFC } from '@types';

import { useAppContext } from '../context';
import { DrawerHeader } from './DrawerHeader';
import { Header } from './Header';
import { Sidebar } from './Sidebar';

const Main = styled('main', { shouldForwardProp: (prop) => prop !== 'open' })<{
  open?: boolean;
  drawerWidth: number;
}>(({ theme, open, drawerWidth }) => ({
  flexGrow: 1,
  padding: theme.spacing(3),
  transition: theme.transitions.create('margin', {
    easing: theme.transitions.easing.sharp,
    duration: theme.transitions.duration.leavingScreen,
  }),
  marginLeft: `-${drawerWidth}px`,
  ...(open && {
    transition: theme.transitions.create('margin', {
      easing: theme.transitions.easing.easeOut,
      duration: theme.transitions.duration.enteringScreen,
    }),
    marginLeft: 0,
  }),
}));

export const Layout: React.FC<ReactFC> = ({ children }) => {
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
