import * as React from 'react';

import { ReactFC } from '../types';
import { AppContextService, initialValue } from './service';

export const AppContext: React.FC<ReactFC> = ({ children }) => {
  const [isDrawerOpen] = React.useState<boolean>(true);
  return (
    <AppContextService.Provider value={{ ...initialValue, isDrawerOpen }}>
      {children}
    </AppContextService.Provider>
  );
};
