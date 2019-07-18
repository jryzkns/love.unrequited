-- his heart broke into so many pieces,
-- fragments were everywhere...
local unrequited = require('unrequited')
local fragment =  unrequited:see_you_move(       600,500,
                                                'espada_spritesheet.png',
                                                14,
                                                192,492,
                                                5
                                                )
function fragment:init()
        fragment:recentre(0.5,0.85)
        fragment.rotationstyle = "HEMISPHERE"
end
function fragment:update(n_frames, dt)
        fragment.x, fragment.y = love.mouse.getPosition()
        fragment.rotation = (fragment.rotation - 0.01) % 6.24
end
function fragment:mousepressed(x,y,button,istouch,presses) end
function fragment:mousereleased(x,y,button,istouch,presses) end
function fragment:keypressed(key,scancode,isrepeat) 
        if key == 'd' then
                fragment.debug_align = not fragment.debug_align
        elseif key == 'left' then
                fragment.rotation = (fragment.rotation - 0.1) % (2*math.pi)
                print(fragment.rotation)
        elseif key == 'right' then
                fragment.rotation = (fragment.rotation + 0.1) % (2*math.pi)
                print(fragment.rotation)
        end

end
function fragment:keyreleased(key,scancode) end
return fragment
