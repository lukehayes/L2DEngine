--------------------------------------------------------------------------------
-- Represents an RGBA color. Also contains color helper methods.
--
-- @classmod Color
local class = require 'libs/middleclass'

local Color = class('Color')

--------------------------------------------------------------------------------
-- Constructor.
--
-- @tparam number r The RED component.
-- @tparam number g The GREEN component.
-- @tparam number b The BLUE component.
-- @tparam number a The ALPHA component.
--
function Color:initialize(r,g,b,a)
    self.r = r
    self.g = g
    self.b = b
    self.a = a
end

end

return Color
