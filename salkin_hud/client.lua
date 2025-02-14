local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = nil
local hudaktiv = true

local hunger = 0
local thirst = 0

Citizen.CreateThread(function()
	while ESX == nil do
		ESX = exports["es_extended"]:getSharedObject()
		Citizen.Wait(0)
	end
  while ESX.GetPlayerData().job == nil do
    Citizen.Wait(100)
  end
	
	-- Updates the UI on start
	NetworkSetTalkerProximity(10.0)
end)

Citizen.CreateThread(function()
  while true do 
    local ped = PlayerPedId()
    Wait(100)
    if IsPedSittingInAnyVehicle(ped) and not IsPlayerDead(ped) then
      SendNUIMessage({
        actionns = "right";
      })
    elseif not IsPedSittingInAnyVehicle(ped) then
      SendNUIMessage({
        actionns = "left";
      })
    end
    if IsPauseMenuActive() then
      SendNUIMessage({
        actions = "hide";
      })
    elseif not IsPauseMenuActive() then
      SendNUIMessage({
        actions = "show";
      })
    end
  end
end)

---PLZ

  RegisterNetEvent("nearest_postal_hud")
  AddEventHandler("nearest_postal_hud", function(plz_text_2)
    SendNUIMessage({action = "setValue", key = "playerid", value = "ID "..GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1))).." | PLZ "..plz_text_2})
    Citizen.Wait(10)
  end)
---HUD


  RegisterNetEvent('salkin_hud:updateStatus')
  AddEventHandler('salkin_hud:updateStatus', function(Status)
      status = Status
      SendNUIMessage({
          action = "updateStatus",
          st = Status,
      })
  end)

  Citizen.CreateThread(
      function()
          while true do
              Citizen.Wait(1000)

              GetStatus(
                  function(result)
                    TriggerEvent('salkin_hud:updateStatus', result) 
                  end
              )
          end
      end
  )
  function GetStatus(cb)

    TriggerEvent(
                  "esx_status:getStatus",
                  "hunger",
                  function(h)
                      TriggerEvent(
                          "esx_status:getStatus",
                          "thirst",
                          function(t)
                              local hunger = h.getPercent()
                              local thirst = t.getPercent()
                
                              cb({hunger, thirst,})
                          end
                      )
                  end
              )

  end


  Citizen.CreateThread(function ()
      while true do
          Citizen.Wait(100)
          local ped = PlayerPedId()
          local player = GetPlayerPed(-1)
          SendNUIMessage({
              armor = GetPedArmour(ped),
              life = (100*GetEntityHealth(ped)/GetEntityMaxHealth(ped)),
          })
      end
  end)


---JOB
  RegisterNetEvent('esx:setJob')
  AddEventHandler('esx:setJob', function(job)
    SendNUIMessage({action = "setValue", key = "job", value = job.label.." - "..job.grade_label, icon = job.name})
  end)



---MONEY
  AddEventHandler("onResourceStart", function(resource)
    if GetCurrentResourceName() ~= resource then
        return
    end
    Citizen.Wait(1000)
    Start()
  end)

  RegisterNetEvent("playerSpawned", function(xPlayer)
    Citizen.Wait(1000)
    Start()
  end)

  function Start(xPlayer)
    if not xPlayer then
        xPlayer = ESX.GetPlayerData()
    end
    UpdateAccounts(xPlayer.accounts)
  end


  Citizen.CreateThread(function()
    while true do
      Citizen.Wait(100)
      xPlayer = ESX.GetPlayerData()
      local ped = PlayerPedId()
      if DoesEntityExist(ped) then
        if xPlayer and xPlayer.job then
          SendNUIMessage({action = "setValue", key = "job", value = xPlayer.job.label.." - "..xPlayer.job.grade_label, icon = xPlayer.job.name})
        else
          Citizen.Wait(5000)
        end
      end
    end
  end)


  function UpdateAccounts(accounts)
    if accounts == nil then
        return
    end
    for _, data in pairs(accounts) do
        if data.name == "money" then
            cash = data.money
            money = cash
            SendNUIMessage({action = "setValue", key = "money", value = "$"..money})
        end
    end
  end

  RegisterNetEvent("esx:setAccountMoney", function(account)
    if account.name == "money" then
      SendNUIMessage({action = "setValue", key = "money", value = "$"..account.money})
    end
  end)

--streethud
  Citizen.CreateThread( function()
    local lastStreetA = 0
    local lastStreetB = 0
    while true do
      Citizen.Wait(1000)
      local playerPos = GetEntityCoords(PlayerPedId(), true)
      local streetA, streetB = GetStreetNameAtCoord(playerPos.x, playerPos.y, playerPos.z)
      street = {}
      if not ((streetA == lastStreetA or streetA == lastStreetB) and (streetB == lastStreetA or streetB == lastStreetB)) then
        lastStreetA = streetA
        lastStreetB = streetB
      end
      if lastStreetA ~= 0 then
        table.insert(street, GetStreetNameFromHashKey(lastStreetA))
      end
      if lastStreetB ~= 0 then
        table.insert(street, GetStreetNameFromHashKey(lastStreetB))
      end
      if street ~= laststreet then
        if IsPedInAnyVehicle(PlayerPedId()) then
          lSb = "-- " ..GetStreetNameFromHashKey(lastStreetB)
          lSa = "-- " ..GetStreetNameFromHashKey(lastStreetA)
          SendNUIMessage({action = "setValue", key = "streets", value = lSa.." <br> " ..lSb})
        else
          lSb = "-- " ..GetStreetNameFromHashKey(lastStreetB)
          lSa = "-- " ..GetStreetNameFromHashKey(lastStreetA)
          SendNUIMessage({action = "setValue", key = "streets", value = lSa.." <br> " ..lSb})
        end
        Citizen.Wait(50)
      end
      laststreet = street
      Citizen.Wait(100)
    end
  end)
