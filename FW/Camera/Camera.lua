--------------------------------------------------------------------------------
-- Base class of most things in the framework and is not meant to be
-- instantiated directly. Most of the useful things in this
-- framework should inherit this class.
--
-- @classmod Camera
local class = require 'libs/middleclass'
local Color = require 'FW.GFX.Color'
local Game  = require 'FW.Core.Game'

local Camera = class('Camera')

--------------------------------------------------------------------------------
-- Constructor.
--
-- @tparam number x The x position of the sprite.
-- @tparam number y The y position of the sprite.
--
function Camera:initialize(x,y, target)
    self.x = x
    self.y = y
    self.w = Game:width()
    self.h = Game:height()
    self.target = target
end


--------------------------------------------------------------------------------
-- Explicitly set the camera target (what the camera follows).
--
-- @return nil
function Camera:setTarget(target)
    self.target = target
end

--------------------------------------------------------------------------------
-- Draw the current frame from the camera.
--
-- @return nil
function Camera:draw()

    local n = 100

    love.graphics.push()

    print(self.x, self.target.x)
    print(self.y, self.target.y)

    love.graphics.translate(
        self.target.x - self.x,
        self.target.y - self.y
    )

    love.graphics.pop()
end

--------------------------------------------------------------------------------
-- Update the next frame.
--
-- @tparam number dt Delta time.
--
-- @return nil
function Camera:update(dt)
    self.c = self.c + 0.1
end

return Camera

