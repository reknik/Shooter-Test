bullets={}
speed=15
rate=0.2
rate_time=0

function bullets.spawn(x,y,dx,dy,dir)
    table.insert(bullets,{x=x,y=y,dx=dx,dy=dy,dir=dir,collider=false,isBullet=true})
    for i,v in ipairs(bullets) do
      if(v.collider==false) then
        world:add(v,v.x+10,v.y+5,20,10)
        v.collider=true
      end
    end
end

local bulletFilter = function(item, other)
  if     other.isEnemy   then return 'touch'
  end
  -- else return nil
end


function bullets.draw()
  for i,v in ipairs(bullets) do
    love.graphics.draw(sprites.bullet, v.x, v.y, v.dir,1,1,20,10)
  end
end

function bullets.detection(bullet,dt,i)
  local goalX, goalY = bullet.x + bullet.dx * dt*speed, bullet.y + bullet.dy * dt*speed
  local actualX, actualY, cols, len = world:move(bullet, goalX, goalY, bulletFilter)
  if len>0 then
    if cols[1].other.isEnemy then
      bullet.x, bullet.y = actualX, actualY
      cols[1].other.viata = cols[1].other.viata-1
      table.remove(bullets,i)
      world:remove(bullet)
    end
  else
    bullet.x, bullet.y = actualX, actualY
    world:update(bullet, bullet.x, bullet.y)
  end
end

function bullets.update(dt)
  for i,v in ipairs(bullets) do
    bullets.detection(v,dt,i)
    if(v.x<-10 or v.x>650 or v.y<10 or v.y>650) then
      table.remove(bullets,i)
      world:remove(v)
    end
  end
end
