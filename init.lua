-- ===============================
-- Environment variables (MUST be first)
-- ===============================
local home = os.getenv("HOME")

vim.env.DOTNET_ROOT = home .. "/.dotnet"
vim.env.PATH = vim.env.DOTNET_ROOT .. ":" .. vim.env.PATH

-- Optional: Node (only if Mason needs it)
vim.env.PATH = vim.env.PATH .. ":" .. home .. "/.config/nvm/versions/node/v22.20.0/bin"

-- ===============================
-- Bootstrap LazyVim
-- ===============================
require("config.lazy")
