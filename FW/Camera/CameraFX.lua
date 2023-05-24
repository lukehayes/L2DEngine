--------------------------------------------------------------------------------
-- Camera effects like shake, flash etc.
--
-- @classmod CameraFX
local class = require 'libs/middleclass'
local Color = require 'FW.GFX.Color'

local CameraFX = class('CameraFX')

--------------------------------------------------------------------------------
-- Constructor.
--
-- @tparam number x The x position of the sprite.
-- @tparam number y The y position of the sprite.
--
function CameraFX:initialize()
end

--------------------------------------------------------------------------------
-- Update the next frame.
--
-- @tparam number dt Delta time.
--
-- @return nil
function CameraFX:update(dt)
end

--------------------------------------------------------------------------------
-- Shake the camera.
--
-- @return love.graphics.newFont
function Game.static:shake(sha)
   return love.graphics.getWidth()
end

return CameraFX

