-- jryzkns 2019

local unrequited = require("unrequited")

function love.load()
        window = {}
        window.xdim, window.ydim = 640, 360
        window.title = ""
        -- gamexdim,gameydim = 640, 360
        unrequited.display:windowsetup( window.xdim,window.ydim,window.title
                                -- ,gamexdim,gameydim
                        )

        unrequited.core:closer_to_me('fragment')
        -- unrequited.entities:pull_my_strings('fragment','note',unrequited.audio:setup_sfx("a440.mp3"))

        -- unrequited.hmw['fragment'].note:play()
end

function love.update(dt)
        if not unrequited.core.waiting then
                unrequited.core:update(dt)
        end
end

function love.mousepressed(x,y,button,istouch,presses)
        unrequited.events:mousepressed(x,y,button,istouch,presses)
end

function love.mousereleased(x,y,button,istouch,presses)
        unrequited.events:mousereleased(x,y,button,istouch,presses)
end

function love.keypressed(key,scancode,isrepeat)
        if key == "space" then 
                unrequited.core:wait_for_me()
        elseif key == "p" then 
                unrequited.misc:remember_me()
        end

        unrequited.events:keypressed(key,scancode,isrepeat)
end

function love.keyreleased(key,scancode)
        if key == "escape" then 
                unrequited.events:heartbreak() 
        end
        unrequited.events:keyreleased(key,scancode)
end

function love.wheelmoved(x,y)
        unrequited.events:wheelmoved(x,y)
end

function love.draw()
        unrequited.core:draw()
end