
local path = minetest.get_modpath("advanced_npc")

-- Load SmartFS library by rubenwardy
dofile(path .. "lib/smartfs.lua")

-- Intllib
local S
if minetest.get_modpath("intllib") then
	S = intllib.Getter()
else
	S = function(s, a, ...)
		if a == nil then
			return s
		end
		a = {a, ...}
		return s:gsub("(@?)@(%(?)(%d+)(%)?)",
			function(e, o, n, c)
				if e == ""then
					return a[tonumber(n)] .. (o == "" and c or "")
				else
					return "@" .. o .. n .. c
				end
			end)
	end
end
mobs.intllib = S

-- NPC
dofile(path .. "/npc.lua")
dofile(path .. "/chat.lua")
--dofile(path .. "/trader.lua")

print (S("[MOD] Advanced NPC loaded"))
