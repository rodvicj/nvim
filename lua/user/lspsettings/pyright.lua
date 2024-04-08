return {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
        diagnosticMode = "workspace",
        inlayHints = {
          variableTypes = true,
          functionReturnTypes = true,
        },
      },
    },
  },
}
