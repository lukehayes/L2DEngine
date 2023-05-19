--------------------------------------------------------------------------------
-- A simple container that sprites or any other object can be added too. Once
-- an object has been added then its update() and draw() methods are
-- called automatically 
--
-- @classmod Container
--
local class = require 'libs/middleclass'

local Container = class('Container')

--------------------------------------------------------------------------------
-- Constructor.
--
-- @usage
-- -- local Container = require 'FW.Container'
-- -- local co = Container:new()
function Container:initialize()
    self.entities = {}
end

--------------------------------------------------------------------------------
-- Get the number of elements inside the container.
--
-- @return number
function Container:size()
    return #self.entities
end

--------------------------------------------------------------------------------
-- Add an object to the container
--
-- @param entity The object to be stored inside the container
--
-- @return nil
function Container:add(entity)
    local id = self:size() + 1
    entity.id  = id
    table.insert(self.entities, entity)
end

--------------------------------------------------------------------------------
-- Run every object stored in the containers draw() method.
--
-- @return nil
function Container:draw()
    for k,v in ipairs(self.entities) do

       --TODO This is just for fun, will remove later.
       love.graphics.setColor(0.5,0.5,0.5,0.7)
       love.graphics.setBlendMode('darken', 'premultiplied')
       love.graphics.circle('fill', v.x + 24, v.y + 42, 17)

       love.graphics.setColor(1,1,1,1)
       love.graphics.setBlendMode('alpha')
       v:draw()
    end
end

--------------------------------------------------------------------------------
-- Run every object stored in the containers update() method.
--
-- @tparam number dt Delta time.
--
-- @return nil
function Container:update(dt)
    for k,v in ipairs(self.entities) do
       v:update(dt)
    end
end

return Container

