function init_rune_move_states()
	local rune_move_states = {}
	local rune_idle_frames = {
		function(target)
      target.y = wall.y - target.offset_y
		end
	}
  rune_move_states['idle'] = create_state(rune_idle_frames, 2, true)
  
  local rune_absorb_frames = {
    function(target)
      local start_y = wall.y - target.offset_y
      target.y = start_y + 2
		end,
    function(target)
      local start_y = wall.y - target.offset_y
      target.y = start_y - 1
		end,
    function(target)
      local start_y = wall.y - target.offset_y
      target.y = start_y + 1
		end,
	}
	rune_move_states['absorb'] = create_state(rune_absorb_frames, 2, false, 'idle')
	
  return rune_move_states
end
