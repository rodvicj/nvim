local M = {
  "pteroctopus/faster.nvim",
}

function M.config()
  -- default config
  require("faster").setup {
    -- Behaviour table contains configuration for behaviours faster.nvim uses
    behaviours = {
      -- Bigfile configuration controls disabling and enabling of features when
      -- big file is opened
      bigfile = {
        -- Behaviour can be turned on or off. To turn on set to true, otherwise
        -- set to false
        on = true,
        -- Table which contains names of features that will be disabled when
        -- bigfile is opened. Feature names can be seen in features table below.
        -- features_disabled can also be set to "all" and then all features that
        -- are on (on=true) are going to be disabled for this behaviour
        features_disabled = {
          "illuminate",
          "matchparen",
          "lsp",
          "treesitter",
          "indent_blankline",
          -- "vimopts",
          "syntax",
          -- "filetype",
        },
        -- Files larger than `filesize` are considered big files. Value is in MB.
        filesize = 2,
        -- Autocmd pattern that controls on which files behaviour will be applied.
        -- `*` means any file.
        pattern = "*",
        -- Optional extra patterns and sizes for which bigfile behaviour will apply.
        -- Note! that when multiple patterns (including the main one) and filesizes
        -- are defined: bigfile behaviour will be applied for minimum filesize of
        -- those defined in all applicable patterns for that file.
        -- extra_pattern example in multi line comment is bellow:
        --[[
      extra_patterns = {
        -- If this is used than bigfile behaviour for *.md files will be
        -- triggered for filesize of 1.1MiB
        { filesize = 1.1, pattern = "*.md" },
        -- If this is used than bigfile behaviour for *.log file will be
        -- triggered for the value in `behaviours.bigfile.filesize`
        { pattern  = "*.log" },
        -- Next line is invalid without the pattern and will be ignored { filesize = 3 },
      },
      ]]
        -- By default `extra_patterns` is an empty table: {}.
        extra_patterns = {},
      },
      -- Fast macro configuration controls disabling and enabling features when
      -- macro is executed
      fastmacro = {
        -- Behaviour can be turned on or off. To turn on set to true, otherwise
        -- set to false
        on = true,
        -- Table which contains names of features that will be disabled when
        -- macro is executed. Feature names can be seen in features table below.
        -- features_disabled can also be set to "all" and then all features that
        -- are on (on=true) are going to be disabled for this behaviour.
        -- Specificaly: lualine plugin is disabled when macros are executed because
        -- if a recursive macro opens a buffer on every iteration this error will
        -- happen after 300-400 hundred iterations:
        -- `E5108: Error executing lua Vim:E903: Process failed to start: too many open files: "/usr/bin/git"`
        features_disabled = { "lualine" },
      },
    },
  }
end

return M
