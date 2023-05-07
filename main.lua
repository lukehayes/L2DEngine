function love.load()
end

function love.update(dt)
    -- Hacky but it works - make delta time global.
    _G.dt = dt
end

function love.draw()
    love.graphics.rectangle("fill",100,100,100,100)
end


