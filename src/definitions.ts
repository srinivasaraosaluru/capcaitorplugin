export interface ContactPluginPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  // Code to Add Plugin
  getContacts(filter: string): Promise<{ results: any[]} >;

  getUUID(value: string): Promise<{ value: string }>;
  
}