-- XEON NEON: start the locally available game dispatcher.
-- Place XEON_NEON_Loader.lua alongside this script in an executor with readfile support.
if type(readfile) ~= "function" then
    warn("XEON NEON: readfile support required to load local Lua file")
    return
end
local ok, source = pcall(readfile, "XEON_NEON_Loader.lua")
if not ok or type(source) ~= "string" or source == "" then
    warn("XEON NEON: XEON_NEON_Loader.lua not found in executor workspace")
    return
end
local fn, err = loadstring(source)
if not fn then
    warn("XEON NEON: " .. tostring(err))
    return
end
fn()
