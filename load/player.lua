jucator={}
jucator.x=28
jucator.y=25
jucator.vx=0
jucator.vy=0
jucator.inaltime = 50
jucator.latime=56
jucator.sprite = sprites.jucator
world:add(jucator,jucator.x,jucator.y,jucator.latime,jucator.inaltime)

local playerFilter = function(item, other)
  if     other.isBullet   then return 'cross'
  elseif other.isEnemy   then return 'slide'
  elseif other.isExit   then return 'touch'
  elseif other.isSpring then return 'bounce'
  end
  -- else return nil
end

function jucator:move(jucator, dt)
  local goalX, goalY = jucator.x + jucator.vx * dt*150, jucator.y + jucator.vy * dt*150
  local actualX, actualY, cols = world:move(jucator, goalX, goalY, playerFilter)
  jucator.x, jucator.y = actualX, actualY
  world:update(jucator, jucator.x, jucator.y)
end


function jucator:update(dt)
  jucator.vx=0
  jucator.vy=0

  jucator.miscare=false
  if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
    jucator.vy=-1
    jucator.miscare=true
  end

  if love.keyboard.isDown("down") or love.keyboard.isDown("s") then

    jucator.vy=1
    jucator.miscare=true
  end

  if love.keyboard.isDown("left") or love.keyboard.isDown("a") then

    jucator.vx=-1
    jucator.miscare=true

  end
  if love.keyboard.isDown("right") or love.keyboard.isDown("d") then

    jucator.vx=1
    jucator.miscare=true

  end
  jucator:move(jucator,dt)

end

