function init_trigger_manager()
  local trigger_manager = {
    update = function(self)
      local card = nil
      for c in all(all_cards) do
        if (c.move_state == c.move_states['delete']) then
          card = c
        end
      end
      if card then
        if not (health_rune.anime_state == 'absorb') then
          health_rune:set_anim_state('absorb')
        end
      end
      
      if health_rune.anim_state == health_rune.anim_states['absorb'] and not (health_rune.move_state == 'absorb') then
        local current_frame_index = ceil(health_rune.anim_state.counter / health_rune.anim_state.frame_duration)
        if current_frame_index == 2 then
          health_rune:set_move_state('absorb')
        end
      end
    end,
  }

  return trigger_manager
end