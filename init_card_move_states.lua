function init_card_move_states()
  local card_move_states = {}

  local card_idle_frames = {
    function (target)
      return
    end
  }
  card_move_states['idle'] = create_state(card_idle_frames, 10, true)

  local card_deal_frames = {
    function (target)
      
      local slot = nil
      for s in all(row.slots) do
        if s.card == target then
          slot = s
          break
        end
      end

      if target.y < slot.y then
        local diff = slot.y - target.y
        if diff < 4 then
          target.y = slot.y
        else
          target.y = target.y + 4
        end
      else
        local diff = slot.x - target.x
        if diff < 4 then
          target.x = slot.x
          target:set_move_state('idle')
        else
          target.x = target.x + 4
        end
      end
    end
  }
  card_move_states['deal'] = create_state(card_deal_frames, 1, true)



  return card_move_states 
end
