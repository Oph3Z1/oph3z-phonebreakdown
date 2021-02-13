ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("esx_telefonbozulma:nakitpara")
AddEventHandler("esx_telefonbozulma:nakitpara", function()
	local xPlayer = ESX.GetPlayerFromId(source)

    local nakitpara = xPlayer.getMoney()
     if nakitpara > 0 then
     xPlayer.removeMoney(nakitpara)
	 TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Suya Girdiğin İçin Üzerindeki Bütün Paralar ıslandı. Artık kullanamazsın.',  length = 3000})
    end
end)

RegisterServerEvent("esx_telefonbozulma:karapara")
AddEventHandler("esx_telefonbozulma:karapara", function()
	local xPlayer = ESX.GetPlayerFromId(source)

    local karapara = xPlayer.getAccount('black_money').money
     if karapara > 0 then
     xPlayer.removeAccountMoney('black_money', karapara)
	 TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Suya Girdiğin İçin Üzerindeki Bütün Kara Paralar ıslandı. Artık kullanamazsın.',  length = 3000})
    end
end)

RegisterServerEvent("esx_telefonbozulma:telefon")
AddEventHandler("esx_telefonbozulma:telefon", function()
	local xPlayer = ESX.GetPlayerFromId(source)

    local telefon = xPlayer.getInventoryItem("phone")["count"]
     if telefon > 0 then
     xPlayer.removeInventoryItem("phone", telefon)
     xPlayer.addInventoryItem('kiriktelefon', 1)
	 TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Suya Girdiğin İçin Telefonun Bozuldu.',  length = 3000})
    end
end)

ESX.RegisterUsableItem('telefontamirtornavida', function(source)
	TriggerClientEvent('oph3z:bar', source);
	Citizen.Wait(7500)
	local xPlayer = ESX.GetPlayerFromId(source)
	local telefontamirtornavida = xPlayer.getInventoryItem('telefontamirtornavida').count
	local phoneitem = xPlayer.getInventoryItem('kiriktelefon')
	if phoneitem.count >= 1 then
		if telefontamirtornavida >= 1 then
			xPlayer.removeInventoryItem('telefontamirtornavida', 1)
			Citizen.Wait(1000)
			xPlayer.removeInventoryItem('kiriktelefon', 1)
			Citizen.Wait(1000)
			xPlayer.addInventoryItem('phone', 1)
		end
	end
end)