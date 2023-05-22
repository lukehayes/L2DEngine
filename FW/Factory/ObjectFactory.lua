--------------------------------------------------------------------------------
-- Generate N number of objects of any type for testing.
--
-- @classmod ObjectFactory
local class  = require 'libs/middleclass'
local Color  = require 'FW.GFX.Color'
local Object = require('FW.Core.Object')
local Entity  = require('FW.Entity.Entity')
local SpriteRow  = require('FW.GFX.SpriteRow')

local ObjectFactory = class('ObjectFactory')

--------------------------------------------------------------------------------
-- Constructor.
--
-- @tparam number x The x position of the sprite.
-- @tparam number y The y position of the sprite.
--
function ObjectFactory:initialize(x,y)
end

--------------------------------------------------------------------------------
-- Generate N number of base objects for testing.
--
-- @tparam number count The number of objects to draw.
--
-- @return nil.
function ObjectFactory.static:generate(count)
    for x = 1,count do
        for y = 1,count do
            local rx = love.math.random(10,600)
            local ry = love.math.random(10,600)
            local o = Object:new(rx,ry)
            o.color = Color:random()
            _G.game.default_container:add(o)
        end
    end
end

--------------------------------------------------------------------------------
-- Generate N number of ENTITIES for testing.
--
-- @tparam number count The number of objects to draw.
--
-- @return nil.
function ObjectFactory.static:generateEntities(count)
    for x = 1,count do
        for y = 1,count do
            local rx = love.math.random(10,600)
            local ry = love.math.random(10,600)
            local o  = Entity:new(rx,ry, 4)
            o.color  = Color:random()
            _G.game.default_container:add(o)
        end
    end
end

--------------------------------------------------------------------------------
-- Generate N number of SPRITERow objects for testing.
--
-- @tparam number count The number of objects to draw.
--
-- @return nil.
function ObjectFactory.static:generateSpriteRows(count)
    for x = 1,count do
        for y = 1,count do
            local rx = love.math.random(10,600)
            local ry = love.math.random(10,600)
            local o  = SpriteRow:new(rx,ry, 'assets/pixel-star.png',0,0,3)
            o.current_frame = love.math.random(0,3)
            o.color  = Color:randomBias(0.3)
            _G.game.default_container:add(o)
        end
    end
end


return ObjectFactory


