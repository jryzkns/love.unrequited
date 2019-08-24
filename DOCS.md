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

#### game object specifications

<a name="pause-tut"/>

#### toggle pause/unpause

<a name="draw-order"/>

#### managing draw order

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

<!-- function unrequited.events:let_go() 

function unrequited.events:heartbreak()

function unrequited.events:mousepressed(x, y, button, istouch, presses)
        
function unrequited.events:mousereleased(x, y, button, istouch, presses)
                
function unrequited.events:wheelmoved(x,y)
        
function unrequited.events:keypressed(key, scancode, isrepeat)
        
function unrequited.events:keyreleased(key, scancode) -->
                

<a name="imagery"/>

#### `unrequited.imagery`

<!-- function unrequited.imagery:graphicsreset() -->

<a name="entities"/>

#### `unrequited.entities`
<!-- 
function unrequited.entities:pull_my_strings(obj,field,res)

function unrequited.entities:shape_of_you(x, y, spritepath)

function unrequited.entities:generic_entity_load(x, y, spritepath, is_animate)

function unrequited.entities:see_you_move(x, y, spritepath, frames, framex, framey, fps)

function unrequited.entities:generic_animation_load(x, y, spritepath, frames, framex, framey, fps) -->

<a name="display"/>

#### `unrequited.display`

<!-- function unrequited.display:windowsetup(wx, wy, title, gx, gy)

function unrequited.display:rescale(gx,gy) -->

<a name="audio"/>

#### `unrequited.audio`

<!-- function unrequited.audio:setup_bgm(audiopath, mode)

function unrequited.audio:setup_sfx(audiopath, mode) -->

<a name="misc"/>

#### `unrequited.misc`
<!-- 
function unrequited.misc:negate(clause)

function unrequited.misc:remember_me()

function unrequited.misc:miss_me(x, y, game_width, game_height) -->

<a name="Integration"/>

## Integration