function init_card_move_states()
  local card_move_states = {}

  local card_idle_frames = {
    function (target)
      return
    end
  }
  card_move_states['idle'] = create_state(card_idle_frames, 10, true)

  local card_deal_frames = {
    function (target)
      
      local slot = nil
      for s in all(row.slots) do
        if s.card == target then
          slot = s
          break
        end
      end

      local move_unit = 6
      if target.y < slot.y then
        local diff = slot.y - target.y
        if diff < move_unit then
          target.y = slot.y
        else
          target.y = target.y + move_unit
        end
      else
        local diff = slot.x - target.x
        if diff < move_unit then
          target.x = slot.x
          target:set_move_state('idle')
        else
          target.x = target.x + move_unit
        end
      end
    end
  }
  card_move_states['deal'] = create_state(card_deal_frames, 1, true)


  local card_consume_frames = {
    function(target)
      local slot = row:card_slot(target)
      target.y = slot.y - 2
    end,
    function(target)
      local slot = row:card_slot(target)
      target.y = slot.y - 4
    end,
    function(target)
      local slot = row:card_slot(target)
      target.y = slot.y - 3
    end,
    function(target)
      local slot = row:card_slot(target)
      target.y = slot.y + 8
    end,
    function(target)
      local slot = row:card_slot(target)
      target.y = slot.y + 16
    end,
    function(target)
      local slot = row:card_slot(target)
      target.y = slot.y + 32
    end,
    function(target)
      local slot = row:card_slot(target)
      target.y = slot.y + 64
    end,
    function(target)
      local slot = row:card_slot(target)
      target.y = slot.y + 128
    end,
  }
  card_move_states['consume'] = create_state(card_consume_frames, 2, false, 'delete')

  local card_attack_frames = {
    function(target)
      local slot = row:card_slot(target)
      target.y = slot.y - 2
    end,
    function(target)
      local slot = row:card_slot(target)
      target.y = slot.y - 4
    end,
    function(target)
      local slot = row:card_slot(target)
      target.y = slot.y - 3
    end,
    function(target)
      local slot = row:card_slot(target)
      target.y = slot.y + 20
      wall:set_anim_state('hurt')
    end,
    function(target)
      local slot = row:card_slot(target)
      target.y = slot.y + 22
      wall:set_move_state('hurt')
    end,
    function(target)
      local slot = row:card_slot(target)
      target.y = slot.y + 3
    end,
    function(target)
      local slot = row:card_slot(target)
      target.y = slot.y
      -- TODO: change state of player (health and or weapon)
    end,
  }

  card_move_states['attack'] = create_state(
    card_attack_frames,
    2,           
    false,       
    'die'       
  )

  local card_die_frames = {
    function(target)
      target.y = -1000
    end,
    function(target)
      local slot = row:card_slot(target)
      target.y = slot.y
    end,
    function(target)
      target.y = -1000
    end,
    function(target)
      local slot = row:card_slot(target)
      target.y = slot.y
    end,
    function(target)
      target.y = -1000
    end,
    function(target)
      local slot = row:card_slot(target)
      target.y = slot.y
    end
  }

  card_move_states['die'] = create_state(
    card_die_frames,
    3,           
    false,       
    'delete'  
  )

  local card_delete_frames = {
    function(target)
      target:delete_me()
    end,
  }

  card_move_states['delete'] = create_state(
    card_delete_frames,
    3,           
    true
  )

  return card_move_states 
end
