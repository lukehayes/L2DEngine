--------------------------------------------------------------------------------
-- Subclass of FW.Sprite that can play animation frames.
--
-- @classmod AnimatedSprite
local class = require 'libs/middleclass'
local AnimatedSprite = require 'FW.AnimatedSprite'

local AnimatedSpriteRow = class('AnimatedSpriteRow')

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
function AnimatedSpriteRow:initialize(x,y, path, frame_x, frame_num)

    --FIXME This whole class DOES NOT WORK. Needs implementation.
    AnimatedSprite.initialize(self, x,y,path)

    --self.current_anim = self.animations['knight']['idle']['down']
    self.current_frame = frame_x
end

function AnimatedSpriteRow:draw()
    print('Row Draw')
    local quad = love.graphics.newQuad(self.current_frame * self.tile_size,self.current_anim.frame_y * self.tile_size, self.tile_size, self.tile_size, self.image)
    love.graphics.draw(self.image,quad, self.x, self.y,0, self.scale, self.scale)
end



return AnimatedSprite

