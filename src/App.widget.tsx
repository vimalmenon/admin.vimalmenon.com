import * as React from 'react';

import { ThemeProvider } from '@mui/material/styles';
import { Routes, Route } from 'react-router-dom';

import { Layout } from './common/Layout';
import { Home, Setting } from './pages';
import { theme } from './theme';

export const App: React.FC = () => {
  return (
    <ThemeProvider theme={theme}>
      <Layout>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/setting" element={<Setting />} />
        </Routes>
      </Layout>
    </ThemeProvider>
  );
};
