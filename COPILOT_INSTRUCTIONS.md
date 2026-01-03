# Copilot Project Instructions for scoundrel-2026

## Object Initialization Rule

When adding initialization code for new objects (such as entities, state tables, etc.) in the `_init()` function of `game.p8`, always insert these lines immediately after the following includes:

```lua
#include config.lua
#include shared.lua
```

This ensures all dependencies (such as utility functions and state constructors) are loaded before any object is initialized.

## Additional Rules
- Always draw objects after calling `cls()` in the `_draw()` function.
- When creating new entity types, follow the pattern used for `card`, `wall`, and `gem`: define anim and move states in separate files, and initialize the entity in `_init()`.
- When adding new state definitions to a file, always append them to the end of the file.

(Add more rules here as the project evolves.)
