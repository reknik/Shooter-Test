function love.load()

  bump = require "libraries/bump"
  world=bump.newWorld(20)
  require ("load/resurse")
  require ("load/enemies")
  require ("load/player")
  jucator.x = 100
  jucator.y = 100
  x2 = love.mouse.getX( )
  y2 = love.mouse.getY( )
  angle = math.atan2(y2-jucator.y,x2-jucator.x)


end

function love.update(dt)
  jucator.x = 100
  jucator.y = 100

  x2 = love.mouse.getX( )
  y2 = love.mouse.getY( )
  angle = math.atan2(y2-jucator.y,x2-jucator.x)
  if love.mouse.isDown(1) and rate_time<=0 then
    dx= math.cos(angle)*speed
    dy= speed * math.sin(angle)
    bullets.spawn(jucator.x+math.cos(angle)*40,jucator.y+math.sin(angle)*40,dx,dy,angle)
    rate_time=rate
  end
  rate_time=math.max(0,rate_time-dt)
  bullets.update(dt)
end

function love.draw()
  love.graphics.draw(sprites.background)
  love.graphics.draw(jucator.sprite, jucator.x, jucator.y,angle+1.5,1,1,28,25)
  bullets.draw()
  for i=1, 10 do
    love.graphics.draw(inamic[i].sprite, inamic[i].x, inamic[i].y)
  end
  
end
