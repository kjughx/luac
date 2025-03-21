local class = require("utils.class")
local M = {}

--- @class String
--- @field str string
--- @field idx integer
--- @field _len integer
M.String = class.class("String", { "str", "idx", "_len"})

--- @param str string
function M.String:new(str)
    assert(string)

    self.str = str
    self.idx = 1
    self._len = str:len()

    return self
end

--- @return string
function M.String:view()
    return string.sub(self.str, self.idx, self._len)
end

--- @return string
function M.String:peek()
    return string.sub(self.str, self.idx, self.idx)
end

--- @param n integer?
--- @return string?
function M.String:advance(n)
    if self:len() == 0 then
        return nil
    end

    n = n or 0
    local c = string.sub(self.str, self.idx, self.idx + n + 1)
    self.idx = self.idx + n + 1

    return c
end

function M.String:trim()
    while M.is_whitespace(self:peek()) do
        self:advance()
    end
end

--- @return string
function M.String:word()
    local w = self:view():match("%w+")
    print(w)
    self:advance(w:len())
    self:trim()

    return w
end

--- @param str string|String
--- @return boolean
function M.String:starts_with(str)
    if type(str) == "String" then
        str = str.str
    end

    return string.sub(self.str, self.idx, self.idx + str:len()) == str
end

--- @param str string
--- @return any
function M.String:match(str)
    return self.str:match(str)
end

--- @return integer
function M.String:len()
    return string.sub(self.str, self.idx, self.idx + self._len):len()
end

--- @return String
function M.String:until_whitespace()
    local idx = self.idx
    local c = self:peek()

    while not M.is_whitespace(c) do
        local _c = self:advance()
        print("CCCCCCCCCC" .. _c)
        if not c then
            break
        end
        c = tostring(_c)
    end

    return M.String:new(string.sub(self.str, idx, self.idx))
end

--- @param char string?
function M.is_whitespace(char)
    if not char then
        return false
    end

    return char:match("%s") ~= nil
end

--- @param raw String
--- @return string?
function M.parse_identifier(raw)
    local idx = 1
    local c

    -- Must start with one of those
    c = raw:peek()
    if c:match("[A-Za-z_]") == nil then
        error("Invalid identifier: " .. raw)
        return nil
    end

    while true do
        c = raw:advance()
        if not c then
            break
        end

        if not c:match("[A-Za-z0-9_]") then
            error("Invalid identifier: " .. raw:view())
            return nil
        end

        if M.is_whitespace(c) then
            break
        end
    end

    return string.sub(raw:view(), 1, idx)
end

return M
