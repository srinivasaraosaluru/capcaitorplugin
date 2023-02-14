import { WebPlugin } from '@capacitor/core';

import type { ContactPluginPlugin } from './definitions';

export class ContactPluginWeb extends WebPlugin implements ContactPluginPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }

  async getUUID(value: string): Promise<{ value: string }> {
    console.log('ECHO', value);
    return {value:value};
  }
  
  async getContacts(filter: string): Promise<{ results: any[]} > {
    console.log('Filter', filter);
    return {
      results:[
        {
          firstName: 'Dummy',
          lastName: 'Entry',
          telephone: '123456'
        }
      ]
    };
  }
  
}
