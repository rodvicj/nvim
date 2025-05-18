return {
  settings = {
    pyright = {
      disableOrganizeImports = true, -- Using Ruff
    },
    python = {
      analysis = {
        ignore = { "*" }, -- Using Ruff
        -- typeCheckingMode = "off", -- Using mypy
      },
    },
  },
}

-- return {
--   settings = {
--     python = {
--       analysis = {
--         typeCheckingMode = "off",
--         diagnosticMode = "workspace",
--         inlayHints = {
--           variableTypes = true,
--           functionReturnTypes = true,
--         },
--       },
--     },
--   },
-- }

