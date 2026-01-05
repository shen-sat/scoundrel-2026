function init_card(anim_states, move_states, value, suit)
  local card = init_entity(14, -16, anim_states, 'idle', move_states, 'idle')
  card.value = value
  card.suit = suit
  card.width = 22
  card.height = 32

  card.update = function(card)
    card.update_move_state(card)
  end
  
  card.draw = function(card)
    rectfill(card.x, card.y, x2(card.x, card.width), y2(card.y, card.height), 6)
    print(card.value, card.x + 1, card.y + 1, 1)
    local suit_initial = sub(card.suit, 1, 1)
    print(suit_initial, card.x + 1, card.y + 9, 1)
    card.draw_anim_state(card)
  end

  card.delete_me = function(card)
    local slot = row:card_slot(card)
    remove_card(slot, card)
  end

  return card 
end
