local c = {}

c.alpha = 0.75

function c:update(n_frames, dt)
        c.alpha = 0.75 + 0.25*math.sin(2 + n_frames/5)
end

function c:draw()
        love.graphics.setColor(1,0,1,c.alpha)
        love.graphics.circle('fill',125,125,50)
end

return c