import * as React from 'react';

import { Box } from '@mui/material';

export const App: React.FC = () => {
  return (
    <Box component="main" sx={{ width: '100%', flexGrow: 1, p: { xs: 2, sm: 3 } }}>
      <div>This is App</div>
    </Box>
  );
};
