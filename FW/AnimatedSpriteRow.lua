--------------------------------------------------------------------------------
-- Represents a single row of animation. Scans across the X axis 'frame_num'
-- times. The Y axis is completely ignored. 
--
-- This class is meant to be used for single tile animations.
--
-- @classmod AnimatedSpriteRow
local class = require 'libs/middleclass'
local AnimatedSprite = require 'FW.AnimatedSprite'

local AnimatedSpriteRow = class('AnimatedSpriteRow', AnimatedSprite)

--------------------------------------------------------------------------------
-- Constructor.
--
-- @tparam number x The x position of the sprite.
-- @tparam number y The y position of the sprite.
-- @tparam string path The path to an image of tiles.
-- @tparam number frame_x The frame position on the x axis.
-- @tparam number frame_num The number of frames in the animation row
--
-- @usage
-- -- local AnimatedSpriteRow = require 'FW.AnimatedSpriteRow'
-- -- local Spr = AnimatedSpriteRow:new(100,100, 'tiles.png', 0,5)
function AnimatedSpriteRow:initialize(x,y, path, frame_x, frame_num)

    -- XXX This class is a weird frankenstien sort of subclass
    -- of an animated sprite. The functionality should be moved
    -- into a single all purpse subclass later.
    AnimatedSprite.initialize(self, x,y, path)
    self.scale = 3
    self.tile_size = 5
    self.frame_x = 0
    self.current_frame = self.frame_x
    self.frame_num = frame_num
    self.is_playing = true
end

function AnimatedSpriteRow:play()
    self.is_playing = true
end

function AnimatedSpriteRow:stop()
    self.is_playing = false
end

function AnimatedSpriteRow:update(dt)

    if(self.is_playing) then
        self.anim_timer = self.anim_timer + dt

        if(self.anim_timer >= self.anim_speed) then
            self.anim_timer = 0
            self.current_frame = self.current_frame + 1
        end

        if(self.current_frame == (self.frame_x + self.frame_num)) then
            self.current_frame = self.frame_x
        end
    end
end

function AnimatedSpriteRow:draw()
    local quad = love.graphics.newQuad(self.current_frame * self.tile_size,0, self.tile_size, self.tile_size, self.image)
    love.graphics.draw(self.image,quad, self.x, self.y,0, self.scale, self.scale)
end

return AnimatedSpriteRow
