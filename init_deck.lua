function init_deck()
  local deck = {}
  local suits = {'hearts', 'diamonds', 'clubs', 'spades'}

  
  for suit in all(suits) do
    for i=1, 13 do
      local card = init_card(card_anim_states, card_move_states, i, suit)
      add(deck, card)
    end
  end

  -- shuffle deck
  for i=1, #deck do
    local j = flr(rnd(#deck)) + 1
    deck[i], deck[j] = deck[j], deck[i]
  end
  
  return deck 
end



