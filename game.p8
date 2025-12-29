pico-8 cartridge // http://www.pico-8.com
version 36
__lua__

function _init()
  #include shared.lua
  #include init_card.lua
  #include init_card_anim_states.lua
  #include init_card_move_states.lua
  
  local card_anim_states = init_card_anim_states()
  local card_move_states = init_card_move_states()

  #include init_deck.lua
  deck = init_deck()
end

function _update()
  for card in all(deck) do
    card:update()
  end

  -- if up button pressed, deal first card
  if btnp(2) then
    if #deck > 0 then
      local card = deck[1]
      card:set_move_state('deal')
    end
  end
end

function _draw()
  cls()
  for card in all(deck) do
    card:draw()
  end
end
