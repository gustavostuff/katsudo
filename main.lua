local k = require "katsudo"

function love.load()
    gr = love.graphics
    gr.setBackgroundColor(1, 1, 1)
    local imgDir = "imgs/tc.png"
    -- 18 frames of 30x55 at 25 FPS:
    tc  = k.new(imgDir, 30, 55, 18, 0.04)
    tc2 = k.new(imgDir, 30, 55, 18, 0.04, "rough")
    tc3 = k.new(imgDir, 30, 55, 18, 0.04):rewind()
    tc4 = k.new(imgDir, 30, 55, 18, 0.04):once()
end

function love.update(dt)
    k.update(dt)
end

function love.draw()
    tc:draw (50,  50, 0, 5, 5)
    tc2:draw(200, 50, 0, 5, 5)
    tc3:draw(350, 50, 0, 5, 5)
    tc4:draw(500, 50, 0, 5, 5)
end

function love.keypressed(k)
  if k == 'escape' then
    love.event.quit()
  end
end
