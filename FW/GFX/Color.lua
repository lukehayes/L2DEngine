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

--------------------------------------------------------------------------------
-- Generate a random color.
--
-- @return FW.GFX.Color.
function Color.static:random()

    local r = love.math.random(0,1)
    local g = love.math.random(0,1)
    local b = love.math.random(0,1)
    local a = love.math.random(0,1)

    return Color:new(r,g,b,a)
end

--------------------------------------------------------------------------------
-- Generate a random color with specific alpha value.
--
-- @return FW.GFX.Color.
function Color.static:randomAlphaBias(a)

    local r = love.math.random(0,1)
    local g = love.math.random(0,1)
    local b = love.math.random(0,1)
    local a = love.math.random(0,a)

    return Color:new(r,g,b,a)
end


--------------------------------------------------------------------------------
-- Generate a random color with a bias towards a specific color.
--
-- @tparam number bias A value bias between 0.0 and 1.0.
--
-- @return FW.GFX.Color
function Color.static:randomBias(bias)

    local r = love.math.random(bias,1)
    local g = love.math.random(bias,1)
    local b = love.math.random(bias,1)
    local a = love.math.random(0,1)

    return Color:new(r,g,b,a)
end

--------------------------------------------------------------------------------
-- Generate a random color with a bias towards BLUE.
--
-- @tparam number bias A value bias between 0.0 and 1.0.
--
-- @return FW.GFX.Color
function Color.static:randomBiasBlue(bias, biasRest)

    local r = love.math.random(0.0,biasRest)
    local g = love.math.random(0.0,biasRest)
    local b = love.math.random(0.0,bias)
    local a = love.math.random(1,1)

    return Color:new(r,g,b,a)
end

--------------------------------------------------------------------------------
-- Blue color helper.
--
-- @return FW.GFX.Color
function Color.static:BLUE()
    return Color:new(0,0,1,1)
end

--------------------------------------------------------------------------------
-- Green color helper.
--
-- @return FW.GFX.Color
function Color.static:GREEN()
    return Color:new(0,1,0,1)
end

--------------------------------------------------------------------------------
-- Red color helper.
--
-- @return FW.GFX.Color
function Color.static:RED()
    return Color:new(1,0,0,1)
end

--------------------------------------------------------------------------------
-- Black color helper.
--
-- @return FW.GFX.Color
function Color.static:BLACK()
    return Color:new(0,0,0,1)
end

--------------------------------------------------------------------------------
-- White color helper.
--
-- @return FW.GFX.Color
function Color.static:WHITE()
    return Color:new(1,1,1,1)
end

--------------------------------------------------------------------------------
-- Yellow color helper.
--
-- @return FW.GFX.Color
function Color.static:YELLOW()
    return Color:new(1,1,0,1)
end

--------------------------------------------------------------------------------
-- GREY color helper.
--
-- @return FW.GFX.Color
function Color.static:GREY()
    local shade = 0.5
    return Color:new(shade,shade,shade,shade)
end
return Color
