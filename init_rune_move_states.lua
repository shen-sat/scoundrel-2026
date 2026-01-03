function init_rune_move_states()
	local rune_move_states = {}
	local rune_idle_frames = {
		function(target)
      target.y = wall.y - target.offset_y
		end
	}
	rune_move_states['idle'] = create_state(rune_idle_frames, 10, true)
	return rune_move_states
end
