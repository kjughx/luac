local util = require("util")

local M = {}

--- @class KeywordType
--- @field AUTO integer
--- @field BREAK integer
--- @field CASE integer
--- @field CHAR integer
--- @field CONST integer
--- @field CONTINUE integer
--- @field DEFAULT integer
--- @field DO integer
--- @field DOUBLE integer
--- @field ELSE integer
--- @field ENUM integer
--- @field EXTERN integer
--- @field FLOAT integer
--- @field FOR integer
--- @field GOTO integer
--- @field IF integer
--- @field INLINE integer
--- @field INT integer
--- @field LONG integer
--- @field REGISTER integer
--- @field RESTRICT integer
--- @field RETURN integer
--- @field SHORT integer
--- @field SIGNED integer
--- @field SIZEOF integer
--- @field STATIC integer
--- @field STRUCT integer
--- @field SWITCH integer
--- @field TYPEDEF integer
--- @field UNION integer
--- @field UNSIGNED integer
--- @field VOID integer
--- @field VOLATILE integer
--- @field WHILE integer
KeywordType = {
    AUTO = 1,
    BREAK = 2,
    CASE = 3,
    CHAR = 4,
    CONST = 5,
    CONTINUE = 6,
    DEFAULT = 7,
    DO = 8,
    DOUBLE = 9,
    ELSE = 10,
    ENUM = 11,
    EXTERN = 12,
    FLOAT = 13,
    FOR = 14,
    GOTO = 15,
    IF = 16,
    INLINE = 17,
    INT = 18,
    LONG = 19,
    REGISTER = 20,
    RESTRICT = 21,
    RETURN = 22,
    SHORT = 23,
    SIGNED = 24,
    SIZEOF = 25,
    STATIC = 26,
    STRUCT = 27,
    SWITCH = 28,
    TYPEDEF = 29,
    UNION = 30,
    UNSIGNED = 31,
    VOID = 32,
    VOLATILE = 33,
    WHILE = 34,
    INVALID = 35,
}

--- @class Keyword
--- @field type KeywordType
Keyword = util.class("Keyword", {"type"})

--- @param type KeywordType
--- @return Keyword
function Keyword:new(type)
    assert(type, "type should not be nil")

    local obj = setmetatable({}, self)
    obj.type = type
    return obj
end

--- @class DelimiterType
DelimiterType = {
    R_PAREN = {},
    L_PAREN = {},
    R_BRACKET = {},
    L_BRACKET = {},
    R_BRACE = {},
    L_BRACE = {},
    TICK = {},
    QUOTE = {},
}

--- @class Delimiter
--- @field type DelimiterType
Delmiter = util.class("Delimiter", {"type"})

--- @param type DelimiterType
--- @return Delimiter
function Delmiter:new(type)
    assert(type ~= nil, "type should not be nil")

    local obj = setmetatable({}, self)
    obj.type = type
    return obj
end

--- @class PunctuationType
PunctuationType = {
    SEMICOLON = {},
    COMMA = {},
    DOT = {},
    QUESTION = {},
    COLON = {},
}

--- @class Punctuation
--- @field type PunctuationType
Punctuation = util.class("Punctuation", {"type"})

--- @param type PunctuationType
--- @return Punctuation
function Punctuation:new(type)
    assert(type ~= nil, "type should not be nil")

    local obj = setmetatable({}, self)
    obj.type = type
    return obj
end

--- @class IdentifierType
--- @field FUNCTION number
IdentifierType = {
    FUNCTION = 1,
    CONSTANT = 2,
    VARIABLE = 3,
    INVALID = 4,
}

--- @class Identifer
--- @field id string
--- @field type IdentifierType
Identifier = util.class("Identifier", { "name", "type" })

--- @param name string
--- @param type integer
--- @return Identifer
function Identifier:new(name, type)
    assert(name ~= nil, "name should not be nil")
    assert(type ~= nil, "type should not be nil")
    assert(type < IdentifierType.INVALID, "Invalid IdentiferType")

    local obj = setmetatable({}, self)
    obj.name = name
    obj.type = type
    return obj
end

return M
