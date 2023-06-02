--------------------------------------------------------------------------------
-- An implementation of the QuadTree data structure.
--
-- @module QuadTree
--
local class = require 'libs/middleclass'
local Game  = require 'FW.Core.Game'
local Rect  = require 'FW.Shape.Rect'

local QuadTree = class('QuadTree')

--------------------------------------------------------------------------------
-- Constructor.
--
function QuadTree:initialize(bounds)

    self.bounds = bounds
    self.max_capacity = 4
    self.entities = {}
    self.divided = false

    self.northwest = nil
    self.northeast = nil
    self.southeast = nil
    self.southwest = nil
end


function QuadTree:insert(entity)

    if(#self.entities < self.max_capacity) then
        table.insert(self.entities, entity)
    else
        if not self.divided then
            self:subdivide()
            self.divided = true
        end

        self.northeast:insert(entity)
        self.northwest:insert(entity)
        self.southwest:insert(entity)
        self.southeast:insert(entity)
    end
end

--------------------------------------------------------------------------------
-- Subdivide the screen into quadrants.
--
function QuadTree:subdivide()

        local nw = Rect:new(
            self.bounds.x,
            self.bounds.y,
            self.bounds.w / 2,
            self.bounds.h / 2
        )
        self.northwest = QuadTree:new(nw)

        local ne = Rect:new(
            self.bounds.w / 2,
            self.bounds.y,
            self.bounds.w / 2,
            self.bounds.h / 2
        )
        self.northeast = QuadTree:new(ne)

        local se = Rect:new(
            self.bounds.w / 2,
            self.bounds.h / 2,
            self.bounds.w / 2,
            self.bounds.h / 2
        )
        self.southeast = QuadTree:new(se)

        local sw = Rect:new(
            self.bounds.x,
            self.bounds.h / 2,
            self.bounds.w / 2,
            self.bounds.h / 2
        )
        self.southwest = QuadTree:new(sw)
end

function QuadTree:drawRects()
    love.graphics.rectangle("line", self.bounds.x,self.bounds.y, self.bounds.w,self.bounds.h)

    if self.divided then
        
        for _,e in ipairs(self.entities) do
            love.graphics.rectangle('line',
                e.x,
                e.y,
                e.w,
                e.h
            )
        end


        self.northwest:drawRects()
        self.northeast:drawRects()
        self.southwest:drawRects()
        self.southeast:drawRects()
    end
end

function QuadTree:drawPoints()

    for _,e in ipairs(self.entities) do
        love.graphics.rectangle(
            'line',
            e.x,
            e.y,
            e.w,
            e.h
        )
    end

end

return QuadTree

