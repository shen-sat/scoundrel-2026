function init_wall_anim_states()
  local wall_anim_states = {}
  local wall_idle_frames = {
    function(target)
      target:draw_self()
    end
  }
  wall_anim_states['idle'] = create_state(wall_idle_frames, 10, true)
  
  local wall_hurt_frames = {
    function(target)
      pal(5, 8)
      target:draw_self()
    end,
    function(target)
      pal(5, 8)
      target:draw_self()
    end,
    function(target)
      pal()
      target:draw_self()
    end
  }
  wall_anim_states['hurt'] = create_state(wall_hurt_frames, 2, false, 'idle')

  return wall_anim_states
end
