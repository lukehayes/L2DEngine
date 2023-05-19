--------------------------------------------------------------------------------
-- Sprite that can play frames of animation>
--
-- @classmod AnimatedSprite
local class = require 'libs/middleclass'
local Sprite = require 'FW.GFX.Sprite'

local AnimatedSprite = class('AnimatedSprite', Sprite)

--------------------------------------------------------------------------------
-- Constructor.
--
-- @tparam number x The x position of the sprite.
-- @tparam number y The y position of the sprite.
-- @tparam string path The path to an image of tiles.
-- @tparam number frame_x The frame position on the x axis.
-- @tparam number frame_y The frame position on the y axis.
-- @tparam number frame_count The number of frames in the animation.
--
-- @usage
-- -- local AnimatedSprite = require 'FW.AnimatedSprite'
-- -- local Spr = AnimatedSprite:new(100,100, 'tiles.png', 20,10)
function AnimatedSprite:initialize(x,y, path, frame_x, frame_y, frame_count)

    Sprite.initialize(self, x,y, path, frame_x, frame_y)

    self.animations      = require('FW.animations')

    self.character       = 'knight'
    self.state           = 'idle'
    self.direction       = 'down'

    self.frame_count     = frame_count
    self.animation_speed = 0.2
    self.timer           = 0
    self.animation       = self.animations[self.character][self.state][self.direction]
    self.current_frame   = self.animation.frame_x
    self.is_playing      = true
end

--------------------------------------------------------------------------------
-- Start the current animation.
--
-- @return nil
function AnimatedSprite:start()
    self.is_playing = true
end

--------------------------------------------------------------------------------
-- Stop the current animation.
--
-- @return nil
function AnimatedSprite:stop()
    self.is_playing = false
end


--------------------------------------------------------------------------------
-- Update the next frame.
--
-- @tparam number dt Delta time.
--
-- @return nil
function AnimatedSprite:update(dt)

    if(self.is_playing) then
        self.timer = self.timer + dt

        if(self.timer >= self.animation_speed) then
            self.timer = 0
            self.current_frame = self.current_frame + 1
        end

        if(self.current_frame == self.animation.frame_x + self.animation.frame_count) then
            self.current_frame = self.animation.frame_x
        end
    end
end


--------------------------------------------------------------------------------
-- Draw the sprite.
--
-- @return nil
function AnimatedSprite:draw()

    local quad = love.graphics.newQuad(
                        self.current_frame * self.tile_size,
                        self.animations[self.character][self.state][self.direction].frame_y * self.tile_size,
                        self.tile_size,
                        self.tile_size,
                        self.image)

    love.graphics.draw(self.image,quad, self.x, self.y,0, self.scale, self.scale)
end

return AnimatedSprite

