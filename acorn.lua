-- title:   forest food finder
-- author:  marijn willemse, marijnio
-- desc:    player controls a small forest animal that needs to collect its appropriate food items
-- license: MIT License
-- version: 0.1
-- script:  lua

squirrel = { x = 30, y = 30, speed = 1 }
acorn = { x = math.random(0, 240), y = math.random(0, 136)}
timer = 30 * 60 -- 30 seconds in 60fps
score = 0
t = 0

function draw()
	cls(13)

	-- draw squirrel
	circ(squirrel.x, squirrel.y, 5, 12)

	-- draw acorn
	circ(acorn.x, acorn.y, 3, 6)

	print("Time: " .. math.floor(timer / 60), 5, 5, 2)
	print("Score: " .. score, 5, 15, 2)
	
end

function collide()
    local dx = acorn.x - squirrel.x
    local dy = acorn.y - squirrel.y
    if math.sqrt(dx * dx + dy * dy) < 8 then return true end
	return false
end

function TIC()
	if btn(0) then squirrel.y=squirrel.y-1 end
	if btn(1) then squirrel.y=squirrel.y+1 end
	if btn(2) then squirrel.x=squirrel.x-1 end
	if btn(3) then squirrel.x=squirrel.x+1 end
	
	if collide() then
        -- Collect acorn and increase score
		score = score + 1

        -- Move acorn to new random location
        acorn.x = math.random(0, 240)
        acorn.y = math.random(0, 136)	end

	draw()

	-- update timer
	timer = timer -1
    if timer <= 0 then
        -- Game over
        print("Game Over", 110, 68, 15)
    end

	t=t+1
end


-- <TILES>
-- 001:eccccccccc888888caaaaaaaca888888cacccccccacc0ccccacc0ccccacc0ccc
-- 002:ccccceee8888cceeaaaa0cee888a0ceeccca0ccc0cca0c0c0cca0c0c0cca0c0c
-- 003:eccccccccc888888caaaaaaaca888888cacccccccacccccccacc0ccccacc0ccc
-- 004:ccccceee8888cceeaaaa0cee888a0ceeccca0cccccca0c0c0cca0c0c0cca0c0c
-- 017:cacccccccaaaaaaacaaacaaacaaaaccccaaaaaaac8888888cc000cccecccccec
-- 018:ccca00ccaaaa0ccecaaa0ceeaaaa0ceeaaaa0cee8888ccee000cceeecccceeee
-- 019:cacccccccaaaaaaacaaacaaacaaaaccccaaaaaaac8888888cc000cccecccccec
-- 020:ccca00ccaaaa0ccecaaa0ceeaaaa0ceeaaaa0cee8888ccee000cceeecccceeee
-- </TILES>

-- <WAVES>
-- 000:00000000ffffffff00000000ffffffff
-- 001:0123456789abcdeffedcba9876543210
-- 002:0123456789abcdef0123456789abcdef
-- </WAVES>

-- <SFX>
-- 000:000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000304000000000
-- </SFX>

-- <TRACKS>
-- 000:100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- </TRACKS>

-- <PALETTE>
-- 000:1a1c2c5d275db13e53ef7d57ffcd75a7f07038b76425717929366f3b5dc941a6f673eff7f4f4f494b0c2566c86333c57
-- </PALETTE>

