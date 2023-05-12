--------------------------------------------------------------------------------
-- An observer class with built in hooks that objects can be attached to
-- be run at a specific time.
--
-- Built in hooks are:
--  init,
--  update_begin,
--  update_end,
--  draw_begin,
--  draw_end
--
-- @classmod EventManager

local class = require 'libs/middleclass'

local EventManager = class('EventManager')

--------------------------------------------------------------------------------
-- Constructor.
--
-- @usage
-- -- local EventManager = require 'FW.EventManager'
-- -- local em = EventManager:new()
function EventManager:initialize()
    self.events = {
        ['init'] = {},
        ['update_begin'] = {},
        ['update_end'] = {},
        ['draw_begin'] = {},
        ['draw_end'] = {}
    }
end

--------------------------------------------------------------------------------
-- Run a specific event.
-- 
-- @tparam string event The event name.
--
-- @usage
-- -- local em = EventManager:new()
-- -- em:run('draw_begin')
function EventManager:run(event)
    for k,v in ipairs(self.events[event]) do
        v()
    end
end


return EventManager
