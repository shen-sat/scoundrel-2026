function init_dealer()
  local dealer = {
    card = nil,
    deal = function(self)
      local row_cards = row:cards()
      row:clear_slots()
      
      --loop through row cards backwards
      for i=#row_cards,1,-1 do
        local card = row_cards[i]
        row:assign_card(card)
        card:set_move_state('deal')
      end

      self:deal_card()
    end,
    deal_card = function(self)
      if #deck > 0 then
        local card = deck[1]
        self.card = card
        row:assign_card(card)
        card:set_move_state('deal')
        del(deck, card)
      end
    end,
    update = function(self)
      if self.card and row:any_free_slots() and (#deck > 0) then
        if self.card.y >= row.slots[1].y then
          self:deal_card()
        end
      else
        self.card = nil
      end
    end
  }

  return dealer 
end
