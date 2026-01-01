pico-8 cartridge // http://www.pico-8.com
version 36
__lua__

function _init()
  #include config.lua
  #include shared.lua

  #include init_row.lua
  row = init_row()

  #include init_card.lua
  #include init_card_anim_states.lua
  #include init_card_move_states.lua
  local card_anim_states = init_card_anim_states()
  local card_move_states = init_card_move_states()

  #include init_deck.lua
  deck = init_deck()
  all_cards = {}
  for card in all(deck) do
    add(all_cards, card)
  end

  #include init_dealer.lua
  dealer = init_dealer()
  
  #include init_wall.lua
  #include init_wall_anim_states.lua
  #include init_wall_move_states.lua
  local wall_anim_states = init_wall_anim_states()
  local wall_move_states = init_wall_move_states()
  wall = init_wall(wall_anim_states, wall_move_states)
end

function _update()
  wall:update()
  -- if left button pressed, set first card in row to 'attack' movement state
  if btnp(0) then
    local row_cards = row:cards()
    if #row_cards > 0 then
      local first_card = row_cards[1]
      first_card:set_move_state('attack')
    end
  end
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
  wall:draw()
  for card in all(all_cards) do
    card:draw()
  end
  rectfill(40, 10, x2(40, 6) , y2(10, 6), 3)
  print(stat(7), 100, 100, 7)
end
