function init_rune(x, y, anim_states, move_states, value)
	local rune = init_entity(0, 0, anim_states, 'idle', move_states, 'idle')
	rune.value = value
	rune.x = x
  rune.y = y
  rune.width = 21
	rune.height = 13

	rune.update = function(rune)
		rune.update_move_state(rune)
	end
  
	rune.draw = function(rune)
		rune.draw_anim_state(rune)
	end

  rune.draw_self = function(self)
    rectfill(rune.x, rune.y, x2(rune.x, rune.width), y2(rune.y, rune.height), 8)
		print(rune.value, rune.x + 1, rune.y + 1, 1)
  end

	return rune 
end
