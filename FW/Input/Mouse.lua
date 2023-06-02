--------------------------------------------------------------------------------
-- Helper class for the mouse. Consists of only static methods.
--
-- @classmod Mouse
local class = require 'libs/middleclass'

local Mouse = class('Mouse')

--------------------------------------------------------------------------------
-- Constructor.
function Mouse:initialize()
    self.mouseDown = false
end

function Mouse:pressed()
    if(love.mouse.isDown(1) and not self.mouseDown) then
        self.mouseDown = true
        return true, love.mouse.getPosition()
    end

    if(not love.mouse.isDown(1) and self.mouseDown) then
        self.mouseDown = false
    end
end

return Mouse
