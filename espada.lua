local unrequited = require('unrequited')

local ____this = unrequited:see_you_move(       400,200,
                                                'espada_spritesheet.png',
                                                14,
                                                192,492,
                                                5
                                        )

____this:centrex()



function ____this:init() end
function ____this:update(n_frames, dt) end
-- function ____this:draw() end

function ____this:mousepressed(x,y,button,istouch,presses) end
function ____this:mousereleased(x,y,button,istouch,presses) end
function ____this:keypressed(key,scancode,isrepeat) 
        if key == 'up' then
                ____this.fps = ____this.fps + 1
                if ____this.fps > 36 then
                        ____this.fps = 36
                end

                print('new fps:'..tostring(____this.fps))
        elseif key == 'down' then
                ____this.fps = ____this.fps - 1
                if ____this.fps < 0 then
                        ____this.fps = 0
                end

                print('new fps:'..tostring(____this.fps))
        end
end
function ____this:keyreleased(key,scancode) end

return ____this