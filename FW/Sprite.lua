local class = require 'libs/middleclass'

local Sprite = class('Sprite')

function Sprite:initialize(x,y, sprite_path)
    self.x = x
    self.y = y
    self.scale = 3
    self.image = love.graphics.newImage(sprite_path)
    self.image:setFilter('nearest', 'nearest')
    self.tile_size = 16

    --Animation config
    self.frame_start = 1
    self.frame_end = 4
    self.anim_speed = 0.1
    self.anim_timer = 0
    self.current_tile = 0
    --self.quad = love.graphics.newQuad()
end


function Sprite:draw()
    local quad = love.graphics.newQuad(self.tile_size * self.current_tile,0,self.tile_size, self.tile_size, self.image)
    love.graphics.draw(self.image,quad, self.x, self.y,0, self.scale, self.scale)
end


function Sprite:update(dt)
    self.anim_timer = self.anim_timer + dt

    if(self.anim_timer >= self.anim_speed) then
        self.current_tile = self.current_tile + 1
        self.anim_timer = 0
    end

    if(self.current_tile == self.frame_end) then
        self.current_tile = 0
    end
end

return Sprite

