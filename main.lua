local Sprite = require('FW.Sprite')
local Renderer = require('FW.Renderer')

local so = Sprite:new(100,400, 'assets/flames.png',0,0)
local s2 = Sprite:new(300,100, 'assets/tiles.png',43,10)
local rr = Renderer:new()

local c = 0

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
end

function love.update(dt)
    -- Hacky but it works - make delta time global.
    _G.dt = dt

    c = c + 0.05

    so:update(dt)
    s2:update(dt)
end

function love.draw()
    --love.graphics.rectangle("fill",100,100,100,100)
    rr:drawSprite(so)
    so:draw();
    s2:draw();
end

function love.keypressed(key)
   if key == "escape" then
    s2:update(_G.dt)
   end
end
