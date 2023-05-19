--------------------------------------------------------------------------------
--
-- @classmod Vector2
local class = require 'libs/middleclass'

local Vector2 = class('Vector2')

--------------------------------------------------------------------------------
-- Constructor.
--
-- @tparam number x The x position of the sprite.
-- @tparam number y The y position of the sprite.
--
function Vector2:initialize(x,y)
    assert(type(x) == 'number', 'X value should be a number')
    assert(type(y) == 'number', 'Y value should be a number')

    self.x = x
    self.y = y
end

-------------------------------------------------------------------------------
-- Get the string representation of the vector.
--
-- @return string
function Vector2:__tostring()
    return("Vector2 X: " .. self.x .. " Y: " .. self.y)
end

-------------------------------------------------------------------------------
-- Multiply a vector by a scalar value.
--
-- @tparam number n The scalar value to multiply by.
--
-- @return Vector2
function Vector2:__mul(n)
    assert(type(n) == number, 'Vector multiplication should use a number.')
    return Vector2:new(
        self.x * n,
        self.y * n
    )
end

--------------------------------------------------------------------------------
-- Get the length of a vector.
--.
-- @return number
function Vector2:length()
    return math.sqrt(
        self.x * self.x + 
        self.y * self.y
    )
end

--------------------------------------------------------------------------------
-- Normalize the Vector.
--.
-- @return Vector2
function Vector2:normalize()
    local length = self:length()

    return Vector2:new(
        self.x / length,
        self.y / length
    )
end

return Vector2

