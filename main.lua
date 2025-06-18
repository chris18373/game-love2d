function love.load()
    camera = require 'libraries/camera'
    cam = camera()
sti = require 'libraries/sti'
gameMap = sti('maps/test..lua')

love.graphics.setDefaultFilter("nearest", "nearest")

bg = love.graphics.newImage('assets/Background.png')
player = {}
player.x =400
player.y =300
player.speed = 5


end

function love.update()
if love.keyboard.isDown("right") then
    player.x = player.x + player.speed
end

if love.keyboard.isDown("left") then
    player.x = player.x - player.speed
end

if love.keyboard.isDown("up") then
    player.y = player.y - player.speed
end

if love.keyboard.isDown("down") then
    player.y = player.y + player.speed
end
cam:lookAt(player.x, player.y)

local w = love.graphics.getWidth()
local h = love.graphics.getHeight()

if cam.x < w/2  then
    cam.x = w/2
end
if cam.x < h/2  then
    cam.x = h/2
end

local mapw = gameMap.width * gameMap.tilewidth
local maph = gameMap.height * gameMap.tileheight

if cam.x > (mapw - w/2)  then
    cam.x =(mapw - w/2)
end
if cam.y > (maph - h/2)  then
    cam.y = (maph - h/2)
end

end

function love.draw()
cam:attach()
love.graphics.newText(love.graphics.newFont(20), "Use the arrow keys to move the player.")
gameMap:drawLayer(gameMap.layers["Tile Layer 1"])
gameMap:drawLayer(gameMap.layers["trees"])
gameMap:drawLayer(gameMap.layers["pasto"])
love.graphics.circle("fill",player.x,player.y,30,nil,30,15,15)
cam:detach()
end