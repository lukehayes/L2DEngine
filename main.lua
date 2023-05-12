local Sprite = require('FW.Sprite')
local AnimSprite = require('FW.AnimatedSprite')
local Renderer = require('FW.Renderer')
local Container = require('FW.Container')
local Object = require('FW.Object')
local EventManager = require('FW.EventManager')

local so = Sprite:new(0,0, 'assets/trees.png',2,0)
so.tile_size = 256
so.scale = 0.5
local s2 = AnimSprite:new(100,400, 'assets/tiles.png',12, 12, 6)
local s3 = AnimSprite:new(400,400, 'assets/tiles.png')
local c = Container:new()
local c2 = Container:new()

c:add(so)
local em = EventManager:new()


function fillContainer(c)
    for n=1,c do
        local w = love.graphics.getWidth()
        local h = love.graphics.getHeight()
        local rx = love.math.random(10,w)
        local ry = love.math.random(10,h)
        local speed = love.math.random(10,100)
        local o = Sprite:new(rx,ry, 'assets/trees.png', love.math.random(0,4),0)
        o.scale = 0.5
        o.tile_size = 256
        c2:add(o)
    end
end


function love.load()
    em:run('init')
end

function love.update(dt)
    -- Hacky but it works - make delta time global.
    _G.dt = dt

    em:run('update_begin')
    c:update(dt)

    local speed = 200

    -- TODO Refactor this out into the player class.
    if love.keyboard.isDown('w') then
        s3.y = s3.y - 1 * speed * dt
        s3.current_anim = s3.animations['walk']['up']
        s3.anim_direction = 'up'
    elseif love.keyboard.isDown('s') then
        s3.y = s3.y + 1 * speed * dt
        s3.current_anim = s3.animations['walk']['down']
        s3.anim_direction = 'down'
    elseif love.keyboard.isDown('a') then
        s3.x = s3.x - 1 * speed * dt
        s3.current_anim = s3.animations['walk']['left']
        s3.anim_direction = 'left'
    elseif love.keyboard.isDown('d') then
        s3.x = s3.x + 1 * speed * dt
        s3.anim_direction = 'right'
        s3.current_anim = s3.animations['walk']['right']
    else 
        s3.current_anim = s3.animations['idle'][s3.anim_direction]
    end
    em:run('update_end')
end

function love.draw()
    em:run('draw_begin')
    --love.graphics.rectangle("fill",100,100,100,100)
   love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)

    love.graphics.setBackgroundColor(0.5,0.7,0.5,1.0)
    c:draw()
    c2:draw()
    s3:draw()
    em:run('draw_end')
end

function love.keypressed(key)
   if key == "space" then
       c2 = Container:new()
       print(love.graphics.getWidth())
       fillContainer(love.graphics.getWidth() / 10)
   end
end
