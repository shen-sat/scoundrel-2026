function init_card(anim_states, move_states, value)
  local card = init_entity(0, 0, anim_states, 'idle', move_states, 'idle')
  card.value = value

  card.update = function(card)
    card.update_move_state(card)
  end
  
  card.draw = function(card)
    card.draw_anim_state(card)
    print(card.value, 1, 1, 1)
  end

  return card 
end
