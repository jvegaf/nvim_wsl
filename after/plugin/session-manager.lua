local present, session = pcall(require, "session_manager")

if not present then
  return
end

local config = require("session_manager.config")

local Path = require "plenary.path"
session.setup {
  sessions_dir = Path:new(vim.fn.stdpath "data", "sessions"), -- The directory where the session files will be saved.
  -- path_replacer = "__", -- The character to which the path separator will be replaced for session files.
  -- colon_replacer = "++", -- The character to which the colon symbol will be replaced for session files.
  autoload_mode = config.AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
}
