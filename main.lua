local Sprite = require('FW.Sprite')
local AnimSprite = require('FW.AnimatedSprite')
local Renderer = require('FW.Renderer')
local Container = require('FW.Container')
local Object = require('FW.Object')
local EventManager = require('FW.EventManager')

local s3 = AnimSprite:new(350,250, 'assets/tiles.png')
local c = Container:new()
local trees = Container:new()
c:add(s3)

local em = EventManager:new()

local animChar = 'knight'
local animMode = 'idle'

function fillContainer(num)
    for n=1,num do
        local w = love.graphics.getWidth()
        local h = love.graphics.getHeight()
        local rx = love.math.random(10,w)
        local ry = love.math.random(10,h)
        local speed = love.math.random(10,100)
        local o = Sprite:new(rx,ry, 'assets/trees.png', love.math.random(0,4),0)
        o.scale = 0.3
        o.tile_size = 256
        trees:add(o)
    end
end


function love.load()
    em:emit('init')
end

function love.update(dt)
    -- Hacky but it works - make delta time global.
    _G.dt = dt

    em:emit('update_begin')

    c:update(dt)
    trees:update(dt)

    local speed = 200

    -- TODO Refactor this out into the player class.
    if love.keyboard.isDown('w') then
        s3.y = s3.y - 1 * speed * dt
        s3:play(animChar, 'walk', 'up')
    elseif love.keyboard.isDown('s') then
        s3.y = s3.y + 1 * speed * dt
        s3:play(animChar, 'walk', 'down')
    elseif love.keyboard.isDown('a') then
        s3.x = s3.x - 1 * speed * dt
        s3:play(animChar, 'walk', 'left')
    elseif love.keyboard.isDown('d') then
        s3.x = s3.x + 1 * speed * dt
        s3:play(animChar, 'walk', 'right')
    else 
        s3:play(animChar, 'idle', s3.anim_direction)
    end
    em:emit('update_end')
end

function love.draw()
    em:emit('draw_begin')
    --love.graphics.rectangle("fill",100,100,100,100)
   love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)

    love.graphics.setBackgroundColor(0.7,0.7,0.7,1.0)
    c:draw()
    trees:draw()
    em:emit('draw_end')
end

function love.keypressed(key)
   if key == "space" then
       trees = Container:new()
       fillContainer(love.math.random(10,100))
   end
end
