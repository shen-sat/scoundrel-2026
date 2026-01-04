function init_rune_anim_states()
	local rune_anim_states = {}
	local rune_idle_frames = {
		function(target)
			target:draw_self()
		end
	}
	rune_anim_states['idle'] = create_state(rune_idle_frames, 2, true)

  local rune_absorb_frames = {
		function(target)
      local start_y = wall.y - target.offset_y
      rectfill(target.x - 2, start_y - 2, target.x - 1, start_y - 1, 7)
      rectfill(target.x + target.width, start_y - 2, target.x + target.width + 1, start_y - 1, 7)
      rectfill(target.x - 2, start_y + target.height, target.x - 1, start_y + target.height + 1, 7)
      rectfill(target.x + target.width, start_y + target.height, target.x + target.width + 1, start_y + target.height + 1, 7)
      pal(8, 7)
			target:draw_self()
		end,
    function(target)
      local start_y = wall.y - target.offset_y
      pset(target.x - 3, start_y - 3, 7)
      pset(target.x + target.width + 2, start_y - 3, 7)
      pset(target.x - 3, start_y + target.height + 3, 7)
      pal(8, 7)
			target:draw_self()
		end,
    function(target)
      pal()
			target:draw_self()
		end
	}
	rune_anim_states['absorb'] = create_state(rune_absorb_frames, 2, false, 'idle')

	return rune_anim_states
end
