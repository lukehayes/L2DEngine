--------------------------------------------------------------------------------
-- A SpriteRow is used to animate a single row of animation and the
-- animation is meant to be running permenantly i.e the animation doesn't stop.
-- Useful for animations that run in the back of the scene somewhere.
--
-- @classmod SpriteRow
local class = require 'libs/middleclass'
local Sprite = require 'FW.GFX.Sprite'

local SpriteRow = class('SpriteRow', Sprite)

--------------------------------------------------------------------------------
-- Constructor.
--
-- @tparam number x The x position of the sprite.
-- @tparam number y The y position of the sprite.
-- @tparam string path The path to an image of tiles.
-- @tparam number frame_x The frame index of the quad  on the x axis. (0,1,2,etc).
-- @tparam number frame_y The frame index of the quad  on the y axis. (0,1,2,etc).
-- @tparam number frame_count The number of frames in the animation.
--
-- @usage
-- -- local SpriteRow = require 'FW.SpriteRow'
-- -- local Spr = SpriteRow:new(100,100, 'tiles.png', 0,0,3)
function SpriteRow:initialize(x,y, path, frame_x, frame_y, frame_count)

    Sprite.initialize(self, x,y,path, frame_x, frame_y)

    self.frame_count     = frame_count
    self.animation_speed = 0.3
    self.tile_size       = 5
    self.current_frame   = 0
    self.timer           = 0
end


--------------------------------------------------------------------------------
-- Draw the sprite.
--
-- @return nil
function SpriteRow:draw()

    local quad = love.graphics.newQuad(
                    self.current_frame * self.tile_size,
                    self.frame_y * self.tile_size,
                    self.tile_size,
                    self.tile_size,
                    self.image)

    love.graphics.draw(self.image,quad, self.x, self.y,0, self.scale, self.scale)
end

--------------------------------------------------------------------------------
-- Update the next frame.
--
-- @tparam number dt Delta time.
--
-- @return nil
function SpriteRow:update(dt)
    self:animate()
end

--------------------------------------------------------------------------------
-- Iterate through each frame of animation.
--
-- Called internally in SpriteRow:update(). No need to call directly.
--
-- @return nil
function SpriteRow:animate()
    self.timer = self.timer + dt

    if(self.timer >= self.animation_speed) then
        self.timer = 0
        self.current_frame = self.current_frame + 1
    end

    if(self.current_frame == self.frame_x + self.frame_count) then
        self.current_frame = 0
    end
end

return SpriteRow

