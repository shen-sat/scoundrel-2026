function init_trigger_manager()
  local trigger_manager = {
    update = function(self)
      self.trigger_health_rune_absorb_anim_state()
      self.trigger_health_rune_absorb_move_state()
    end,
    trigger_health_rune_absorb_move_state = function()
      if health_rune:is_anim_state('absorb') and not health_rune:is_move_state('absorb') then
        local current_frame_index = ceil(health_rune.anim_state.counter / health_rune.anim_state.frame_duration)
        if current_frame_index == 2 then health_rune:set_move_state('absorb') end
      end
    end,
    trigger_health_rune_absorb_anim_state = function()
      local card = nil
      for c in all(all_cards) do
        if c:is_move_state('delete') then
          card = c
        end
      end
      if card and (card.suit == 'hearts' or card.suit == 'diamonds') then
        if not health_rune:is_anim_state('absorb') then
          health_rune:set_anim_state('absorb')
        end
      end
    end
  }

  return trigger_manager
end