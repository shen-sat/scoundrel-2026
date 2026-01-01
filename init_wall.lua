function init_wall(anim_states, move_states)
  local wall = init_entity(wall_start_x, wall_start_y, anim_states, 'idle', move_states, 'idle')
  wall.width = 128
  wall.height = 14

  wall.update = function(self)
    self:update_move_state()
  end

  wall.draw = function(self)
    rectfill(self.x, self.y, self.x + self.width - 1, self.y + self.height - 1, 5) -- grey
    -- gaps
    rectfill(self.x + 24, self.y, self.x + 48, self.y + 11, 0)
    rectfill(self.x + 52, self.y, self.x + 76, self.y + 6, 0)
    rectfill(self.x + 80, self.y, self.x + 104, self.y + 6, 0)
    
    self:draw_anim_state()
  end

  return wall
end
