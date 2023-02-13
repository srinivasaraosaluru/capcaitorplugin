export interface ContactPluginPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
