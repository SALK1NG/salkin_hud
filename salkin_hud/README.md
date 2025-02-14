# ESX HUD Script

This script provides a custom HUD (Heads-Up Display) for FiveM, displaying various player status indicators such as health, armor, hunger, thirst, job, and location information. The HUD also includes vehicle status and updates in real time, offering a dynamic interface for the player.

## Features

- **Player Health and Armor**: Displays the current health and armor of the player.
- **Hunger and Thirst**: Shows the player's hunger and thirst status, updating as the player consumes food or drink.
- **Job Information**: Displays the player's job and job grade information.
- **Money**: Shows the player's current money balance.
- **Location**: Displays the player's current street name and postal code.
- **Pause Menu Detection**: Hides or shows the HUD based on whether the pause menu is active.

## Installation

1. **Download the Script**: Clone or download this repository to your FiveM server.
2. **Add to Resources Folder**: Place the script in the `resources` folder of your FiveM server.
3. **Start the Resource**: Add `start salkin_hud` to your `server.cfg` to ensure it loads when the server starts.
4. **ESX Dependency**: This script requires the `es_extended` resource, so make sure it is installed and configured correctly.

## Configuration

- **Keys**: The script defines a set of keys for various actions (e.g., ESC, F1, F2, etc.) that can be used for custom key bindings within the HUD.
- **HUD Visibility**: The HUD visibility automatically toggles based on whether the player is in a vehicle, the pause menu is active, or other specific conditions are met.
- **Job Info**: The job and grade information is dynamically fetched from the ESX player data.

## Events

- `nearest_postal_hud`: Sends the player's postal code to the HUD.
- `salkin_hud:updateStatus`: Updates hunger and thirst values in the HUD.
- `esx:setJob`: Updates the player's job info in the HUD.
- `playerSpawned`: Initializes the HUD when the player spawns in the game.
- `esx:setAccountMoney`: Updates the player's money value in the HUD.

## HUD Actions

The following actions are used to update the HUD:

- `actionns`: Controls the left or right UI elements depending on the player's state (in or out of a vehicle).
- `actions`: Shows or hides the HUD based on the pause menu state.
- `setValue`: Sets specific data like job, money, and other player stats.
- `updateStatus`: Updates player status (hunger, thirst, etc.) in the HUD.
- `streets`: Displays the current street names where the player is located.

## License

This script is provided as-is and can be freely modified for your server. Please credit the original author if you decide to use or modify the script. 

## Contact

If you have any issues or questions, feel free to open an issue in this repository. 
