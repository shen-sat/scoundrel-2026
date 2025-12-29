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
      if target.y < 50 then
        target.y = target.y + 5
      else
        target:set_move_state('idle')
      end
    end
  }
  card_move_states['deal'] = create_state(card_deal_frames, 1, true)



  return card_move_states 
end
