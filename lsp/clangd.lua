return {
  capabilities = {
    offsetEncoding = { "utf-16" },
  },
  cmd = {
    "clangd",
    "--fallback-style=webkit",
  },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
}
