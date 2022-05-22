local M = {}

local user_plugins = require "custom.plugins"

M.plugins = {
   options = {
      lspconfig = {
        setup_lspconf = "custom.plugins.lspconfig",
      },

      statusline = {
        separator_style = "round",
      }
   },

   user = user_plugins
}

M.mappings = require "custom.mappings"

M.ui = {
   theme = "gruvbox",
}

return M
