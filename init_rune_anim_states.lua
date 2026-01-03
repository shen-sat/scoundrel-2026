function init_rune_anim_states()
	local rune_anim_states = {}
	local rune_idle_frames = {
		function(target)
			return
		end
	}
	rune_anim_states['idle'] = create_state(rune_idle_frames, 10, true)
	return rune_anim_states
end
