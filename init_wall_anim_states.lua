function init_wall_anim_states()
  local wall_anim_states = {}
  local wall_idle_frames = {
    function(target)
      return
    end
  }
  wall_anim_states['idle'] = create_state(wall_idle_frames, 10, true)
  return wall_anim_states
end
