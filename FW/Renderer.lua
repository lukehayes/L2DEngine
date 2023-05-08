local class = require 'libs/middleclass'

local Renderer = class('Renderer')

function Renderer:initialize()
end

function Renderer:drawSprite(sprite)
    --love.graphics.draw(sprite.image, sprite.x,sprite.y, 0, sprite.scale, sprite.scale)
    --love.graphics.quad(sprite.image, sprite.x,sprite.y, 0, sprite.scale, sprite.scale)
end

return Renderer
