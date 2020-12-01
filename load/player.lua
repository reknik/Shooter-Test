jucator={}
jucator.x=0
jucator.y=0
jucator.inaltime = 51
jucator.latime=57
jucator.sprite = sprites.jucator
world:add(jucator,jucator.x,jucator.y,jucator.latime,jucator.inaltime)

bullets={}
speed=15
rate=0.2
rate_time=0

function bullets.spawn(x,y,dx,dy,dir)
    table.insert(bullets,{x=x,y=y,dx=dx,dy=dy,dir=dir})
end

function bullets.draw()
  for i,v in ipairs(bullets) do
    love.graphics.draw(sprites.bullet, v.x, v.y, v.dir,1,1,20,10)
  end
end

function bullets.update(dt)
  for i,v in ipairs(bullets) do
    v.x=v.x+v.dx*speed*dt
    v.y=v.y+v.dy*speed*dt
    if(v.x<-10 or v.x>650 or v.y<10 or v.y>650) then
      table.remove(bullets,i)

    end
  end
end
