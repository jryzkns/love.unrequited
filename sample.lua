local unrequited = require('unrequited')

local ____this = {}

function ____this:init() end
function ____this:update(n_frames, dt) end
function ____this:draw() end

function ____this:mousepressed(x,y,button,istouch,presses) end
function ____this:mousereleased(x,y,button,istouch,presses) end
function ____this:keypressed(key,scancode,isrepeat) end
function ____this:keyreleased(key,scancode) end

return ____this