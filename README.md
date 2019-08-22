# love.unrequited
*Bittersweet wrapper over LÖVE*

## Table of Contents  
+ [Requirements](#Requirements)
+ [Documentation](#Documentation)
+ [Template](#Template)
+ [Licensing](#Licensing)
+ [Bugs, Improvements, suggests, and etc.](#etc)
+ [Plans for the future](#Plans)

## Here stands a monument

#### :musical_note: ["Throw your arms 'round me, give my heart ease..."](https://youtu.be/DCf4pc_sAJY?t=119):musical_note:



I like to think that this is a little more than a simple library for someone to simply `require("unrequited")` into a LÖVE2D project. Aside from some helper functions, `love.unrequited` provides an extra layer on top of the existing LÖVE2D engine.

The project began as a little souvenir from a <!--~~heartbroken~~--> difficult time, but with the seed I had planted it had grown to become so much more than a helper library with some edgy function names. So this sits here as a monument to show that on things may look plain and shallow on the surface, down below could be a whole world of emotions that everyone outside is blind to. A monument that- in the middle of all the cold marble lodges a warm <!--broken--> beating heart.

But enough about me. <!-- How I feel never mattered anyways. --> `love.unrequited` provides game developers the ability to worry less and think differently about the architecture, and more about the game they are creating, the experience they want to deliver.

One of the major ways this takes form is that `love.unrequited` lets game entities be organized in a hierarchical structure. Key *gameloop features*, *event callbacks*, and *peripheral inputs* are automated and controlled by the entities themselves. This allows for modularity and also makes each entity easy to test in isolation with another project environment powered by `love.unrequited`.


<a name="Requirements"/>

## Requirements

- :waning_crescent_moon: Lua 5.2 or higher
  - if you have your distribution of LÖVE already it doesn't matter, just whichever version comes with your LÖVE2D distribution
  - However, if you are planning on [porting your game online](https://github.com/TannerRogalsky/love.js), it is best to write code that is Lua 5.2 compliant. This is because LÖVE2D 10 uses Lua 5.2.
  - For more information, visit [here](https://www.lua.org/versions.html)
- :two_hearts: LÖVE2D 11.1 
  - compatibility with older versions are planned, especially with LÖVE2D 10
  - stay tuned~
- :seedling: Patience
- ~~:broken_heart: a̸̢̢̡̛̫̣͎̩̣̯̘̪͕͆͒͊̂ ̵̢̼̭̐͑͂̌̈͑͐b̴̨̬͍̭̱̥͇̤̘͔͋̆͌͊̃́̽̌̑̇́̔͝ḷ̶̪͓̦̦̓͌̚ȩ̷͕̱͙̳͓̘͉̟̉̂͋͌͌̑̈͘͜é̸̡̛̥̬̏̀̿̓̈́͛͗͛̄̚̚ḋ̶̨̢̛̜̹͇̦͙̤̮͇̤̺͓̬̓͆̿̓̌̓̓͛͛̋͝ī̵̡͙̱̲͍̣͈̙̣̮̻̃̍̉n̸̡̩͈͕̒̊̔̄̉̃́̅̓͋̈́͗̔͝g̷̞̺̾,̶̺̙͈̯̪̪̂̇͛ͅ ̵̧͖̱̮̯̩̮̪̯̜̖̣̩͙̇̿͝ḃ̴̨͑ŗ̸̘̗̤̘͙̹̤̫̀̃͜ͅo̸̧̢̙͙̮̮̼͊͒͆̃͑̏́͘k̶̫̈́͐̆̀͒͋̎̚e̷̢̛͔͇̟͉̓̅̒̓̀̏̋̐͐͊͑̕̚n̷̖̋̊̅͗̀̿͑̔ ̸͈̙̀̇͑̌͋̎̇͝͠͝h̷̢̙̲̫̝̝͉͙̲̞͉͕̥́̅͗̐̑̋̐͆̇͊̚͝ͅë̸̘̰̥́̌a̵̡̗̙͒̂̌r̴̡̰̤̱̳̩͖̗̩̍̃̀̽̉̾̋͠͝ț̶̡̦̤̼͔̞̌̽̎̓̇~~

<a name="Documentation"/>

## Documentation

Visit [here](DOCS.md).

<a name="Template"/>

## Template Usage
Attached to this repository is already a [main](main.lua) and [entity](fragment.lua) to show sample usage. In order to use them, follow these steps:
- `$ git clone git@github.com:jryzkns/love.unrequited.git <project name>`
- Modify the `project` variable in [Makefile](Makefile) to `<project name>`
- `$ make` to run the blank slate project

<a name="Licensing"/>

## Lincensing

`love.unrequited` is distributed under the MIT license. See [LICENSE](LICENSE) for more details. 

In short, you are free to use `love.unrequited` in your own projects, whether it will be commercial or private. As long as the license is attached. This software comes with no warranty.

<a name="etc"/>

## Bugs, Improvements, Suggestions, etc.

Kindly open an issue on this repository and I will have a look at it when I am not too busy soaring in the sky.

It should be obvious by now that this is more a work of art than a serious module for professional production-level use. If you have suggestions I will be happy to hear them, but do not expect external PR's to be approved.

<a name="Plans"/>

## Plans for the future

One big thing I am considering for v2.0.0 is that I will actually take the LÖVE2D engine and integrate the system from `love.unrequited` into it, so the end user will have an easier time working with the modified engine.

#### jryzkns 2019
