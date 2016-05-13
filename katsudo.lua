katsudo = {}
katsudo.anims = {}

function katsudo.new(img, quadWidth, quadHeight, numberOfQuads, millis, style)
	if not img then
		error("Error in katsudo.new() parameter #1, please provide an image (string or Image)")
	end
	if not (quadWidth or quadHeight) then
		error("Error in katsudo.new(), parameter #2 nor #3, please provide width and height")
	end

	if type(img) == "string" then
		img = love.graphics.newImage(img)
	end

	if style and style == "rough" then
		img:setFilter("nearest", "nearest")
	end

	local newAnim = {}
	local imgW = img:getWidth()
	local imgH = img:getHeight()

	local automaticNumberOfQuads = (imgW / quadWidth) * (imgH / quadHeight)

	newAnim.numberOfQuads = numberOfQuads or automaticNumberOfQuads
	newAnim.quads = {}
	newAnim.millis = millis or 0.1 -- Milliseconds for each frame.
	newAnim.mode = "repeat"

	-- Generate frames (quads):
	local x, y = 0, 0
	for i = 1, newAnim.numberOfQuads do
		table.insert(newAnim.quads, love.graphics.newQuad(
			x, y, quadWidth, quadHeight, imgW, imgH
		))
		x = x + quadWidth
		if x >= imgW then
			y = y + quadHeight
			x = 0
		end
	end

	newAnim.timer = 0
	newAnim.index = 1
	newAnim.sense = 1
	newAnim.finished = false
	function newAnim.update(dt)
		if not newAnim.finished then
			newAnim.timer = newAnim.timer + dt
			if newAnim.timer >= newAnim.millis then
				newAnim.timer = 0
				newAnim.index = newAnim.index + 1 * newAnim.sense

				if newAnim.index > #newAnim.quads or newAnim.index < 1 then
					if newAnim.mode == "repeat" then
						newAnim.index = 1
					elseif newAnim.mode == "rewind" then
						newAnim.sense = newAnim.sense * -1
						if newAnim.sense < 0 then
							newAnim.index = newAnim.index - 1
						end
						if newAnim.sense > 0 then
							newAnim.index = newAnim.index + 1
						end
					elseif newAnim.mode == "once" then
						newAnim.finished = true
						newAnim.index = newAnim.index - 1
					end
				end
			end
		end
	end

	function newAnim.rewind()
		newAnim.mode = "rewind"
		return newAnim
	end

	function newAnim.once()
		newAnim.mode = "once"
		return newAnim
	end

	function newAnim.draw(...)
		local q = newAnim.quads[newAnim.index]
		love.graphics.draw(img, q, ...)
	end

	table.insert(katsudo.anims, newAnim)
	return newAnim
end

function katsudo.update(dt)
	for i = 1, #katsudo.anims do
		katsudo.anims[i].update(dt)
	end
end

return katsudo