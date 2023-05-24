--------------------------------------------------------------------------------
-- Simple 2D Camera. Attact a target to have that target centered on the screen.
-- The target object MUST be added after the Camera is added the the scene.
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

    -- Sets the target to be on the center of the screen.
    love.graphics.translate(
        -self.target.x + self.w / 2,
        -self.target.y + self.h / 2
    )
end

--------------------------------------------------------------------------------
-- Update the next frame.
--
-- @tparam number dt Delta time.
--
-- @return nil
function Camera:update(dt)
end

return Camera

