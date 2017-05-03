### Katsudö is a small and simple animation library for [LÖVE](https://love2d.org/)

[![License](http://img.shields.io/:license-MIT-blue.svg)](https://github.com/tavuntu/katsudo/blob/master/LICENSE.md)
[![Version](http://img.shields.io/:version-0.0.1-green.svg)](https://github.com/tavuntu/katsudo/blob/master/README.md)

Here's an example:

```lua
local k = require "katsudo"

function love.load()
    gr = love.graphics
    gr.setBackgroundColor(213, 65, 0)
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
```

And the result is something like this:

![Katsudö gif](http://s32.postimg.org/5lokvncjp/image.gif)

Using funtion setDelay() will set a different time on the given frame(s):

```lua
local k = require "katsudo"

function love.load()
    gr = love.graphics
    gr.setBackgroundColor(213, 65, 0)
    imgDir = "imgs/tc.png"
    -- 18 frames of 30x55 at 25 FPS:
    tc  =  k.new(imgDir, 30, 55, 18, 1):setDelay(0.5) -- change to half second for all frames
    tc2  = k.new(imgDir, 30, 55, 18, 1):setDelay(0.5, 2) -- half second just for 2nd frame
    tc3  = k.new(imgDir, 30, 55, 18, 1):setDelay(0.5, 2, true) -- starting with 2nd frame
end

function love.update(dt)
    k.update(dt)
end

function love.draw()
    tc:draw (50,  50, 0, 5, 5)
    tc2:draw(200, 50, 0, 5, 5)
    tc3:draw(350, 50, 0, 5, 5)
end
```
