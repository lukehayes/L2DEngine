local class = require 'libs/middleclass'

local Contianer = class('Contianer')

function Contianer:initialize()
    self.entities = {}
end

function Contianer:size()
    return #self.entities
end

function Contianer:add(entity)
    table.insert(self.entities, entity)
end

function Contianer:draw()
    for k,v in ipairs(self.entities) do
       v:draw()
    end
end

function Contianer:update(dt)
    for k,v in ipairs(self.entities) do
       v:update(dt)
    end
end

return Contianer

