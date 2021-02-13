ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
	while true do 
		yuzenoyuncu = PlayerPedId()
		Citizen.Wait(500)
	end
end)

local telefon = true -- EĞER TELEFONUNUZUN BOZULMASINI İSTEMİYORSANIZ 'false' YAPIN.
local karapara = true -- EĞER KARA PARA'LARINIZIN ISLANMASINI/BOZULMASINI İSTEMİYORSANIZ 'false' YAPIN.
local nakitpara = true -- EĞER NAKİT PARA'LARINIZIN ISLANMASINI/BOZULMASINI İSTEMİYORSANIZ 'false' YAPIN.

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1200)
		if IsEntityInWater(yuzenoyuncu) and IsPedSwimming(yuzenoyuncu) then
			if nakitpara == true then 
			TriggerServerEvent('esx_telefonbozulma:nakitpara')
			if telefon == true then
			TriggerServerEvent('esx_telefonbozulma:telefon')
			 if karapara == true then
			TriggerServerEvent('esx_telefonbozulma:karapara')
			 end
			end
		end
	end
end
end)

RegisterNetEvent('oph3z:bar')
AddEventHandler('oph3z:bar', function()
	local oyuncu = PlayerPedId() 
	TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_STAND_MOBILE', 0, false)
	ClearPedTasks(oyuncu)
	exports['aex-bar']:taskBar(7500,"Telefon tamir ediliyor...",false,true) --exports['progressBars']:startUI(7500, "Telefon Tamir Ediliyor...")
	Citizen.Wait(7500)
	ClearPedTasks(oyuncu)
end)

-- Created By Oph3Z