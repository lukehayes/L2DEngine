--------------------------------------------------------------------------------
-- Base class of all 'renderable' things in the framework.
--
-- @classmod Sprite
local class = require 'libs/middleclass'
local Object = require 'FW.Core.Object'

local Sprite = class('Sprite', Object)

--------------------------------------------------------------------------------
-- Constructor.
--
-- @tparam number x The x position of the sprite.
-- @tparam number y The y position of the sprite.
-- @tparam string path The path to an image of tiles.
-- @tparam number frame_x The frame position on the x axis.
-- @tparam number frame_y The frame position on the y axis.
--
-- @usage
-- -- local Sprite = require 'FW.Sprite'
-- -- local Spr = Sprite:new(100,100, 'tiles.png', 20,10)
function Sprite:initialize(x,y, path, frame_x, frame_y)
    Object.initialize(self, x,y)

    self.image     = love.graphics.newImage(path)
    self.image:setFilter('nearest', 'nearest')

    self.scale     = 3
    self.tile_size = 16
    self.frame_x   = frame_x
    self.frame_y   = frame_y
    self.quad      = love.graphics.newQuad(self.frame_x * self.tile_size,self.frame_y * self.tile_size, self.tile_size, self.tile_size, self.image)
end


--------------------------------------------------------------------------------
-- Draw the sprite.
--
-- @return nil
function Sprite:draw()
    love.graphics.draw(self.image,self.quad, self.x, self.y,0, self.scale, self.scale)
end

--------------------------------------------------------------------------------
-- Update the next frame.
--
-- @tparam number dt Delta time.
--
-- @return nil
function Sprite:update(dt)
end

return Sprite

