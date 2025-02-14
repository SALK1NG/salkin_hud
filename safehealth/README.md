# SafeHealth

A lightweight FiveM script for ESX framework that saves player health and armor states without requiring a database.


### Features
- Saves player health and armor automatically when disconnecting
- Restores player health and armor when rejoining
- Uses FiveM's built-in KVP (Key-Value Pairs) storage system
- No database required
- Lightweight and optimized
- Debug mode for easy monitoring

### Installation
1. Download the script
2. Place it in your resources folder
3. Add `ensure safehealth` to your server.cfg
4. Restart your server

### Configuration
In `config/config.lua`:
```lua
Config.Debug = true -- Set to false to disable debug messages
```

### Dependencies
- es_extended (ESX)
