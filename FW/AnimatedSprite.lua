--------------------------------------------------------------------------------
-- Subclass of FW.Sprite that can play animation frames.
--
-- @classmod AnimatedSprite

local class = require 'libs/middleclass'
local Sprite = require 'FW.Sprite'

local AnimatedSprite = class('AnimatedSprite')

--------------------------------------------------------------------------------
-- Constructor.
--
-- @tparam number x The x position of the sprite.
-- @tparam number y The y position of the sprite.
-- @tparam string path The path to an image of tiles.
-- @tparam number frame_x The frame position on the x axis.
-- @tparam number frame_y The frame position on the y axis.
-- @tparam number frame_count The total number of frames for a complete animation.
--
-- @usage
-- -- local AnimatiedSprite = require 'FW.AnimatiedSprite'
-- -- local AnimSpr = AnimatedSprite:new(100,100, 'tiles.png', 20,10,5)
function AnimatedSprite:initialize(x,y, path, frame_x, frame_y, frame_count)

    Sprite.initialize(self, x,y,path)
    self.frame_x = frame_x
    self.frame_y = frame_y

    self.frame_count = frame_count
    self.anim_speed = 0.1
    self.anim_timer = 0
    self.current_frame = self.frame_x
end


--------------------------------------------------------------------------------
-- Draw the animated sprite.
--
-- @return nil
function AnimatedSprite:draw()

    local quad = love.graphics.newQuad(self.current_frame * self.tile_size,self.frame_y * self.tile_size, self.tile_size, self.tile_size, self.image)
    
    love.graphics.draw(self.image,quad, self.x, self.y,0, self.scale, self.scale)
end

--------------------------------------------------------------------------------
-- Run through each frame of the animation - called internally.
--
-- @return nil
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


--------------------------------------------------------------------------------
-- Update the next frame.
-- Function calls AnimatedSprite:animate() every frame.
--
-- @tparam number dt Delta time.
--
-- @return nil
function AnimatedSprite:update(dt)
    self:animate()
end

return AnimatedSprite

