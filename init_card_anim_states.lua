function init_card_anim_states()
  local card_anim_states = {}

  local card_idle_frames = {
    function (target)
      return
    end
  }
  card_anim_states['idle'] = create_state(card_idle_frames, 10, true)
  
  local card_selected_frames = {
    function (target)
      rectfill(target.x, target.y, target.x+8, target.y+12, 7)
    end,
    function (target)
      rectfill(target.x, target.y, target.x+8, target.y+12, 8)
    end
  }
  card_anim_states['selected'] = create_state(card_selected_frames, 10, true)

  return card_anim_states 
end
