import React from 'react';

import { Box } from '@mui/material';

export const Home: React.FC = () => {
  return (
    <Box component="main" sx={{ width: '100%', flexGrow: 1, p: { xs: 1} }}>
      <div>This is App</div>
    </Box>
  );
};
