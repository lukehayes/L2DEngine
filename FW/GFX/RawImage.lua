--------------------------------------------------------------------------------
-- RawImage is for a displaying an entire image to the screen.
-- FW.Sprite should be used for showing a specific section(a tile) of an Image.
--
-- @classmod RawImage
local class = require 'libs/middleclass'

local Object = require 'FW.Core.Object'

local RawImage = class('RawImage', Object)
--------------------------------------------------------------------------------
-- Constructor.
--
-- @tparam number x     The x position of the sprite.
-- @tparam number y     The y position of the sprite.
-- @tparam number w     The width of the sprite.
-- @tparam number h     The height of the sprite.
-- @tparam string path  The path to the image file.
-- @tparam number scale The scale of the image.
--
function RawImage:initialize(x,y, w, h, path, scale)
    Object.initialize(self, x,y)

    self.image     = love.graphics.newImage(path)
    self.image:setFilter('nearest', 'nearest')

    self.scale     = scale
    self.quad      = love.graphics.newQuad(0,0,w,h,self.image)
end


--------------------------------------------------------------------------------
-- Draw the object using its x,y,w and h values. This method is not meant
-- to be used directly but is useful for debugging.
--
-- @return nil
function RawImage:draw()
    love.graphics.draw(self.image,self.quad, self.x, self.y, 0, self.scale, self.scale)
end

--------------------------------------------------------------------------------
-- Update the next frame.
--
-- @tparam number dt Delta time.
--
-- @return nil
function RawImage:update(dt)
end

return RawImage

