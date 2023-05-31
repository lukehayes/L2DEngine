--------------------------------------------------------------------------------
-- An implementation of the QuadTree data structure.
--
-- @module QuadTree
--
local class = require 'libs/middleclass'
local Game = require 'FW.Core.Game'

local QuadTree = class('QuadTree')

--------------------------------------------------------------------------------
-- Constructor.
--
function QuadTree:initialize()
    self.root = {}
end

--------------------------------------------------------------------------------
-- Subdivide the screen into quadrants.
--
function QuadTree:subdivide(w,h)
    -- TODO Implement this method
    local sw = w / 2
    local sh = h / 2
end

return QuadTree

