local Sprite = require('FW.Sprite')
local AnimSprite = require('FW.AnimatedSprite')
local Container = require('FW.Container')
local EventManager = require('FW.EventManager')

local player = AnimSprite:new(350,250, 'assets/tiles.png')
local c = Container:new()
c:add(player)

local em = EventManager:new()

function love.load()
    em:emit('init')
end

function love.update(dt)
    -- Hacky but it works - make delta time global.
    _G.dt = dt

    em:emit('update_begin')

    c:update(dt)
    playerInput()

    em:emit('update_end')
end

function love.draw()
    em:emit('draw_begin')
    --love.graphics.rectangle("fill",100,100,100,100)
   love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 100, 10,0, 2,2)

    love.graphics.setBackgroundColor(0.7,0.7,0.7,1.0)
    c:draw()
    em:emit('draw_end')
end

function love.keypressed(key)
   if key == "space" then
       print('Space Key Pressed')
   end
end


function playerInput()
    -- TODO Refactor this out into the player class.
    
    local speed = 200

    if love.keyboard.isDown('w') then
        player.y = player.y - 1 * speed * dt
        player:play('knight', 'walk', 'up')
    elseif love.keyboard.isDown('s') then
        player.y = player.y + 1 * speed * dt
        player:play('knight', 'walk', 'down')
    elseif love.keyboard.isDown('a') then
        player.x = player.x - 1 * speed * dt
        player:play('knight', 'walk', 'left')
    elseif love.keyboard.isDown('d') then
        player.x = player.x + 1 * speed * dt
        player:play('knight', 'walk', 'right')
    else 
        player:play('knight', 'idle', player.anim_direction)
    end
end
