local a = {}
a.alpha = 0.75

function a:update(n_frames, dt)
        a.alpha = 0.75 + 0.25*math.sin(n_frames/5)
end

function a:draw()
        love.graphics.setColor(1,1,0,a.alpha)
        love.graphics.circle('fill',100,100,50)
end

return a