function love.load()

  bump = require "libraries/bump"
  world=bump.newWorld(20)
  require ("load/bullets")
  require ("load/resurse")
  require ("load/enemies")
  require ("load/player")
  jucator.x = 50
  jucator.y = 50
  x2 = love.mouse.getX( )
  y2 = love.mouse.getY( )
  angle = math.atan2(y2-jucator.y,x2-jucator.x)
  for i=1, 10 do
    inamic.spawn()
  end

end

function love.update(dt)
  require("libraries/lovebird").update()
  jucator:update(dt)
  x2 = love.mouse.getX( )
  y2 = love.mouse.getY( )
  angle = math.atan2(y2-jucator.y,x2-jucator.x)
  local dx= math.cos(angle)*speed
  local dy= speed * math.sin(angle)
  if love.mouse.isDown(1) and rate_time<=0 then

    bullets.spawn(jucator.x+math.cos(angle)*40,jucator.y+math.sin(angle)*40,dx,dy,angle)
    rate_time=rate
  end
  rate_time=math.max(0,rate_time-dt)
  bullets.update(dt)
  inamic.update(dt)
end

function love.draw()
  love.graphics.draw(sprites.background)
  love.graphics.draw(jucator.sprite, jucator.x+28, jucator.y+25,angle+1.5,1,1,28.5,25.5)
  local items, len = world:getItems()
  for i=1, len do
    local x,y,w,h = world:getRect(items[i])
    love.graphics.rectangle("line", x, y, w, h)
  end
  bullets.draw()
  inamic.draw()
end
