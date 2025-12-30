pico-8 cartridge // http://www.pico-8.com
version 36
__lua__

function _init()
  #include shared.lua
  #include init_card.lua
  #include init_card_anim_states.lua
  #include init_card_move_states.lua
  #include init_row.lua
  #include init_dealer.lua
  
  row = init_row()
  local card_anim_states = init_card_anim_states()
  local card_move_states = init_card_move_states()

  #include init_deck.lua
  deck = init_deck()
  all_cards = {}
  for card in all(deck) do
    add(all_cards, card)
  end

  dealer = init_dealer()
end

function _update()
  for card in all(all_cards) do
    card:update()
  end

  if btnp(1) then
    local row_cards = row:cards()
    if #row_cards > 0 then
      local last_card = row_cards[#row_cards]
      last_card:set_move_state('consume')
    end
  end
  
  dealer:update()

  if btnp(2) then
    dealer:deal()
  elseif btnp(3) then
    if #row.slots > 0 then
      local slot = row.slots[1]
      local card = slot.card
      del(all_cards, card)
      slot.card = nil
      local slot = row.slots[3]
      local card = slot.card
      del(all_cards, card)
      slot.card = nil
      local slot = row.slots[4]
      local card = slot.card
      del(all_cards, card)
      slot.card = nil

      dealer:deal()
    end
  end
end

function _draw()
  cls()
  for card in all(all_cards) do
    card:draw()
  end
  rectfill(40, 10, x2(40, 6) , y2(10, 6), 3)
end
