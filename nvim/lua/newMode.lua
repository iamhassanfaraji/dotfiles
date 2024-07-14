local keymaps = {}
local activitiesState = {
	createdmodes= {},
	activeMode= "",
	exitCommand= "<C-Bslash><C-n>"
}

local function unmapMode()
	for _,v in pairs(keymaps[activitiesState.activeMode].keymaps) do
		vim.cmd.nunmap(v[2])
	end
end

local function activeKeymapOfMode(trigger)
	local function active()
		local targetSubmode = keymaps[trigger]
		for _,v in pairs(targetSubmode.keymaps) do 
			vim.keymap.set(unpack(v))
		end
		activitiesState.activeMode = trigger
		vim.keymap.set("n", activitiesState.exitCommand, unmapMode)
		print("-- "..targetSubmode.modeName.." --")
	end
	return active
end

local set = vim.deepcopy(vim.keymap.set)
local function setKeymapOfMode(mode, lhs, rhs, opts)
	local isCustomMode = false
	for _,v in pairs(activitiesState.createdmodes) do
		if ( v == mode )then
			isCustomMode = true
			break
		end
	end
	if(isCustomMode)then
		local targetKeymaps = keymaps[mode].keymaps
		table.insert(targetKeymaps, {"n", lhs, rhs, opts})
		keymaps[mode].keymaps = targetKeymaps
	else
		set(mode, lhs, rhs, opts)
	end
end

local function create(modeName, trigger)
	keymaps[trigger] = {
		modeName = modeName,
		keymaps = {}
	}
	table.insert(activitiesState.createdmodes, trigger)
	vim.keymap.set("n", trigger, activeKeymapOfMode(trigger))
end

local function getKeys(t)
  local keys={}
  for key,_ in pairs(t) do
    table.insert(keys, key)
  end
  return keys
end 

local function proSet(mode, lhs, rhs, opts)
	if (type(mode) == "string") then
		setKeymapOfMode(mode, lhs, rhs,  opts)
	elseif (type(mode) == "table") then
		for _,m in pairs(mode) do
			setKeymapOfMode(m, lhs, rhs, opts)
		end
	else
		print("type error in set map")
	end
end

module = {}
function module.setup(exitCommand)
	activitiesState.exitCommand = exitCommand
	vim.keymap["createMode"] = create
	vim.keymap.set = proSet
end

return module
