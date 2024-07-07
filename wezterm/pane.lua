local wezterm = require 'wezterm'

local keys = {
        {	
		key = '|',
		mods = 'LEADER|SHIFT',
		action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
	},
	{
		key = '-',
		mods = 'LEADER',
		action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
	},
	{
		key = 'w',
		mods = 'LEADER',
		action = wezterm.action.CloseCurrentPane { confirm = true }
	},
	{
		key = 'h',
		mods = 'ALT',
		action = wezterm.action.ActivatePaneDirection 'Left'
	},
        {
		key = 'j',
		mods = 'ALT',
		action = wezterm.action.ActivatePaneDirection 'Down'
	},
	{
		key = 'k',
		mods = 'ALT',
		action = wezterm.action.ActivatePaneDirection 'Up'
	},
	{
		key = 'l',
		mods = 'ALT',
		action = wezterm.action.ActivatePaneDirection 'Right'
	},
	{
		key = 'r',
		mods = 'LEADER',
		action = wezterm.action.ActivateKeyTable {
			name = 'resize_pane',
			one_shot = false
		}
	},
	{
		key = 's',
		mods = 'LEADER',
		action = wezterm.action.ActivateKeyTable {
			name = 'scroll_pane',
			one_shot = false
		}
	},

	-- global motivation in text 
	{
		key = 'h',
		mods = 'CTRL',
		action = wezterm.action.SendKey { key = 'LeftArrow' }
	},
	{
		key = 'j',
		mods = 'CTRL',
		action = wezterm.action.SendKey { key = 'DownArrow' }
	},
	{
		key = 'k',
		mods = 'CTRL',
		action = wezterm.action.SendKey { key = 'UpArrow' }
	},
	{
		key = 'l',
		mods = 'CTRL',
		action = wezterm.action.SendKey { key = 'RightArrow' }
	}
}

local key_tables = {
	resize_pane = {
		{ key = 'h', action = wezterm.action.AdjustPaneSize { 'Left', 1 } },
   		{ key = 'l', action = wezterm.action.AdjustPaneSize { 'Right', 1 } },
    		{ key = 'k', action = wezterm.action.AdjustPaneSize { 'Up', 1 } },
    		{ key = 'j', action = wezterm.action.AdjustPaneSize { 'Down', 1 } },
    		{ key = 'q', action = 'PopKeyTable' },
  	},
	scroll_pane = {
		{ key = 'k', action = wezterm.action.ScrollByLine(-1) },
		{ key = 'j', action = wezterm.action.ScrollByLine(1) },
		{ key = 'q', action = 'PopKeyTable' }
	}
}

return {keys = keys, key_tables = key_tables}
