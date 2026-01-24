return {
  "Pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      enabled = true, -- start auto-save when the plugin is loaded
      execution_message = {
        message = function()
          return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
        end,
        cleaning_interval = 1250, -- (milliseconds) clean the message after 1.25s
      },
      trigger_events = { "InsertLeave", "TextChanged" }, -- vim events that trigger auto-save
      -- function that determines whether to save the current buffer or not
      condition = function(buf)
        local fn = vim.fn
        local utils = require("auto-save.utils.data")

        if utils.not_in(fn.getbufvar(buf, "&filetype"), { "oil" }) then
          return true -- met condition, save
        end
        return false -- can't save
      end,
      write_all_buffers = false, -- write all buffers when the current one meets condition
      debounce_delay = 135, -- saves the file at most every 135ms
    })
  end,
}
