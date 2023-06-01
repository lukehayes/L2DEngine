--------------------------------------------------------------------------------
-- An implementation of the TreeNode for use with the QuadTree
--
-- @module TreeNode
--
local class = require 'libs/middleclass'
local Game = require 'FW.Core.Game'

local TreeNode = class('TreeNode')

--------------------------------------------------------------------------------
-- Constructor.
--
function TreeNode:initialize()
    self.TL = nil
    self.TR = nil
    self.BL = nil
    self.BR = nil
end

return TreeNode

