import * as React from 'react';

import { ReactFC } from '../types';
import { AppContextService, initialValue } from './service';

export const AppContext: React.FC<ReactFC> = ({ children }) => {
  return (
    <AppContextService.Provider value={{ ...initialValue }}>{children}</AppContextService.Provider>
  );
};
