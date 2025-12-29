function init_deck()
  local deck = {}

  for i=1, 52 do
    local card = init_card(card_anim_states, card_move_states, i)
    add(deck, card)
  end

  return deck 
end



