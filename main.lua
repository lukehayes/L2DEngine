local Sprite = require('FW.Sprite')
local Renderer = require('FW.Renderer')

local so = Sprite:new(100,400)
local rr = Renderer:new()

local c = 0

function love.load()
end

function love.update(dt)
    -- Hacky but it works - make delta time global.
    _G.dt = dt

    c = c + 0.05

    so:update(dt)
end

function love.draw()
    --love.graphics.rectangle("fill",100,100,100,100)
    rr:drawSprite(so)
    so:draw();
end


