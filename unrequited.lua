-- jryzkns 2019

-- and so a story begins,
local unrequited = {}

unrequited.half_my_world = {}
-- this is the half of my world that I can control, the other half I long to have is you
unrequited.hmw = unrequited.half_my_world

unrequited.core = {}

        unrequited.core.dt = 0
        -- the time that have passed may have been small, but every second counts
        
        unrequited.core.photographs = 0
        -- when time passes, perhaps all that we can keep are photographs

        unrequited.core.grounds = {}
        -- things before my eyes, there's almost an order to them;

        unrequited.core.now_i_see = 1
        -- now I see this, now I see that,
        -- but if I want to see you, I'd have to see through everything in the way too


        unrequited.core.waiting = false
        function unrequited.core:wait_for_me() unrequited.core.waiting = not unrequited.core.waiting end

        function unrequited.core:closer_to_me(your_name, item, non_file)

                unrequited.half_my_world[your_name] = (non_file == nil and require(your_name)) or
                                                        (item == nil and {} or item)

                if unrequited.half_my_world[your_name].draw then
                
                        unrequited.core.grounds[unrequited.core.now_i_see] = your_name
                        unrequited.core.now_i_see = unrequited.core.now_i_see + 1

                end

                if unrequited.half_my_world[your_name].init then
                        unrequited.half_my_world[your_name]:init()
                end

        end

        function unrequited.core:update(dt)
        
                unrequited.core.photographs, unrequited.core.dt = unrequited.core.photographs + 1, dt
        
                for what_i_want, what_i_need in pairs(unrequited.half_my_world) do
                        
                        if what_i_need.__update then what_i_need:__update(unrequited.core.photographs, unrequited.core.dt) end
                        if what_i_need.update then what_i_need:update(unrequited.core.photographs, unrequited.core.dt) end
        
                end
        
        end
        
        function unrequited.core:draw()
                
                unrequited.imagery:graphicsreset()
                
                for _, item in ipairs(unrequited.core.grounds) do
                        
                        if unrequited.half_my_world[item].__draw then unrequited.half_my_world[item]:__draw(unrequited.core.photographs, unrequited.core.dt) end
                        if unrequited.half_my_world[item].draw then unrequited.half_my_world[item]:draw(unrequited.core.photographs, unrequited.core.dt) end
                        
                end
                
        end
        

unrequited.events = {}

        function unrequited.events:let_go() unrequited.events:heartbreak() end

        function unrequited.events:heartbreak() love.event.quit() end

        function unrequited.events:mousepressed(x, y, button, istouch, presses)
        
                for what_i_want, what_i_touched in pairs(unrequited.half_my_world) do
        
                        if what_i_touched.mousepressed then what_i_touched:mousepressed(x, y, button, istouch, presses) end
        
                end
        
        end
        
        function unrequited.events:mousereleased(x, y, button, istouch, presses)
                
                for what_i_want, me_letting_go in pairs(unrequited.half_my_world) do
                        
                        if me_letting_go.mousereleased then me_letting_go:mousereleased(x, y, button, istouch, presses) end
        
                end
                
        end
        
        function unrequited.events:wheelmoved(x,y)
        
                for what_i_moved, what_had_stayed in pairs(unrequited.half_my_world) do
                        
                        if what_had_stayed.wheelmoved then what_had_stayed:wheelmoved(x,y) end
                
                end
                
        end
        
        function unrequited.events:keypressed(key, scancode, isrepeat)
                
                for what_i_want, what_i_held in pairs(unrequited.half_my_world) do
        
                        if what_i_held.keypressed then what_i_held:keypressed(key, scancode, isrepeat) end
                        
                end
                
        end
        
        function unrequited.events:keyreleased(key, scancode)
                
                for what_i_want, what_got_away in pairs(unrequited.half_my_world) do
        
                        if what_got_away.keyreleased then what_got_away:keyreleased(key, scancode) end
        
                end
                
        end

unrequited.imagery = {}

        function unrequited.imagery:graphicsreset()
                
                love.graphics.setColor(1, 1, 1, 1)
                love.graphics.origin()
                love.graphics.scale(unrequited.display.winscalex, unrequited.display.winscaley)
                
        end

