local unrequited = require("unrequited")

function love.load()
        game = {}
        game.xdim, game.ydim = 200, 200
        game.title = "draw order testing"
        unrequited:windowsetup(game.xdim,game.ydim,game.title)

        unrequited:closer_to_me("a") -- yellow
        unrequited:closer_to_me("c") -- magenta
        unrequited:closer_to_me("b") -- cyan

        print("canonical order")
        for k,v in pairs(unrequited.half_my_world) do
                print(k)
        end

        unrequited.grounds = {
                [1] = "a",
                [2] = "b",
                [3] = "c",
        }

        print("draw order")
        for k,v in pairs(unrequited.grounds) do
                print(v)
        end
end

function love.update(dt)
        if not unrequited.waiting then
                -- unrequited:update(unrequited.photographs, dt)
        end
end

function love.mousepressed(x,y,button,istouch,presses)
        unrequited:mousepressed(x,y,button,istouch,presses)
end

function love.mousereleased(x,y,button,istouch,presses)
        unrequited:mousereleased(x,y,button,istouch,presses)
end

function love.keypressed(key,scancode,isrepeat)
        if key == "space" then unrequited:wait_for_me()
        elseif key == "p" then unrequited:remember_me()
        end

        unrequited:keypressed(key,scancode,isrepeat)
end

function love.keyreleased(key,scancode)
        if key == "escape" then unrequited:heartbreak() end
        unrequited:keyreleased(key,scancode)
end

function love.draw()
        love.graphics.setBackgroundColor(0.5,0.5,0.5,1)
        unrequited:draw()
end