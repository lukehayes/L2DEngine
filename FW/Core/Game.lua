--------------------------------------------------------------------------------
-- Game class is a single object designed to hold data (mostly static) useful globally.
--
-- @classmod Game
local class = require 'libs/middleclass'
local Color = require 'FW.GFX.Color'
local Container     = require('FW.DS.Container')

local Game = class('Game')

--------------------------------------------------------------------------------
-- Constructor.
--
function Game:initialize()
end

--------------------------------------------------------------------------------
-- Get the default font.
--
-- @return love.graphics.newFont
function Game.static:default_font()
   return love.graphics.newFont('assets/cozette_bitmap.ttf', 13)
end

--------------------------------------------------------------------------------
-- Get the width of the window.
--
-- @return love.graphics.newFont
function Game.static:width()
   return love.graphics.getWidth()
end

--------------------------------------------------------------------------------
-- Get the height of the window.
--
-- @return love.graphics.newFont
function Game.static:height()
   return love.graphics.getHeight()
end

return Game

