local Sprite = require('FW.Sprite')
local AnimSprite = require('FW.AnimatedSprite')
local Player = require('FW.Player')
local AnimSpriteRow = require('FW.AnimatedSpriteRow')
local Container = require('FW.Container')
local EventManager = require('FW.EventManager')

local playerObj = Player:new(350,250, 'assets/tiles.png')
local star   = AnimSpriteRow:new(300,250, 'assets/pixel-star.png', 0,3)

local em = EventManager:new()
em:emit('init')

function love.load()
    em:emit('engine_load')
    _G.game = {} -- Location for all helpful global functions, values etc.
    _G.game.default_container = Container:new()
    _G.game.default_container:add(playerObj)
    _G.game.default_container:add(star)
    _G.game.default_font = love.graphics.newFont('assets/cozette_bitmap.ttf', 13)
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
    love.graphics.setBackgroundColor(0.2,0.6,0.2,1)
    love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), _G.game.default_font,10, 10,0, 4,4)

    _G.game.default_container:draw()

    em:emit('draw_end')
end

