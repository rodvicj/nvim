-- Configuration for Arduino Language Server
local arduino_server = require('lspconfig').arduino.setup {
  filetypes = { 'ino', 'pde' },
  cmd = { 'arduino-language-server', '--stdio' }, -- Start the server
  settings = {
    arduino = {
      arduinoPath = '/Applications/Arduino.app/Contents/MacOS/Arduino',
      board = 'arduino:avr:uno',
      libraryPaths = {
        '/path/to/arduino/libraries',
        '/path/to/custom/libraries'
      },
      sketchPath = '/path/to/your/sketch'
    }
  },
  -- Optional: Customize language server features
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true,
        }
      }
    }
  },
}
