local Container     = require('FW.DS.Container')
local EventManager  = require('FW.EventManager')
local Game          = require('FW.Core.Game')

local em        = EventManager:new()
em:emit('init')


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

    em:emit('draw_end')
end

