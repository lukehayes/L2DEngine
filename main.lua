local Container     = require('FW.DS.Container')
local EventManager  = require('FW.EventManager')
local Game          = require('FW.Core.Game')

local QuadTree      = require('FW.DS.QuadTree')
local Entity        = require('FW.Entity.Entity')
local Renderer      = require('FW.GFX.Renderer')
local Rect          = require('FW.Shape.Rect')

local em        = EventManager:new()
em:emit('init')

local qt = QuadTree:new(Rect:new(0,0,Game:width(), Game:height()))
local nw = Rect:new(0,0, Game:width() / 2, Game:height() / 2)
local ne = Rect:new(Game:width() / 2,0, Game:width() / 2, Game:height() / 2)
local se = Rect:new(Game:width() / 2, Game:height() / 2, Game:width() / 2, Game:height() / 2)
local sw = Rect:new(0, Game:height() / 2, Game:width() / 2, Game:height() / 2)


function love.load()
    em:emit('engine_load')

    _G.game = {} -- Location for all helpful global functions, values etc.
    _G.game.default_container = Container:new()
end


function love.update(dt)
    -- Hacky but it works - make delta time global.
    _G.dt = dt

    em:emit('update_begin')

    _G.game.default_container:update(dt)

    em:emit('update_end')
end

function love.draw()
    em:emit('draw_begin')

    local tint = 0.4
    love.graphics.setBackgroundColor(tint, tint, tint,1.0)
    love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), Game:default_font(),10, 10,0, 1,1)

    _G.game.default_container:draw()

    qt:drawRects()


    em:emit('draw_end')
end



function love.keypressed(key)
   if key == "space" then
       local rx = love.math.random(0,Game:width() - 20)
       local ry = love.math.random(0,Game:height() - 20)
       local e = Entity:new(rx,ry, 10)


       qt:insert(e)

   end
end

