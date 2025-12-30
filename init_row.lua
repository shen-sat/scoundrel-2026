function init_row()
  local row = {
    slots = {
      { x = 14, y = 38, card = nil },
      { x = 40, y = 38, card = nil },
      { x = 66, y = 38, card = nil },
      { x = 92, y = 38, card = nil },
    },
    assign_card = function(self, card)
      local all_slots = self.slots
      local free_slot = nil
      for slot in all(all_slots) do
        if not slot.card then
          free_slot = slot
        end
      end

      if free_slot then free_slot.card = card end
    end,
    any_free_slots = function(self)
      for slot in all(self.slots) do
        if not slot.card then
          return true
        end
      end
      return false
    end,
    card_slot = function(self, card)
      for slot in all(self.slots) do
        if slot.card == card then
          return slot
        end
      end
      return nil
    end,
    cards = function(self)
      local cards = {}
      for slot in all(self.slots) do
        if slot.card then
          add(cards, slot.card)
        end
      end
      return cards
    end,
    clear_slots = function(self)
      for slot in all(self.slots) do
        slot.card = nil
      end
    end
  }

  return row 
end
