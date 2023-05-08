local class = require 'libs/middleclass'

local Sprite = class('Sprite')

function Sprite:initialize(x,y, sprite_path, quad_x, quad_y)
    self.x = x
    self.y = y
    self.image = love.graphics.newImage(sprite_path)
    self.image:setFilter('nearest', 'nearest')
    self.scale = 10
    self.tile_size = 16
    self.quad_x = quad_x
    self.quad_y = quad_y


    --Animation config
    self.frame_start = 1
    self.frame_end = 6
    self.anim_speed = 0.5
    self.anim_timer = 0
    self.current_tile = 1
    --self.quad = love.graphics.newQuad()
end


function Sprite:draw()
    local quad = love.graphics.newQuad(self.current_tile,self.quad_y * self.tile_size, self.tile_size, self.tile_size, self.image)
    love.graphics.draw(self.image,quad, self.x, self.y,0, self.scale, self.scale)
end


function Sprite:update(dt)
    self.anim_timer = self.anim_timer + dt

    if(self.anim_timer >= self.anim_speed) then
        self.quad_x = self.quad_x + 1
        self.current_tile = self.quad_x * self.tile_size
        self.anim_timer = 0
    end

    print(self.current_tile)
end

return Sprite

