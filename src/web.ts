import { WebPlugin } from '@capacitor/core';

import type { ContactPluginPlugin } from './definitions';

export class ContactPluginWeb extends WebPlugin implements ContactPluginPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
