local k = require "katsudo"

function love.load()
	gr = love.graphics
	gr.setBackgroundColor(213, 65, 0)

	tc = k.new("tc.png", 30, 55, 18, 0.08)
	tc2 = k.new("tc.png", 30, 55, 18, 0.08, "rough")
	tc3 = k.new("tc.png", 30, 55, 18, 0.08).rewind()
	tc4 = k.new("tc.png", 30, 55, 18, 0.08).once()
end

function love.update(dt)
	k.update(dt)
end

function love.draw()
	tc.draw(50, 50, 0, 5, 5)
	tc2.draw(200, 50, 0, 5, 5)
	tc3.draw(350, 50, 0, 5, 5)
	tc4.draw(500, 50, 0, 5, 5)
end