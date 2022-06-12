import * as React from 'react';

import ChevronLeftIcon from '@mui/icons-material/ChevronLeft';
import ChevronRightIcon from '@mui/icons-material/ChevronRight';
import IconButton from '@mui/material/IconButton';
import Toolbar from '@mui/material/Toolbar';
import Typography from '@mui/material/Typography';

import { useAppContext } from '../context';
import { AppBar } from './AppBar';

export const Header: React.FC = () => {
  const { drawerWidth, isDrawerOpen, toggleDrawerOpen } = useAppContext();
  return (
    <AppBar position="fixed" open={isDrawerOpen} drawerWidth={drawerWidth}>
      <Toolbar>
        <IconButton
          color="inherit"
          aria-label="open drawer"
          onClick={toggleDrawerOpen}
          edge="start"
          sx={{ mr: 2 }}
        >
          {isDrawerOpen ? <ChevronLeftIcon /> : <ChevronRightIcon />}
        </IconButton>
        <Typography variant="h6" noWrap component="div"></Typography>
      </Toolbar>
    </AppBar>
  );
};
