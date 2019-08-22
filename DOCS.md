# Documentation 

## Table of Contents  
+ [Preamble](#Preamble)
+ [Features](#Features)
+ [Quick Tutorial](#Tutorial)
+ [Modules](#Modules)
+ [Integration](#Integration)

<a name="Preamble"/>

## Preamble

<a name="Features"/>

## Features

<a name="Tutorial"/>

## Quick Tutorial

<a name="Modules"/>

## Modules

<a name="submodules"/>

`love.unrequited` is organized into the following submodules:
- [`unrequited`](#unrequited)
- [`unrequited.core`](#core)
- [`unrequited.events`](#events)
- [`unrequited.imagery`](#imagery)
- [`unrequited.entities`](#entities)
- [`unrequited.display`](#display)
- [`unrequited.audio`](#audio)
- [`unrequited.misc`](#misc)

Each of these [submodules](#submodule) will be explained in detail here.

<a name="unrequited"/>

#### `unrequited`

This is the top level of the module that contains all other [submodules](#submodule).

- `unrequited.half_my_world` 
  - A table that holds all of the objects that the `unrequited` module automatically handles. It goes under an alias of `unrequited.hmw` for short.
  - The following code snippet shows a sample usage of the `unrequited.half_my_world` table for simple bound checking:
  ```lua
        unrequited.half_my_world["player"].x = unrequited.half_my_world["player"].x + 5
        if unrequited.hmw["player"].x > SCREENWIDTH then 
        -- note that hmw and half_my_world refers to the same table
                unrequited.hmw["player"].x = SCREENWIDTH
        end
  ```
  - please note that object membership inside of `unrequited.half_my_world` is and should be dealt with automatically through other functions such as `unrequited:closer_to_me` and `unrequited:pull_my_strings`.<!-- and their links --> 
  - **Unless you know what you are doing, please do not manually insert new objects into this table!!**

<a name="core"/>

#### `unrequited.core`

        function unrequited.core:closer_to_me(your_name, item, non_file)

        function unrequited.core:update(dt)
        unrequited.core.dt = 0
        unrequited.core.photographs = 0
        
        unrequited.core.grounds = {}
        unrequited.core.now_i_see = 1
        unrequited.core:draw()

        unrequited.core.waiting = false
        function unrequited.core:wait_for_me() 

<a name="events"/>

#### `unrequited.events`

        function unrequited.events:let_go() 

        function unrequited.events:heartbreak()

        function unrequited.events:mousepressed(x, y, button, istouch, presses)
                
        function unrequited.events:mousereleased(x, y, button, istouch, presses)
                        
        function unrequited.events:wheelmoved(x,y)
                
        function unrequited.events:keypressed(key, scancode, isrepeat)
                
        function unrequited.events:keyreleased(key, scancode)
                

<a name="imagery"/>

#### `unrequited.imagery`

        function unrequited.imagery:graphicsreset()

<a name="entities"/>

#### `unrequited.entities`

        function unrequited.entities:pull_my_strings(obj,field,res)

        function unrequited.entities:shape_of_you(x, y, spritepath)

        function unrequited.entities:generic_entity_load(x, y, spritepath, is_animate)

        function unrequited.entities:see_you_move(x, y, spritepath, frames, framex, framey, fps)

        function unrequited.entities:generic_animation_load(x, y, spritepath, frames, framex, framey, fps)

<a name="display"/>

#### `unrequited.display`

        function unrequited.display:windowsetup(wx, wy, title, gx, gy)

        function unrequited.display:rescale(gx,gy)

<a name="audio"/>

#### `unrequited.audio`

        function unrequited.audio:setup_bgm(audiopath, mode)

        function unrequited.audio:setup_sfx(audiopath, mode)

<a name="misc"/>

#### `unrequited.misc`

        function unrequited.misc:negate(clause)

        function unrequited.misc:remember_me()

        function unrequited.misc:miss_me(x, y, game_width, game_height)

<a name="Integration"/>

## Integration