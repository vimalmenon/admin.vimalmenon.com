import * as React from 'react';

import { IAppContext } from './context';

export const initialValue: IAppContext = {
  drawerWidth: 240,
  isDrawerOpen: false,
};

export const AppContextService = React.createContext<IAppContext>(initialValue);

export const useAppContext = () => React.useContext(AppContextService);
