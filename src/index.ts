import { registerPlugin } from '@capacitor/core';

import type { ContactPluginPlugin } from './definitions';

const ContactPlugin = registerPlugin<ContactPluginPlugin>('ContactPlugin', {
  web: () => import('./web').then(m => new m.ContactPluginWeb()),
});

export * from './definitions';
export { ContactPlugin };
