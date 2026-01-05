function execute_state(state, loop, target, set_state_fn)
  local current_frame_index = ceil(state.counter / state.frame_duration)
  state.frames[current_frame_index](target)

  local predicted_frame_index = ceil((state.counter + 1) / state.frame_duration)
  if predicted_frame_index > #state.frames then
    if loop then
      state.counter = 1
    else
      set_state_fn(target, state.next_state_name)
    end
  else
    state.counter = state.counter + 1
  end
end

function set_entity_anim_state(entity, state_name)
  entity.anim_state = entity.anim_states[state_name]
  entity.anim_state.counter = 1
end

function set_entity_move_state(entity, state_name)
  entity.move_state = entity.move_states[state_name]
  entity.move_state.counter = 1
end

function create_state(frames, frame_duration, loop, next_state_name)
  -- Validations
  assert(frames, "frames cannot be nil")
  assert(type(frames) == "table", "frames must be a table")
  assert(#frames > 0, "frames must be a non-empty list")
  assert(frame_duration == nil or (type(frame_duration) == "number" and frame_duration > 0), "frame_duration must be a positive number")
  assert(loop == nil or type(loop) == "boolean", "loop must be a boolean")
  if not loop then assert(next_state_name, "next_state_name must be set if animation is not looping") end

  local state =  {
    counter = 1,
    frame_duration = frame_duration,
    frames = frames,
    loop = loop,
    call = function(self, target, set_state_fn)
      execute_state(self, self.loop, target, set_state_fn)
    end
  }

  if not loop then
    state.next_state_name = next_state_name
  end

  return state
end

function init_entity(x, y, anim_states, initial_anim_state_name, move_states, initial_move_state_name)
  local entity = {
    x = x,
    y = y,
    
    anim_state = anim_states[initial_anim_state_name], -- Set the initial anim state
    move_state = move_states[initial_move_state_name], -- Set the initial move state

    draw_anim_state = function(self)
      self.anim_state:call(self, set_entity_anim_state)
    end,

    update_move_state = function(self)
      self.move_state:call(self, set_entity_move_state)
    end,

    anim_states = anim_states,
    move_states = move_states,

    set_anim_state = function(self, state_name)
      set_entity_anim_state(self, state_name)
    end,
    set_move_state = function(self, state_name)
      set_entity_move_state(self, state_name)
    end,
    is_anim_state = function(self, state_name)
      return self.anim_state == self.anim_states[state_name]
    end,
    is_move_state = function(self, state_name)
      return self.move_state == self.move_states[state_name]
    end
  }

  return entity
end

function x2(x1, width)
  return x1 + width - 1
end

function y2(y1, height)
  return y1 + height - 1
end

function remove_card(slot, card)  
  slot.card = nil
  del(all_cards, card)
end