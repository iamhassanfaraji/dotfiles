local wezterm = require "wezterm"
local utils = require "utils"
local pane = require "pane"

local config = wezterm.config_builder()
config.keys = utils.flatten_list(pane.keys)
config.key_tables = utils.merge_all(pane.key_tables)
config.color_scheme = "Batman"

return config 
