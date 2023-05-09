local class = require 'libs/middleclass'

local AnimatedSprite = class('AnimatedSprite')

function AnimatedSprite:initialize(x,y, sprite_path, quad_y, frame_start, frame_end)
    self.x = x
    self.y = y
    self.image = love.graphics.newImage(sprite_path)
    self.image:setFilter('nearest', 'nearest')
    self.scale = 10
    self.tile_size = 16
    self.quad_y = quad_y


    --Animation config
    self.frame_start = frame_start
    self.frame_end = frame_end
    self.anim_speed = 0.1
    self.anim_timer = 0
    self.current_frame = self.frame_start
end


function AnimatedSprite:draw()
    local quad = love.graphics.newQuad(self.current_frame * self.tile_size,self.quad_y * self.tile_size, self.tile_size, self.tile_size, self.image)
    love.graphics.draw(self.image,quad, self.x, self.y,0, self.scale, self.scale)
end

function AnimatedSprite:animate()
    self.anim_timer = self.anim_timer + dt

    if(self.anim_timer >= self.anim_speed) then
        self.anim_timer = 0
        self.current_frame = self.current_frame + 1
    end

    if(self.current_frame == self.frame_end) then
        self.current_frame = self.frame_start
    end
end


function AnimatedSprite:update(dt)
    self:animate()
end

return AnimatedSprite

