return {
  settings = {
    basedpyright = {
      -- -- NOTE: use pyrightconfig.json instead;

      -- analysis = {
      --   diagnosticSeverityOverrides = {
      --     reportAny = false,
      --     reportUnusedCallResult = false,
      --     reportMissingTypeArgument = false,
      --     reportMissingParameterType = false,
      --     reportUnknownArgumentType = false,
      --     reportUnknownLambdaType = false,
      --     reportUnknownMemberType = false,
      --     reportUnknownParameterType = false,
      --     reportUnknownVariableType = false,
      --     reportConstantRedefinition = false,
      --     reportUnusedImport = false,
      --   },

        inlayHints = {
          variableTypes = true, -- Show inlay hints for variable types
          callArgumentNames = true, -- Show inlay hints for function argument names
          functionReturnTypes = true, -- Show inlay hints for function return types
          genericTypes = true, -- Show inlay hints for inferred generic types
        },
      },
    },
  }
