Citizen.CreateThread(function()
  while true do 


    Wait(wait)
      local ped = GetPlayerPed(-1)
      local vehicle = GetVehiclePedIsIn(ped)
      local IsPedInAnyVehicle2 = IsPedInAnyVehicle(ped)
      local fuelLevel  = 0
      local speedLevel = 0
      
      if IsPauseMenuActive() and not pause then
        pause = true
        SendNUIMessage({
            action = "hide";
        })
      elseif not IsPauseMenuActive() and pause and IsPedInAnyVehicle(ped, false) then
          pause = false
          SendNUIMessage({
              action = "show";
          })
      end
    

      if (IsPedInAnyVehicle2) and not IsPauseMenuActive()then
        wait = 100
        local gearlevel = GetVehicleCurrentGear(GetVehiclePedIsIn(PlayerPedId(), false))

          fuelLevel = math.floor(GetVehicleFuelLevel(vehicle))
          speedLevel = math.ceil(GetEntitySpeed(vehicle) * 3.6)
          SendNUIMessage({
          action = 'show';
          isInVehicle = IsPedInAnyVehicle2;
          speed = speedLevel;
          fuelLevel = fuelLevel;
          gearlevel = gearlevel;
          degree = degree;
  
        })
      else
        SendNUIMessage({
            action = "hide";
        })
        fuelLevel = 0
          speedLevel = 0
          gearlevel = 0
      end
end

end)