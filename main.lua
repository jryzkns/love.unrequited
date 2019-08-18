-- jryzkns 2019

local unrequited = require("unrequited")

function love.load()
        game = {}
        game.xdim, game.ydim = 640, 360
        game.title = ""
        unrequited:windowsetup(game.xdim,game.ydim,game.title)

        unrequited:closer_to_me('fragment')

        unrequited:pull_my_strings('fragment','my_name',make_name())

        unrequited.half_my_world['fragment'].my_name:test()

end

function make_name() 
        
        item = {}
        function item:test()
                print("test")
        end
        return item

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
end