return {
  settings = {
    pyright = {
      disableOrganizeImports = true,
      disableTaggedHints = true,
    },
    python = {
      analysis = {
        diagnosticSeverityOverrides = {
          -- https://github.com/microsoft/pyright/blob/main/docs/configuration.md#type-check-diagnostics-settings
          reportUndefinedVariable = "none",
        },
      },
    },
  },
}

-- return {
--   settings = {
--     pyright = {
--       disableOrganizeImports = true, -- Using Ruff
--     },
--     python = {
--       analysis = {
--         ignore = { "*" }, -- Using Ruff
--         -- typeCheckingMode = "off", -- Using mypy
--       },
--     },
--   },
-- }


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
