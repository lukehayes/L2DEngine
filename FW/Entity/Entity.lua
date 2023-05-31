--------------------------------------------------------------------------------
-- Entity is a subclass of object that adds different kinds of behaviours.
--
-- @classmod Entity
local class  = require 'libs/middleclass'
local Color  = require 'FW.GFX.Color'
local Object = require 'FW.Core.Object'

local Entity = class('Entity', Object)

--------------------------------------------------------------------------------
-- Constructor.
--
-- @tparam number x The x position of the sprite.
-- @tparam number y The y position of the sprite.
-- @tparam number size The width AND height of an entitiy.
--
function Entity:initialize(x,y, size)

    Object.initialize(self,x,y)

    local dir = {1,-1}

    self.speed = love.math.random(10,200)
    self.w     = size
    self.h     = size
    self.dx    = dir[love.math.random(1,2)]
    self.dy    = dir[love.math.random(1,2)]
end


--------------------------------------------------------------------------------
-- Draw the object using its x,y,w and h values. This method is not meant
-- to be used directly but is useful for debugging.
--
-- @return nil
function Entity:draw()
    love.graphics.setColor(
        self.color.r,
        self.color.g,
        self.color.b,
        self.color.a
    )

    love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)

    -- Reset the draw color back to white.
    love.graphics.setColor(1,1,1,1)
end

--------------------------------------------------------------------------------
-- Check if the current entity has hit the left or the right side of the screen.
--
-- @return nil
function Entity:checkXBounds()
    if(self.x < 10 or self.x > 580) then
        return true
    end
end

--------------------------------------------------------------------------------
-- Check if the current entity has hit the top or the bottom side of the screen.
--
-- @return nil
function Entity:checkYBounds()
    if(self.y < 10 or self.y > 580) then
        return true
    end
end

--------------------------------------------------------------------------------
-- Check if the current entity has hit the edge of the screen.
--
-- @return nil
function Entity:checkBounds()
    if(self.x < 10 or self.x > 580) then
        self.dx = -self.dx
    end

    if(self.y < 10 or self.y > 770) then
        self.dy = -self.dy
    end
end

--------------------------------------------------------------------------------
-- Update the next frame.
--
-- @tparam number dt Delta time.
--
-- @return nil
function Entity:update(dt)

    self:checkBounds()

    self.x = self.x + self.dx * self.speed * dt
    self.y = self.y + self.dy * self.speed * dt
end

return Entity

