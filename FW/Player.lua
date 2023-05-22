--------------------------------------------------------------------------------
-- General player class for testing that only inherits from FW.Core.Object
-- and has simple player movement control.
--
-- @classmod Player
local class  = require 'libs/middleclass'
local Object = require 'FW.Core.Object'
local Color  = require 'FW.GFX.Color'

local Player = class('Player', Object)

--------------------------------------------------------------------------------
-- Constructor.
--
-- @tparam number x The x position of the sprite.
-- @tparam number y The y position of the sprite.
--
-- @usage
-- -- local AnimatiedSprite = require 'FW.AnimatiedSprite'
-- -- local AnimSpr = AnimatedSprite:new(100,100, 'tiles.png')
function Player:initialize(x,y)
    Object.initialize(self, x,y)

    self.color = Color:new(0,1,1,1)
    self.w = 50
    self.h = 50
    self.speed = 250
end

function Player:draw()
    love.graphics.setColor(
        self.color.r,
        self.color.g,
        self.color.b,
        self.color.a
    )
    love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
end

function Player:update(dt)
    self:playerInput(dt)
end

function Player:playerInput(dt)

    if love.keyboard.isDown('w') then
        self.y = self.y - 1 * self.speed * dt
    elseif love.keyboard.isDown('s') then
        self.y = self.y + 1 * self.speed * dt
    elseif love.keyboard.isDown('a') then
        self.x = self.x - 1 * self.speed * dt
    elseif love.keyboard.isDown('d') then
        self.x = self.x + 1 * self.speed * dt
    else 
    end
end

return Player
