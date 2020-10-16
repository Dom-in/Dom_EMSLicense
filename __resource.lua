resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

author 'Dominik'
server_scripts {
  '@mysql-async/lib/MySQL.lua',
  '@es_extended/locale.lua',
  'server.lua',
  'config.lua',
  'versioncheck.lua',
  'locales/pl.lua',
  'locales/en.lua'
}
client_scripts {
  '@es_extended/locale.lua',
  'locales/pl.lua',
  'config.lua',
  'client.lua',
  'locales/en.lua'
}