import * as React from 'react';

import { ReactChildren } from '@types';

import { AppContextService, initialValue } from './service';

export const AppContext: React.FC<ReactChildren> = ({ children }) => {
  const [isDrawerOpen, setDrawerOpen] = React.useState<boolean>(true);
  const toggleDrawerOpen = () => setDrawerOpen(!isDrawerOpen);

  return (
    <AppContextService.Provider value={{ ...initialValue, isDrawerOpen, toggleDrawerOpen }}>
      {children}
    </AppContextService.Provider>
  );
};
