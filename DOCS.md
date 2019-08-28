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

<a name="object_spec"/>

#### Game Object Specifications


<a name="objhandling"/>

#### Automated Object Handling

<a name="pause-tut"/>

#### toggle pause/unpause

<a name="draw-order"/>

#### managing draw order

<a name="virtres"/>

#### Virtual Resolution

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

Each of these [submodules](#submodule) and the functions they contain will be explained in detail here.

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
  - please note that object membership inside of `unrequited.half_my_world` is and should be dealt with automatically through other functions such as `unrequited.core:closer_to_me` and `unrequited.entities:pull_my_strings`. <!-- and their links --> 
  - **Unless you know what you are doing, please do not manually insert new objects into this table!!**

<a name="core"/>

#### `unrequited.core`

<a name="wait_for_me"/>

- `unrequited.core:wait_for_me()`
  - function that is called to toggle pause/unpause in the game
  - See [here](#pause-tut) for a full walkthrough on how to setup a pause/unpause mechanism for your game
- `unrequited.core.waiting`
  - internal boolean variable storing if the game is paused or not. Toggling is handled by [`unrequited.core:wait_for_me()`](#wait_for_me)
  - See [here](#pause-tut) for a full walkthrough on how to setup a pause/unpause mechanism for your game

<a name="closer-to-me"/>

- `unrequited.core:closer_to_me(your_name, item, non_file)`
  - The main function used to add objects to be automatically handled with `unrequited`, initialized them in the process too.
  - **( *name*, *object=nil*, *non_file=nil* ) -> nil**
  - Usage cases:
    - If the game object (note the [game object specifications](#object_spec)) and its code is written in an independent `.lua` file that is on the same level as `main.lua`, then the function can simply be called as:
    ```lua
        -- fragment.lua exists on the same level as main.lua
        unrequited.core:closer_to_me('fragment')
    ```
    - If the game object is an existing table in your code, then the call to use would the the following:
    ```lua
        -- fragment_table is an existing table
        unrequited.core:closer_to_me('fragment',fragment_table,true)
    ```

- `unrequited.core:update(dt)`
  - The function that needs to be called to **update** all of the game objects that `unrequited` is handling. `unrequited` will not work if this function is not called in the corresponding `love.update(dt)` in `main.lua`.

- `unrequited.core:draw()`
  - The function that needs to be called to **draw** all of the game objects that `unrequited` is handling. `unrequited` will not work if this function is not called in the corresponding `love.draw()` in `main.lua`.

- `unrequited.core.grounds`
  - An internal array that stores the order at which the objects are being drawn on the screen. It is automatically constructed with calls to [`unrequited.core:closer_to_me`](#closer-to-me), in the order the function is being called.
  - However, the ordering can be manually set after all the calls to [`unrequited.core:closer_to_me`](#closer-to-me). See the section on [managing draw order](#draw-order) for more details.


<a name="events"/>

#### `unrequited.events`

<a name="heartbreak"/>

- `unrequited.events:heartbreak(stat)`
  - Call this function to exit the game. Equivalent to [`love.event.quit()`](https://love2d.org/wiki/love.event.quit)
  - `stat` can either be an exit code, or the string `"restart"` to restart the game.
- `unrequited.events:let_go(stat)`
  - An alias of [`unrequited.events:heartbreak`](#heartbreak)
- `unrequited.events:mousepressed(x, y, button, istouch, presses)`
  - `unrequited` equivalent of the corresponding love function [`love.mousepressed(x, y, button, istouch, presses)`](https://love2d.org/wiki/love.mousepressed)
  - See [Automated Object Handling](#objhandling) for more information
- `unrequited.events:mousereleased(x, y, button, istouch, presses)`
  - `unrequited` equivalent of the corresponding love function [`love.mousereleased(x, y, button, istouch, presses)`](https://love2d.org/wiki/love.mousereleased)
  - See [Automated Object Handling](#objhandling) for more information
- `unrequited.events:wheelmoved(x,y)`
  - `unrequited` equivalent of the corresponding love function [`love.wheelmoved(x,y)`](https://love2d.org/wiki/love.wheelmoved)
  - See [Automated Object Handling](#objhandling) for more information
- `unrequited.events:keypressed(key, scancode, isrepeat)`
  - `unrequited` equivalent of the corresponding love function [`love.keypressed(key, scancode, isrepeat)`](https://love2d.org/wiki/love.keypressed)
  - See [Automated Object Handling](#objhandling) for more information
- `unrequited.events:keyreleased(key, scancode)`
  - `unrequited` equivalent of the corresponding love function [`love.keyreleased(key, scancode)`](https://love2d.org/wiki/love.keyreleased)
  - See [Automated Object Handling](#objhandling) for more information

<a name="imagery"/>

#### `unrequited.imagery`

- `unrequited.imagery:graphicsreset()`
  - resets the color and resets the draw centre to origin

<a name="entities"/>

#### `unrequited.entities`

<a name="ent_load"/>

- `unrequited.entities:generic_entity_load(x, y, spritepath)`
  - **( x, y, spritepath ) -> Object**
  - Generates an object with the specified coordinates and sprite. Objects generated with this method contain the following built-in methods:
    - `ent:recentre(x_offset_perc, x_offset_perc)`
      - **( x_offset_perc, x_offset_perc ) -> nil**
      - Sets offset for the object w.r.t its `(x,y)` coordinates
      - `(x_offset_perc, x_offset_perc)` are expressed as percentages
      - See [Object Specifications](object_spec) for more details
    - `ent:show_align_cross()`
      - function that shows a cross on the centre of the object to help with debugging
      - set `ent.debug_align = true` to toggle on the function 
    - `ent:__draw()`
      - internal drawing function that manually handles the offset and rotational style of the object.
      - See [Object Specifications](object_spec) for more details
  - See [Object Specifications](object_spec) for more details

- `unrequited.entities:shape_of_you(x, y, spritepath)`
  - alias of [`unrequited.entities:generic_entity_load`](#ent_load)

<a name="anim_load"/>

- `unrequited.entities:generic_animation_load(x, y, spritepath, frames, framex, framey, fps)`
  - **( x, y, spritepath, frames, framex, framey, fps ) -> Object**
  - Generates an object with the specified coordinates, spritesheet, framesize, and framerate. Objects generated with this method contain built-in functions that are inherited from [`unrequited.entities:generic_entity_load`](#ent_load) and additionally the following:
    - `ent:__draw()`
      - internal drawing function that manually handles the offset, rotational style, and animation of the object.
    - `ent:__update()`
      - internal update function that handles the animation aspect of the object
  - Once again, please see [Object Specifications](object_spec) for more details
- `unrequited.entities:see_you_move(x, y, spritepath, frames, framex, framey, fps)`
  - alias of [`unrequited.entities:generic_animation_load`](#anim_load)
- `unrequited.entities:pull_my_strings(obj,field,res)`
  - **( str, str, result ) -> nil**
  - adds `field` as a field to `obj`, and assign `res` to `obj.field`
  - if `obj` does not exist in `unrequited.half_my_world` already, then it will be added
  - if `obj` does not exist, it will be created as an empty table as well as added to `unrequited.half_my_world`
  - sample usage:
  ```lua
        -- note that `sound` does not exist as a table before
        unrequited:pull_my_strings("sound","stream",unrequited:setup_bgm("a440.mp3"))
        unrequited.hmw["sound"].stream:play()
  ```
<a name="display"/>

#### `unrequited.display`

- `unrequited.display:windowsetup(wx, wy, title, gx, gy)`
  - **(window_x, window_y, window_title, world_x=nil, world_y=nil) -> nil**
  - sets the dimensions and title of the game window
  - `gx, gy` are optional parameters that sets the size of the game world to fit into the game window.
  - See [Virtual Resolutions](#virtres) for more details
- `unrequited.display:rescale(gx,gy)`
  - **(gx, gy) -> nil**
  - See [Virtual Resolutions](#virtres) for more details
<a name="audio"/>

#### `unrequited.audio`

- `unrequited.audio:setup_bgm(audiopath, mode)`
  - **(path, mode=stream ) -> Source**
  - Returns a [Source](https://love2d.org/wiki/Source) object that is automatically looping when playing.
  - The audio mode is `stream` by default. See [the official wiki](https://love2d.org/wiki/SourceType) for more information.
- `unrequited.audio:setup_sfx(audiopath, mode)`
  - **(path, mode=static ) -> Source**
  - Returns a [Source](https://love2d.org/wiki/Source) object
  - The audio mode is `static` by default. See [the official wiki](https://love2d.org/wiki/SourceType) for more information.
<a name="misc"/>

#### `unrequited.misc`

- `unrequited.misc:remember_me()`
  - Takes a screenshot and places the screenshot in the game's local directory. The directory differs with platforms, but on linux it is in `~/.local/share/love/$(project)/`. For more information, consult with [the official wiki](https://love2d.org/wiki/love.filesystem).
- `unrequited.misc:miss_me(x, y, game_width, game_height)`
  - **( x, y, game_width, game_height ) -> Bool**
  - static function to calculate if a given `(x,y)` is in the window of dimension `game_width x game_height`. Returns `true` if `(x,y)` is **NOT** in the window.

<a name="Integration"/>

## Integration