unrequited.entities = {}

        function unrequited.entities:pull_my_strings(obj,field,res)

                if not obj.name then obj,name = obj end

                if not unrequited.half_my_world.obj then unrequited.core:closer_to_me(obj,name, obj, nil) end
                unrequited.half_my_world[obj][field] = res
                
        end

        function unrequited.entities:shape_of_you(x, y, spritepath) return unrequited.entities:generic_entity_load(x, y, spritepath, false) end

        function unrequited.entities:generic_entity_load(x, y, spritepath, is_animate)

                local ent = {}
                ent.x, ent.y = x, y
                ent.x_offset, ent.y_offset = 0, 0
                
                ent.rotation = 0
                ent.rotationstyle = "FREE"      -- free rotate by default
                ent.rotationstyles = {  "FLAT",         -- no rotations whatsoever
                "FREE",         -- rotation anyway you want
                                        "HEMISPHERE",   -- only rotate half-way, other half mirror
                                        "TWO-WAY"       -- only facing one way or the other
                }
                
                if spritepath then
                        
                        ent.sprite = love.graphics.newImage(spritepath)

                        ent.debug_align = false
                        
                        function ent:show_align_cross()
                                love.graphics.line(ent.x - 10, ent.y, ent.x + 10, ent.y)
                                love.graphics.line(ent.x, ent.y - 10, ent.x, ent.y + 10)
                        end

                        ent.isFlipx = false
                        
                        if not is_animate then
                                
                                ent.box = ent.sprite:getDimensions()
                                
                                function ent:__draw()
                                        
                                        love.graphics.push()
                                        love.graphics.translate(ent.x, ent.y)
                                        ent:rotation_handle()
                                        love.graphics.translate(-ent.x_offset, -ent.y_offset)
                                        love.graphics.draw(ent.sprite)

                                        if ent.isFlipx then

                                                love.graphics.draw(     ent.sprite, 
                                                                        ent.box[1],0,
                                                                        0,
                                                                        -1,1
                                                                )

                                                        else

                                                                love.graphics.draw(ent.sprite)

                                        end
                                        
                                        love.graphics.pop()
                                        
                                        if ent.debug_align then ent:show_align_cross() end

                                end

                        end

                        function ent:recentre(x_offset_perc, y_offset_perc) ent.x_offset, ent.y_offset = x_offset*ent.box[1], y_offset*ent.box[2] end

                        function ent:rotation_handle()

                                if ent.rotationstyle == "FREE" then

                                        love.graphics.rotate(ent.rotation)
                                        
                                elseif ent.rotationstyle == "TWO-WAY" then
                                        
                                        ent.isFlipx = ent.rotation < math.pi
                                        
                                elseif ent.rotationstyle == "HEMISPHERE" then
                                        
                                        ent.isFlipx = ent.rotation < math.pi
                                        love.graphics.rotate(ent.rotation)

                                        -- elseif ent.rotationstyle == "STATIC" then
                                        -- do nothing
                                end
                        end
                        
                else print('NO SPRITE SPECIFIED') end
                
                return ent
                
        end

        function unrequited.entities:see_you_move(x, y, spritepath, frames, framex, framey, fps) return unrequited.entities:generic_animation_load(x, y, spritepath, frames, framex, framey, fps) end

        function unrequited.entities:generic_animation_load(x, y, spritepath, frames, framex, framey, fps)

                local ent = unrequited.entities:generic_entity_load(x, y, spritepath, true)
                ent.box = {framex, framey}
                ent.animation_quads, ent.frames, ent.fps = {}, frames, fps

                for i = 0, ent.frames - 1 do

                        ent.animation_quads[i] =
                                love.graphics.newQuad(
                                        i * framex, 0, -- start point
                                framex, framey, -- deviation from start point (quad size)
                                ent.sprite:getDimensions()
                        )
                        
                end
                
                ent.cum_dt, ent.current_frame = 0, 0
                
                function ent:__update(n, dt)

                        ent.cum_dt = ent.cum_dt + dt
                
                        if ent.cum_dt > 1 / ent.fps then

                                ent.current_frame = (ent.current_frame + 1) % ent.frames
                                ent.cum_dt = ent.cum_dt - 1 / ent.fps
                                
                        end

                end

                function ent:__draw(t, dt)
                        
                        love.graphics.push()
                        
                        love.graphics.translate(ent.x, ent.y)
                        ent:rotation_handle()
                        
                        love.graphics.translate(-ent.x_offset, -ent.y_offset)
                        
                        if ent.isFlipx then
                                
                                love.graphics.draw(     ent.sprite, 
                                                        ent.animation_quads[ent.current_frame],
                                                        ent.box[1],0,
                                                        0,
                                                        -1,1
                                                )
                                                
                                        else
                                
                                                love.graphics.draw(     ent.sprite, 
                                                        ent.animation_quads[ent.current_frame]
                                                )
                                                
                                        end

                                        love.graphics.pop()

                                        if ent.debug_align then ent:show_align_cross() end
                end
                
                return ent
                
        end

unrequited.display = {}

        unrequited.display.windowx, unrequited.display.windowy = nil,nil

        function unrequited.display:windowsetup(wx, wy, title, gx, gy)
                
                unrequited.display.windowx, unrequited.display.windowy = wx, wy
                love.window.setMode(wx, wy)
                love.window.setTitle(title)

                if (gx ~= nil and gy ~= nil) and (gx ~= wx or gy ~= wy )then 
                        unrequited.display:rescale(gx,gy) 
                end
                
        end

        unrequited.display.gamex, unrequited.display.gamey = nil, nil
        unrequited.display.winscalex, unrequited.display.winscaley = 1, 1

        function unrequited.display:rescale(gx,gy)

                unrequited.display.gamex, unrequited.display.gamey = gx, gy
                unrequited.display.winscalex = unrequited.display.windowx/gx
                unrequited.display.winscaley = unrequited.display.windowy/gy
                
        end

unrequited.audio = {}

        function unrequited.audio:setup_bgm(audiopath, mode)
                
                bgm = love.audio.newSource(audiopath, mode ~= nil and mode or 'stream')
                bgm:setLooping(true)
                return bgm

        end

        function unrequited.audio:setup_sfx(audiopath, mode)

                return love.audio.newSource(audiopath, mode ~= nil and mode or 'static')

        end

unrequited.misc = {}

        function unrequited.misc:negate(clause) return not clause end

        function unrequited.misc:remember_me()

                love.filesystem.createDirectory("unrequited memories")
                local filename = "unrequited memories/unrequited_memory" .. os.time() .. ".png"
                love.graphics.captureScreenshot(filename)
                
        end

        function unrequited.misc:miss_me(x, y, game_width, game_height) return ( (x * y < 0) or (x > game_width) or (y > game_height) ) end

return unrequited
-- and hopefully, the legacy lives on, but the pain won't