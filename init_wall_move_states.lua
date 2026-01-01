function init_wall_move_states()
  local wall_move_states = {}
  local wall_idle_frames = {
    function(target)
      return
    end
  }
  wall_move_states['idle'] = create_state(wall_idle_frames, 10, true)

  local wall_hurt_frames = {
    function(target)
      wall.y = wall_start_y + 2
    end,
    function(target)
      wall.y = wall_start_y - 2
    end,
    function(target)
      wall.y = wall_start_y + 1
    end,
    function(target)
      wall.y = wall_start_y
    end,
  }
  wall_move_states['hurt'] = create_state(wall_hurt_frames, 2, false, 'idle')


  return wall_move_states
end
