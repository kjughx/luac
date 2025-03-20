local M = {}

--- @function lex
--- @param path string path to file
--- @return table
function M.lex(path)
    local tokens = {}

    local function peek(n)

    end

    local file = io.open(path, "r")
    if file == nil then
        error("Could not open file: main.c")
    end

    while true do

    end

    return tokens
end

return M
