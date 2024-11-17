local M = {
  "mireq/large_file",
}

function M.config()
  require("large_file").setup {
    size_limit = 10 * 1024 * 1024, -- 10 MB
    buffer_options = {
      swapfile = false,
      bufhidden = "delete",
      buftype = "nowrite",
      undolevels = 0,
    },
    on_large_file_read_pre = function(ev)
      print "Opening a large file!"
    end,
  }
end

return M
