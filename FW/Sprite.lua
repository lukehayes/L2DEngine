local class = require 'libs/middleclass'

local Sprite = class('Sprite')

function Sprite:initialize(x,y, sprite_path, frame_x, frame_y)
    self.x = x
    self.y = y
    self.image = love.graphics.newImage(sprite_path)
    self.image:setFilter('nearest', 'nearest')
    self.scale = 10
    self.tile_size = 16
    self.frame_x = frame_x
    self.frame_y = frame_y
end


function Sprite:draw()
    local quad = love.graphics.newQuad(self.frame_x * self.tile_size,self.frame_y * self.tile_size, self.tile_size, self.tile_size, self.image)
    love.graphics.draw(self.image,quad, self.x, self.y,0, self.scale, self.scale)
end

function Sprite:update(dt)
end

return Sprite

