import React, { ReactNode } from 'react';

import MuiAppBar from '@mui/material/AppBar';
import { useTheme } from '@mui/material/styles';

interface AppBarProps {
  position: 'fixed' | 'absolute' | 'relative' | 'static' | 'sticky';
  open: boolean;
  drawerWidth: number;
  children?: ReactNode;
}

export const AppBar: React.FC<AppBarProps> = ({ position, open, drawerWidth, children }) => {
  const theme = useTheme();
  const sx = {
    transition: theme.transitions.create(['margin', 'width'], {
      easing: theme.transitions.easing.sharp,
      duration: theme.transitions.duration.leavingScreen,
    }),
    ...(open && {
      width: `calc(100% - ${drawerWidth}px)`,
      marginLeft: `${drawerWidth}px`,
      transition: theme.transitions.create(['margin', 'width'], {
        easing: theme.transitions.easing.easeOut,
        duration: theme.transitions.duration.enteringScreen,
      }),
    }),
  };
  return (
    <MuiAppBar position={position} sx={sx}>
      {children}
    </MuiAppBar>
  );
};
