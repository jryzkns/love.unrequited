-- his heart broke into so many pieces,
-- fragments were everywhere...
local unrequited = require('unrequited')
local fragment = {}
function fragment:init() end
function fragment:update(n_frames, dt) end
function fragment:draw() end
function fragment:mousepressed(x,y,button,istouch,presses) end
function fragment:mousereleased(x,y,button,istouch,presses) end
function fragment:keypressed(key,scancode,isrepeat) end
function fragment:keyreleased(key,scancode) end
return fragment
