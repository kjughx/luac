local M = {}

--- Class Factory
-- Creates a new class with the given name and fields.
-- @function M.class
-- @param name string The name of the class.
-- @param fields table A table containing the fields for the class.
-- @return table The class table with `new` and `print` methods.
function M.class(name, fields)
    local cls = {}
    cls.__index = cls

    --- Prints the object in a string format.
    -- @function cls:print
    -- @return void
    function cls:print()
        local str = name .. " { "
        for _, field in ipairs(fields) do
            str = str .. field .. " = " .. tostring(self[field]) .. ", "
        end
        str = str:sub(1, -3) .. " }"
        print(str)
    end

    return cls
end

return M
