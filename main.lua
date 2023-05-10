local Sprite = require('FW.Sprite')
local AnimSprite = require('FW.AnimatedSprite')
local Renderer = require('FW.Renderer')
local Container = require('FW.Container')

local so = Sprite:new(300,100, 'assets/tiles.png',5,8)
local s2 = AnimSprite:new(100,400, 'assets/tiles.png',43, 11, 5)
local s3 = AnimSprite:new(400,400, 'assets/tiles.png',43, 11, 5)
local c = Container:new()


c:add(so)
c:add(s3)

function love.load()
end

function love.update(dt)
    -- Hacky but it works - make delta time global.
    _G.dt = dt

    c:update(dt)
    s2:update(dt)
end

function love.draw()
    --love.graphics.rectangle("fill",100,100,100,100)
    c:draw()
    s2:draw()
end

function love.keypressed(key)
   if key == "escape" then
    so:update(_G.dt)
   end
end
