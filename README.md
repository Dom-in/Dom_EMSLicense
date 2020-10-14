###|Dom_EMSLicense

#### Installation Guide
1. Clone the repository or download the [latest version](../../releases/latest).
2. Place inside your server's `resources` directory.
3. Start script in server.cfg ``
6. Enjoy!

#### Convars
| Convar              | Parameters        | Function                                                                                                              | Example Usage                | Default State |
|---------------------|-------------------|-----------------------------------------------------------------------------------------------------------------------|------------------------------|---------------|
| `els_outputLoading` | string as boolean | This outputs the loaded vehicles that have been specified in the vcf.lua                                              | `set els_outputLoading true` | "false"       |
| `els_debug`         | string as boolean | This prints information to both client or server with information of what is happening                                | `set els_debug true`         | "false"       |
| `els_developer`     | string as boolean | Provides access to developer features which may break ELS for clients on your server, should only be used when asked. | `set els_developer`          | "false"       |
