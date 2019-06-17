local b = {}

b.alpha = 0.75

function b:update(n_frames, dt)
        b.alpha = 0.75 + 0.25*math.sin(1 + n_frames/5)
end

function b:draw()
        love.graphics.setColor(0,1,1,b.alpha)
        love.graphics.circle('fill',125,100,50)
end

return b