-- return {
--   init_options = {
--     provideFormatter = false,
--   },
--   settings = {
--     json = {
--       schemas = require("schemastore").json.schemas(),
--     },
--   },
-- }
-- lsp/jsonls.lua

local ok, schemastore = pcall(require, "schemastore")

return {
  init_options = {
    provideFormatter = false,
  },
  settings = {
    json = {
      schemas = ok and schemastore.json.schemas() or {},
      validate = { enable = true },
    },
  },
}
