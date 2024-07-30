--Basic
require("config.cfg")
require("config.lazy")
require("config.colors")
require("config.mappings")

--Plugins
require("plugins.lsp")
require("plugins.cmp")
require("plugins.snipets")
-- require("plugins.mason")

require("plugins.comments")
require("plugins.undotree")
require("plugins.telescope")
require("plugins.treesitter")

--autocmd({"BufWritePre"}, {
--    pattern = "*",
--    command = [[%s/\s\+$//e]],
--})
