
local animations = {

   -------------------------------------------------
   -- Knight
   -------------------------------------------------
    ['knight'] = {
        ['idle'] = {
            ['down']= {
                frame_x     = 13,
                frame_y     = 8,
                frame_count = 4
            },

            ['up'] = {
                frame_x     = 13,
                frame_y     = 9,
                frame_count = 4
            },

            ['right'] = {
                frame_x     = 13,
                frame_y     = 10,
                frame_count = 4
            },

            ['left'] = {
                frame_x     = 13,
                frame_y     = 11,
                frame_count = 4
            }
        },

        ['walk'] = {
            ['down']= {
                frame_x     = 13,
                frame_y     = 0,
                frame_count = 4
            },

            ['up'] = {
                frame_x     = 13,
                frame_y     = 1,
                frame_count = 4
            },

            ['right'] = {
                frame_x     = 13,
                frame_y     = 2,
                frame_count = 4
            },

            ['left'] = {
                frame_x     = 13,
                frame_y     = 3,
                frame_count = 4
            }
        }
    },

   -------------------------------------------------
   -- HatChar
   -------------------------------------------------
    ['hatchar'] = {
        ['idle'] = {
            ['down'] = {
                frame_x     = 18,
                frame_y     = 0,
                frame_count = 4
            },

            ['up'] = {
                frame_x     = 18,
                frame_y     = 1,
                frame_count = 4
            },

            ['right'] = {
                frame_x     = 18,
                frame_y     = 2,
                frame_count = 4
            },

            ['left'] = {
                frame_x     = 18,
                frame_y     = 3,
                frame_count = 4
            },
        },

        ['walk'] = {
            ['down'] = {
                frame_x     = 18,
                frame_y     = 4,
                frame_count = 4
            },

            ['up'] = {
                frame_x     = 18,
                frame_y     = 5,
                frame_count = 4
            },

            ['right'] = {
                frame_x     = 18,
                frame_y     = 6,
                frame_count = 4
            },

            ['left'] = {
                frame_x     = 18,
                frame_y     = 7,
                frame_count = 4
            },
        }
   }
}

return animations
