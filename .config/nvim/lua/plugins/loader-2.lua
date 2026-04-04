---------------------------------------------------------------------------
-- Install Package Manager
---------------------------------------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

---------------------------------------------------------------------------
-- Dynamic Plugin Discovery
---------------------------------------------------------------------------

local function get_plugin_files(directory)
  local plugins = {}
  local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins/" .. directory

  if vim.fn.isdirectory(plugin_dir) == 0 then
    return plugins
  end

  local files = vim.fn.glob(plugin_dir .. "/*.lua", false, true)

  for _, file in ipairs(files) do
    local filename = vim.fn.fnamemodify(file, ":t:r")
    table.insert(plugins, { import = "plugins." .. directory .. "." .. filename })
  end

  return plugins
end

local plugin_categories = {
  "ui",
  "editor",
  "navigation",
  "lsp",
  "ai",
  -- "git",
  -- "terminal",
  -- "ai",
  -- "testing",
}

local plugin_spec = {}

for _, category in ipairs(plugin_categories) do
  local category_plugins = get_plugin_files(category)
  for _, plugin in ipairs(category_plugins) do
    table.insert(plugin_spec, plugin)
  end
end

---------------------------------------------------------------------------
-- Plugin Setup with Dynamic Loading
---------------------------------------------------------------------------

local disabled_built_in_plugins = {
  "gzip",
  "tarPlugin",
  "zipPlugin",
  "tohtml",
  "tutor",
  "netrwPlugin",
}

require("lazy").setup({
  spec = plugin_spec,
  ui = { border = "rounded" },
  performance = {
    rtp = {
      disabled_plugins = disabled_built_in_plugins,
    },
  },
})
