local opts = {
    suggestion = {
        auto_trigger = true,
        debounce = 150,
        keymap = {
          accept = "<C-l>",
          accept_word = false,
          accept_line = false,
          next = "<C-.>",
          prev = "<C-,>",
          dismiss = "<C/>",
        },
      }
  }
return opts
