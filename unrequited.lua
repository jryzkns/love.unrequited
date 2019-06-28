-- jryzkns 2019

-- and so a story begins,
local unrequited = {}

unrequited.photographs = 0 
-- when time passes, perhaps all that we can keep are photographs

unrequited.dt = 0
-- the time that have passed may have been small, but every second counts

unrequited.half_my_world = {} 
-- this is the half of my world that I can control, the other half I long to have is you

unrequited.grounds = {}
-- things before my eyes, there's almost an order to them; 
unrequited.now_i_see = 1
-- now I see this, now I see that, 
-- but if I want to see you, I'd' have to see everything that comes before too

function unrequited:closer_to_me(your_name)

        unrequited.half_my_world[your_name] = require(your_name)
        
        unrequited.grounds[unrequited.now_i_see] = your_name
        unrequited.now_i_see = unrequited.now_i_see + 1

        if unrequited.half_my_world[your_name].init then unrequited.half_my_world[your_name].init() end

end

function unrequited:update(dt)

        unrequited.photographs = unrequited.photographs + 1
        unrequited.dt = dt

        for what_i_want, what_i_need in pairs(unrequited.half_my_world) do
                if what_i_need.update then what_i_need:update(unrequited.photographs, dt) end
        end
end

function unrequited:draw()

        unrequited:graphicsreset()

        for _, item in ipairs(unrequited.grounds) do
                
                if unrequited.half_my_world[item].draw then 
                        unrequited.half_my_world[item]:draw(unrequited.photographs, unrequited.dt) 
                end

        end

end

function unrequited:mousepressed(x,y,button,istouch,presses)

        for what_i_want, what_i_touched in pairs(unrequited.half_my_world) do
                if what_i_touched.mousepressed then what_i_touched:mousepressed(x,y,button,istouch,presses) end
        end

end

function unrequited:mousereleased(x,y,button,istouch,presses)

        for what_i_want, me_letting_go in pairs(unrequited.half_my_world) do
                if me_letting_go.mousereleased then me_letting_go:mousereleased(x,y,button,istouch,presses) end
        end

end

function unrequited:keypressed(key,scancode,isrepeat)

        for what_i_want, what_i_held in pairs(unrequited.half_my_world) do
                if what_i_held.keypressed then what_i_held:keypressed(key,scancode,isrepeat) end
        end

end

function unrequited:keyreleased(key,scancode)

        for what_i_want, what_got_away in pairs(unrequited.half_my_world) do
                if what_got_away.keyreleased then what_got_away:keyreleased(key,scancode) end
        end

end

function unrequited:shape_of_you(x,y,spritepath)

        return unrequited:generic_entity_load(x,y,spritepath,false)

end

function unrequited:generic_entity_load(x,y,spritepath,is_animate)

        local ent = {}
        ent.x,ent.y=x,y

        if spritepath then

                ent.sprite = love.graphics.newImage(spritepath)

                if not is_animate then
                        
                        function ent:draw()
                                love.graphics.push()
                                        love.graphics.translate(ent.x,ent.y)
                                        love.graphics.draw(ent.sprite)
                                love.graphics.pop()
                        end
        
                        local spritex, spritey = ent.sprite:getWidth(), ent.sprite:getHeight()
        
                        function ent:centrex() ent.x = ent.x + spritex/2 end
                        function ent:centrey() ent.y = ent.y + spritey/2 end
                        function ent:centre() ent:centrex();ent:centrey(); end

                end
        
        end
        
        return ent
end

function unrequited:see_you_move(x,y,spritepath,frames,framex,framey,fps) 
        return unrequited:generic_animation_load(x,y,spritepath,frames,framex,framey,fps)
end

function unrequited:generic_animation_load(x,y,spritepath,frames,framex,framey,fps)

        local ent = unrequited:generic_entity_load(x,y,spritepath,true)

        ent.animation_quads, ent.frames, ent.fps = {}, frames, fps

        for i=0,ent.frames - 1 do
                ent.animation_quads[i] = love.graphics.newQuad( i*framex, 0,    -- starting point
                                                                framex, framey, -- quad size
                                                                ent.sprite:getDimensions()
                                                        )
        end

        ent.cum_dt, ent.current_frame = 0, 0

        function ent:draw(t, dt)
                ent.cum_dt = ent.cum_dt + dt
                
                if ent.cum_dt > 1/ent.fps then
                        ent.current_frame = (ent.current_frame + 1) % ent.frames
                        ent.cum_dt = ent.cum_dt - 1/ent.fps
                end

                love.graphics.push()
                        love.graphics.translate(ent.x,ent.y)
                        love.graphics.draw(     ent.sprite,
                                                ent.animation_quads[ent.current_frame]
                                        )
                love.graphics.pop()
        end

        function ent:centrex() ent.x = ent.x - framex/2 end 

        return ent
end

function unrequited:generic_window(x,y,w,h)

        local ent = unrequited:generic_entity_load(x,y,nil,false)

        ent.show = false
        ent.width,ent.height = w,h

        return ent

end

function unrequited:windowsetup(xdim,ydim,title)

        love.window.setMode(xdim,ydim)
        love.window.setTitle(title)

end

--mode can only be "static" or "streaming"
function unrequited:bgmsetup(audiopath,mode)
        
        local bgm = love.audio.newSource(audiopath,mode)
        bgm:setLooping(true)
        bgm:play()

end

function unrequited:graphicsreset()

        love.graphics.setColor(1,1,1,1)
        love.graphics.origin()

end

function unrequited:negate(clause)

        return not clause

end

function unrequited:let_go() unrequited:heartbreak() end

function unrequited:heartbreak()

        love.event.quit()

end

function unrequited:remember_me()

        --screenshot saved in ~/.local/share/love/$(project)/
        love.filesystem.createDirectory("unrequited memories")
        local filename = "unrequited memories/unrequited_memory" .. os.time() .. ".png" 
        love.graphics.captureScreenshot(filename)

end

unrequited.waiting = false

function unrequited:wait_for_me() unrequited.waiting = not unrequited.waiting end

function unrequited:miss_me(x,y,game_width,game_height) 

        -- returns true if (x,y) is outside of game window
        if x*y < 0 then return true -- wrong quadrant
        elseif x > game_width then return true -- x too far
        elseif y > game_height then return true -- y too far
        end
        return false

end

return unrequited
-- and hopefully, the legacy lives on, but the pain won't