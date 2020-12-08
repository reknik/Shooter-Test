
inamic = {}


function inamic.spawn()
    table.insert(inamic,{x=love.math.random(40, 600),y=love.math.random(40, 600),viata=3,isEnemy=true,collider=false,unghi=1})
    for i,v in ipairs(inamic) do
      if(v.collider==false) then
        world:add(v,v.x,v.y,55,49)
        v.collider=true
      end
    end
end

function inamic.draw()
  for i,v in ipairs(inamic) do
    love.graphics.draw(sprites.inamic,v.x+27,v.y+24,v.unghi+1.5,1,1,27,24)
  end
end

function inamic.move(ina,dt)
  ina.unghi = math.atan2(jucator.y-ina.y, jucator.x-ina.x)
  local dx= math.cos(ina.unghi)
  local dy=  math.sin(ina.unghi)
  local goalX, goalY = ina.x + dx* dt*50, ina.y + dy * dt*50
  local actualX, actualY = world:move(ina, goalX, goalY)
  ina.x,ina.y=actualX,actualY
end


function inamic.update(dt)
  for i,v in ipairs(inamic) do
    inamic.move(v,dt)
    if v.viata==0 then
      table.remove(inamic,i)
      world:remove(v)
    end
  end
end
