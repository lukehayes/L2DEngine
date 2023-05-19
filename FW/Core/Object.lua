--------------------------------------------------------------------------------
-- Base class of most things in the framework and is not meant to be
-- instantiated directly. Most of the useful things in this
-- framework should inherit this class.
--
-- @classmod Object
local class = require 'libs/middleclass'

local Object = class('Object')

--------------------------------------------------------------------------------
-- Constructor.
--
-- @tparam number x The x position of the sprite.
-- @tparam number y The y position of the sprite.
--
function Object:initialize(x,y)
    self.x = x
    self.y = y
    self.w = 10
    self.h = 10
    self.color = {
        ['r'] = love.math.random(0,1),
        ['g'] = love.math.random(0,1),
        ['b'] = love.math.random(0,1),
        ['a'] = 1
    }
    self.id = 999
end


--------------------------------------------------------------------------------
-- Draw the object using its x,y,w and h values. This method is not meant
-- to be used directly but is useful for debugging.
--
-- @return nil
function Object:draw()
    love.graphics.setColor(
        self.color.r,
        self.color.g,
        self.color.b,
        self.color.a
    )
    love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
end

--------------------------------------------------------------------------------
-- Update the next frame.
--
-- @tparam number dt Delta time.
--
-- @return nil
function Object:update(dt)
end

return Object

