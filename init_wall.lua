function init_wall(anim_states, move_states)
  local wall = init_entity(0, 114, anim_states, 'idle', move_states, 'idle')
  wall.width = 128
  wall.height = 14

  wall.update = function(self)
    self:update_move_state()
  end

  wall.draw = function(self)
    -- Draw main wall
    rectfill(self.x, self.y, self.x + self.width - 1, self.y + self.height - 1, 5) -- grey
    -- Draw gaps (black rects)
    rectfill(24, 114, 48, 125, 0)
    rectfill(52, 114, 76, 120, 0)
    rectfill(80, 114, 104, 120, 0)
    -- Call anim state frame
    self:draw_anim_state()
  end

  return wall
end
