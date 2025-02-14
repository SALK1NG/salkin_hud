# Combined HUD Script for FiveM (Player and Vehicle)

This script provides a custom HUD (Heads-Up Display) for both the player and the vehicle in FiveM. It displays various player status indicators such as health, armor, hunger, thirst, job, money, and location, along with vehicle-specific information like speed, fuel level, and current gear. The HUD dynamically updates in real-time and hides or shows based on certain conditions, such as whether the player is in a vehicle or if the pause menu is active.

## Features

### Player HUD
- **Player Health and Armor**: Displays the current health and armor of the player.
- **Hunger and Thirst**: Shows the player's hunger and thirst status, updating as the player consumes food or drink.
- **Job Information**: Displays the player's job and job grade information.
- **Money**: Shows the player's current money balance.
- **Location**: Displays the player's current street name and postal code.
- **Pause Menu Detection**: Hides or shows the player HUD based on whether the pause menu is active.

### Vehicle HUD
- **Speed**: Displays the current speed of the vehicle in km/h.
- **Fuel Level**: Displays the fuel level of the vehicle.
- **Current Gear**: Displays the current gear the vehicle is in.
- **Pause Menu Detection**: Hides the vehicle HUD when the pause menu is active and shows it again when the player is in a vehicle.

## Installation

1. **Download the Script**: Clone or download this repository to your FiveM server.
2. **Add to Resources Folder**: Place the script in the `resources` folder of your FiveM server.
3. **Start the Resource**: Add `start salkin_hud` and `start salkin_carhud` to your `server.cfg` to ensure both HUD scripts load when the server starts.
4. **ESX Dependency**: Ensure you have the `es_extended` resource installed and configured correctly for the player HUD functionality.
5. **NUI Setup**: Make sure you have the required NUI (HTML/CSS/JS) files configured to display both player and vehicle HUDs.

## Configuration

- **Keys**: The script defines a set of keys for various actions (e.g., ESC, F1, F2, etc.) that can be used for custom key bindings within the HUD.
- **HUD Visibility**: The HUD visibility toggles automatically based on whether the player is in a vehicle, the pause menu is active, or other specific conditions.
- **Job Info**: The job and grade information is dynamically fetched from the ESX player data.
- **Vehicle Info**: The vehicle HUD dynamically fetches the current speed, fuel level, and gear of the vehicle the player is in.

## Events and Actions

### Player HUD Events
- **`nearest_postal_hud`**: Sends the player's postal code to the HUD.
- **`salkin_hud:updateStatus`**: Updates hunger and thirst values in the HUD.
- **`esx:setJob`**: Updates the player's job info in the HUD.
- **`playerSpawned`**: Initializes the player HUD when the player spawns in the game.
- **`esx:setAccountMoney`**: Updates the player's money value in the HUD.

### Vehicle HUD Events
- **`action`**: Controls the visibility of the vehicle HUD.
  - **"show"**: Displays the HUD when the player is in a vehicle and not in the pause menu.
  - **"hide"**: Hides the HUD when the player is not in a vehicle or when the pause menu is active.
  
- **`isInVehicle`**: Indicates whether the player is inside a vehicle.
- **`speed`**: Current speed of the vehicle in km/h.
- **`fuelLevel`**: Current fuel level of the vehicle.
- **`gearLevel`**: Current gear of the vehicle.

### Player and Vehicle HUD Actions
- **`actionns`**: Controls the left or right UI elements depending on the player's state (in or out of a vehicle).
- **`actions`**: Shows or hides the HUD based on the pause menu state.
- **`setValue`**: Sets specific data like job, money, and other player stats.
- **`updateStatus`**: Updates player status (hunger, thirst, etc.) in the HUD.
- **`streets`**: Displays the current street names where the player is located.

## Script Workflow

1. **Player HUD**: The player HUD continuously checks the player's health, armor, hunger, thirst, job, and location, and updates these values in real-time.
2. **Vehicle HUD**: The vehicle HUD checks if the player is in a vehicle and updates the vehicle's speed, fuel level, and gear in real-time.
3. **Visibility**: The player HUD and vehicle HUD toggle their visibility based on whether the player is in a vehicle or if the pause menu is active.

## License

This script is provided as-is and can be freely modified for your server. Please credit the original authors if you decide to use or modify the script.

## Contact

If you have any issues or questions, feel free to open an issue in this repository.