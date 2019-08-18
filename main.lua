-- jryzkns 2019

local unrequited = require("unrequited")

function love.load()
        game, window = {}, {}

        window.title = ""
        window.xdim, window.ydim = 640, 360
        g_xdim, g_ydim = 1280, 720

        unrequited:windowsetup( window.xdim, window.ydim,
                                window.title,
                                g_xdim,g_ydim
                        )

        unrequited:closer_to_me('fragment')

end

function love.update(dt)
        if not unrequited.waiting then
                unrequited:update(dt)
        end
end

function love.mousepressed(x,y,button,istouch,presses)
        unrequited:mousepressed(x,y,button,istouch,presses)
end

function love.mousereleased(x,y,button,istouch,presses)
        unrequited:mousereleased(x,y,button,istouch,presses)
end

function love.keypressed(key,scancode,isrepeat)
        if key == "space" then 
                unrequited:wait_for_me()
        elseif key == "p" then 
                unrequited:remember_me()
        end

        unrequited:keypressed(key,scancode,isrepeat)
end

function love.resize(w,h) unrequited:rescale(w,h) end

function love.keyreleased(key,scancode)
        if key == "escape" then 
                unrequited:heartbreak() 
        end
        unrequited:keyreleased(key,scancode)
end

function love.wheelmoved(x,y)
        unrequited:wheelmoved(x,y)
end

function love.draw()
        unrequited:draw()

        love.graphics.circle("fill",1000,700,10)
end