function init_wall_move_states()
  local wall_move_states = {}
  local wall_idle_frames = {
    function(target)
      return
    end
  }
  wall_move_states['idle'] = create_state(wall_idle_frames, 10, true)
  return wall_move_states
end
