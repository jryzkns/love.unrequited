# jryzkns 2019

project = love.unrequited

sample_code = "-- his heart broke into so many pieces,\n-- fragments were everywhere...\nlocal unrequited = require('unrequited')\nlocal fragment = {}\nfunction fragment:init() end\nfunction fragment:update(n_frames, dt) end\nfunction fragment:draw() end\nfunction fragment:mousepressed(x,y,button,istouch,presses) end\nfunction fragment:mousereleased(x,y,button,istouch,presses) end\nfunction fragment:keypressed(key,scancode,isrepeat) end\nfunction fragment:keyreleased(key,scancode) end\nfunction fragment:wheelmoved(x,y) end\nreturn fragment"

default:
	@love ../$(project)

new:
	@echo $(sample_code) > fragment.lua
clean:
	@rm -rf ~/.local/share/love/$(project)/

show:
	ls ~/.local/share/love/$(project)/