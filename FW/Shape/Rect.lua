--------------------------------------------------------------------------------
-- A Rect defines an area in 2D space with a position(X,y) and a size(W,H).
--
-- @classmod Rect
local class = require 'libs/middleclass'

local Rect = class('Rect')

--------------------------------------------------------------------------------
-- Constructor.
--
-- @tparam number x The x position of the rect.
-- @tparam number y The y position of the rect.
-- @tparam number w The width position of the rect.
-- @tparam number h The height position of the rect.
--
function Rect:initialize(x,y,w,h)
    self.x = x
    self.y = y
    self.w = w
    self.h = h
end


--------------------------------------------------------------------------------
-- Draw the object using its x,y,w and h values. This method is not meant
-- to be used directly but is useful for debugging.
--
-- @return nil
function Rect:draw()

    love.graphics.setColor(1,0,1,1)

    love.graphics.rectangle('line', self.x, self.y, self.w, self.h)

    love.graphics.setColor(1,1,1,1)
end

return Rect

