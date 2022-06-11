import * as React from 'react';

import { Box, Drawer as MuiDrawer } from '@mui/material';

export const Drawer: React.FC = () => {
  return (
    <Box component="nav" sx={{ flexShrink: { md: 0 }, zIndex: 1300 }} aria-label="mailbox folders">
      <MuiDrawer
        variant="temporary"
        ModalProps={{
          keepMounted: true,
        }}
      />
    </Box>
  );
};
