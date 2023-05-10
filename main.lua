local Sprite = require('FW.Sprite')
local AnimSprite = require('FW.AnimatedSprite')
local Renderer = require('FW.Renderer')

local so = Sprite:new(300,100, 'assets/tiles.png',5,8)
local s2 = AnimSprite:new(100,400, 'assets/tiles.png',12, 21,26)

local c = 0

local container = {}
table.insert(container, so)
table.insert(container, s2)

function love.load()
end

function love.update(dt)
    -- Hacky but it works - make delta time global.
    _G.dt = dt

    for k,v in ipairs(container) do
       v:update(dt)
    end
end

function love.draw()
    --love.graphics.rectangle("fill",100,100,100,100)
    for k,v in ipairs(container) do
       v:draw()
    end
end

function love.keypressed(key)
   if key == "escape" then
    so:update(_G.dt)
   end
end
