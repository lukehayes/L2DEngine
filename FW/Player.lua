--------------------------------------------------------------------------------
-- General player class that inherits from AnimatedSprite
--
-- @classmod Player
local class = require 'libs/middleclass'
local AnimatedSprite = require 'FW.AnimatedSprite'

local Player = class('Player', AnimatedSprite)

--------------------------------------------------------------------------------
-- Constructor.
--
-- @tparam number x The x position of the sprite.
-- @tparam number y The y position of the sprite.
-- @tparam string path The path to an image of tiles.
--
-- @tparam number anim_self.speed How fast the animation will run at.
-- @tparam string anim_direction The direction of the animation (up,down,left,right).
-- @tparam string current_anim The current animation the sprite is using.
-- @tparam number current_frame The current frame the animation is on.
--
-- @usage
-- -- local AnimatiedSprite = require 'FW.AnimatiedSprite'
-- -- local AnimSpr = AnimatedSprite:new(100,100, 'tiles.png')
function Player:initialize(x,y, path)

    AnimatedSprite.initialize(self, x,y,path)

    self.animations = require 'FW.animations'
    self.current_anim = self.animations['knight'][self.state][self.direction]
    self.speed = 200
end

function Player:update(dt)
    self:playerInput(dt)
end

function Player:playerInput(dt)

    --if love.keyboard.isDown('w') then
        --playerObj.direction = 'up'
        --playerObj.state = 'walk'
        --playerObj.y = playerObj.y - 100 * dt
    --elseif love.keyboard.isDown('s') then
        --playerObj.direction = 'down'
        --playerObj.state = 'walk'
        --playerObj.y = playerObj.y + 100 * dt
    --elseif love.keyboard.isDown('a') then
        --playerObj.direction = 'left'
        --playerObj.state = 'walk'
        --playerObj.x = playerObj.x - 100 * dt
    --elseif love.keyboard.isDown('d') then
        --playerObj.direction = 'right'
        --playerObj.state = 'walk'
        --playerObj.x = playerObj.x + 100 * dt
    --else 
        --playerObj.state = 'idle'
    --end

    if love.keyboard.isDown('w') then
        self.y = self.y - 1 * self.speed * dt
        self:play('knight', 'walk', 'up')
    elseif love.keyboard.isDown('s') then
        self.y = self.y + 1 * self.speed * dt
        self:play('knight', 'walk', 'down')
    elseif love.keyboard.isDown('a') then
        self.x = self.x - 1 * self.speed * dt
        self:play('knight', 'walk', 'left')
    elseif love.keyboard.isDown('d') then
        self.x = self.x + 1 * self.speed * dt
        self:play('knight', 'walk', 'right')
    else 
        self:play('knight', 'idle', self.anim_direction)
    end
end

return Player
