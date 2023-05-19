local Sprite        = require('FW.GFX.Sprite')
local RawImage      = require('FW.GFX.RawImage')
local AnimSprite    = require('FW.GFX.AnimatedSprite')
local Container     = require('FW.DS.Container')
local EventManager  = require('FW.EventManager')

local em        = EventManager:new()
em:emit('init')

function love.load()
    em:emit('engine_load')
    _G.game = {} -- Location for all helpful global functions, values etc.
    _G.game.default_font = love.graphics.newFont('assets/cozette_bitmap.ttf', 13)

    _G.game.default_container = Container:new()

    -- Add objects to the container.
    -- 
    local bg = RawImage:new(0,0, 192,144, 'assets/bg.png', 5)
    _G.game.default_container:add(bg)
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
    --love.graphics.rectangle("fill",100,100,100,100)
    love.graphics.setBackgroundColor(0.2,0.7,0.4,1)
    love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), _G.game.default_font,10, 10,0, 4,4)

    _G.game.default_container:draw()

    em:emit('draw_end')
end

