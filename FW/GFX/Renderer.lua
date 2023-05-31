local class = require 'libs/middleclass'

local Renderer = class('Renderer')

function Renderer:initialize()
end

function Renderer:drawSprite(sprite)
    --love.graphics.draw(sprite.image, sprite.x,sprite.y, 0, sprite.scale, sprite.scale)
    --love.graphics.quad(sprite.image, sprite.x,sprite.y, 0, sprite.scale, sprite.scale)
end

--------------------------------------------------------------------------------
-- Draw a rectangle.
--
-- @tparam number x The x position.
-- @tparam number y The y position.
-- @tparam number w The w position.
-- @tparam number h The h position.
--
-- @tparam Color color The color of the rectangle.
--
-- @return nil
function Renderer.static:drawRect(x,y,w,h,color)

    love.graphics.setColor(
        color.r,
        color.g,
        color.b,
        color.a
    )
    love.graphics.rectangle('fill', x, y, w,h)

    Renderer:resetColor()
end

--------------------------------------------------------------------------------
-- Draw a WHITE rectangle with a 'line' style.
--
-- @tparam number x The x position.
-- @tparam number y The y position.
-- @tparam number w The w position.
-- @tparam number h The h position.
--
-- @return nil
function Renderer.static:draw(x,y,w,h)

    love.graphics.setColor(1,1,1,1)
    love.graphics.rectangle('line', x, y, w,h)

    Renderer:resetColor()
end

--------------------------------------------------------------------------------
-- Draw an Entity.
--
-- @tparam Entity entity The entity to draw.
--
-- @return nil
function Renderer.static:drawEntity(entity)

    love.graphics.setColor(
        entity.color.r,
        entity.color.g,
        entity.color.b,
        entity.color.a
    )

    love.graphics.rectangle(
        'fill',
        entity.x,
        entity.y,
        entity.w,
        entity.h
    )

    Renderer:resetColor()
end
--------------------------------------------------------------------------------
-- Reset the draw color back to white.
--
-- @return FW.GFX.Color
function Renderer.static:resetColor()
    love.graphics.setColor(1,1,1,1)
end

return Renderer
