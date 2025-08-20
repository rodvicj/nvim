return {
  settings = {
    basedpyright = {
      analysis = {
        inlayHints = {
          variableTypes = true, -- Show inlay hints for variable types
          callArgumentNames = true, -- Show inlay hints for function argument names
          functionReturnTypes = true, -- Show inlay hints for function return types
          genericTypes = true, -- Show inlay hints for inferred generic types
        },
      },
    },
  },
}
