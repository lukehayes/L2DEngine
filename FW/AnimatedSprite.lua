local class = require 'libs/middleclass'
local Sprite = require 'FW.Sprite'

local AnimatedSprite = class('AnimatedSprite')

function AnimatedSprite:initialize(x,y, sprite_path, frame_x, frame_y, frame_count)

    Sprite.initialize(self, x,y,sprite_path)
    self.frame_x = frame_x
    self.frame_y = frame_y

    self.frame_count = frame_count
    self.anim_speed = 0.1
    self.anim_timer = 0
    self.current_frame = self.frame_x
end


function AnimatedSprite:draw()

    local quad = love.graphics.newQuad(self.current_frame * self.tile_size,self.frame_y * self.tile_size, self.tile_size, self.tile_size, self.image)
    
    love.graphics.draw(self.image,quad, self.x, self.y,0, self.scale, self.scale)
end

function AnimatedSprite:animate()
    self.anim_timer = self.anim_timer + dt

    if(self.anim_timer >= self.anim_speed) then
        self.anim_timer = 0
        self.current_frame = self.current_frame + 1
    end

    if(self.current_frame == (self.frame_x + self.frame_count)) then
        self.current_frame = self.frame_x
    end
end


function AnimatedSprite:update(dt)
    self:animate()
end

return AnimatedSprite

