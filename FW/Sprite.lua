local class = require 'libs/middleclass'

local Sprite = class('Sprite')

function Sprite:initialize(x,y)
    self.x = x
    self.y = y
    self.image = love.graphics.newImage('assets/green-tiles.png')
    self.scale = 3
end

return Sprite

