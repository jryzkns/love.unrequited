-- jryzkns 2018

local unrequited = {}

unrequited.photographs = 0 
-- when time passes, perhaps all that we can keep are photographs

unrequited.half_my_world = {} 
-- this is the half of my world that I can control, the other half I long to have is you

function unrequited:update()
        unrequited.photographs = unrequited.photographs + 1
        -- update all the entities in unrequited.half_my_world as well
        for what_i_want, what_i_need in pairs(unrequited.half_my_world) do
                pcall(function() what_i_need:update() end)
        end
end

function unrequited:shape_of_you(x,y,spritepath)
        return unrequited:generic_entity_load(x,y,spritepath)
end

function unrequited:generic_entity_load(x,y,spritepath)
        local ent = {}
        ent.x,ent.y=x,y
        if spritepath then
                ent.sprite = love.graphics.newImage(spritepath)
                function ent:draw()
                        love.graphics.push()
                                love.graphics.translate(ent.x,ent.y)
                                love.graphics.draw(ent.sprite)
                        love.graphics.pop()
                end

                local framex, framey = ent.sprite:getWidth(), ent.sprite:getHeight()

                function ent:centrex() ent.x = ent.x + framex/2 end
                function ent:centrey() ent.y = ent.y + framey/2 end
                function ent:centre() ent:centrex();ent:centrey(); end
        
        end
        
        return ent
end

function unrequited:see_you_move() 
        return unrequited:generic_animation_load(x,y,spritepath,frames,framex,framey,animationdescaling)
end

function unrequited:generic_animation_load(x,y,spritepath,frames,framex,framey,animationdescaling)
        local ent = unrequited:generic_entity_load(x,y,spritepath)
        ent.animation, ent.frames = {},frames
        for i=0,ent.frames - 1 do
                ent.animation[i] = love.graphics.newQuad(i*framex, 0, framex, framey, ent.sprite:getDimensions())
        end
        function ent:draw(t) -- this overwrites the draw() from generic_entity_load
                love.graphics.push()
                love.graphics.translate(ent.x,ent.y)
                love.graphics.draw(ent.sprite,ent.animation[math.floor(t/animationdescaling)%ent.frames])
                love.graphics.pop()
        end

        function ent:centrex() ent.x = ent.x + framex/2 end -- overwrite the centrex method to accomodate spritesheets

        return ent
end

function unrequited:generic_window(x,y,w,h)
        local ent = unrequited:generic_entity_load(x,y,nil)
        ent.show = false
        ent.width,ent.height = w,h
        return ent

end

function unrequited:windowsetup(xdim,ydim,title)
        love.window.setMode(xdim,ydim)
        love.window.setTitle(title)
end

-- TODO: make function return a bgm object instead
function unrequited:bgmsetup(audiopath,mode) --mode can only be "static" or "streaming"
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
