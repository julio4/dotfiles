local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {

   -- webdev stuff
   b.formatting.prettier.with { filetypes = { "html", "markdown", "css", "json", "yaml" } },
   b.code_actions.eslint,
   b.diagnostics.eslint,
   b.formatting.eslint,

   -- python
   b.diagnostics.pylint,

   -- solidity
   b.diagnostics.solhint,

   -- English
   b.diagnostics.write_good,

}

local M = {}

M.setup = function()
   null_ls.setup {
      debug = true,
      sources = sources,
   }
end

return M
