local M = {}

--- @param str string
function M.trace(str)
    local info = debug.getinfo(2, "Sl")  -- Get caller info (Stack Level 2)
    print("[" .. info.source .. ":" .. info.currentline .. "] " .. str)
end

--- @param s table|any
function M.debug(s)
    if type(s) == "table" then
        for _,v in pairs(s) do
            v:print()
        end
    else
        M.trace(s)
    end
end

return M
