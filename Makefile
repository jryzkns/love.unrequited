# jryzkns 2019

project = love.unrequited

default:
	@love ../$(project)

new:
	@cat sample.unrequited > fragment.lua

clean:
	@rm -rf ~/.local/share/love/$(project)/

show:
	ls ~/.local/share/love/$(project)/