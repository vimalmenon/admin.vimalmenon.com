import React, { ReactNode } from 'react';

import { useTheme } from '@mui/material/styles';
import { Box } from '@mui/system';

interface IMain {
  open: boolean;
  drawerWidth: number;
  children: ReactNode;
}
export const Main: React.FC<IMain> = ({ children, open, drawerWidth }) => {
  const theme = useTheme();
  const sx = {
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
  };
  return (
    <Box component={'section'} sx={sx}>
      {children}
    </Box>
  );
};
