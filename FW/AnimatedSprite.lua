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
--
-- @tparam number anim_speed How fast the animation will run at.
-- @tparam string anim_direction The direction of the animation (up,down,left,right).
-- @tparam string current_anim The current animation the sprite is using.
-- @tparam number current_frame The current frame the animation is on.
--
-- @usage
-- -- local AnimatiedSprite = require 'FW.AnimatiedSprite'
-- -- local AnimSpr = AnimatedSprite:new(100,100, 'tiles.png')
function AnimatedSprite:initialize(x,y, path)

    Sprite.initialize(self, x,y,path)
    self.anim_timer = 0
    self.anim_speed = 0.15
    self.anim_direction = 'down'

    -- TODO This works for now but abstracting 
    -- this in way would be good.
    self.animations = {
        ['idle'] = {
            ['down']= {
                frame_x = 13,
                frame_y = 8,
                frame_num = 4
            },

            ['up'] = {
                frame_x = 13,
                frame_y = 9,
                frame_num = 4
            },

            ['right'] = {
                frame_x = 13,
                frame_y = 10,
                frame_num = 4
            },

            ['left'] = {
                frame_x = 13,
                frame_y = 11,
                frame_num = 4
            }
        },

        ['walk'] = {
            ['down']= {
                frame_x = 13,
                frame_y = 0,
                frame_num = 4
            },

            ['up'] = {
                frame_x = 13,
                frame_y = 1,
                frame_num = 4
            },

            ['right'] = {
                frame_x = 13,
                frame_y = 2,
                frame_num = 4
            },

            ['left'] = {
                frame_x = 13,
                frame_y = 3,
                frame_num = 4
            }
        }
    }

    self.current_anim = self.animations['idle']['down']
    self.current_frame = self.current_anim.frame_x
end

--------------------------------------------------------------------------------
-- Draw the animated sprite.
--
-- @return nil
function AnimatedSprite:draw()
    local quad = love.graphics.newQuad(self.current_frame * self.tile_size,self.current_anim.frame_y * self.tile_size, self.tile_size, self.tile_size, self.image)
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

    if(self.current_frame == (self.current_anim.frame_x + self.current_anim.frame_num)) then
        self.current_frame = self.current_anim.frame_x
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

