ESX = exports['es_extended']:getSharedObject()
local RSE = RegisterServerEvent
local TE = TriggerEvent
local AEH = AddEventHandler 

ESX.RegisterServerCallback('meth:system', function(source,cb,item)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getInventoryItem('methlab').count >= 1 and xPlayer.getInventoryItem('propan').count >= 10 and xPlayer.getInventoryItem('lithium').count >= 10 and xPlayer.getInventoryItem('etanol').count >= 10 then
		xPlayer.removeInventoryItem('propan',10)
        xPlayer.removeInventoryItem('etanol',10)
        xPlayer.removeInventoryItem('lithium',10)
		xPlayer.addInventoryItem('unprocessed_meth',3)
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('processing', function(source,cb,item)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getInventoryItem('unprocessed_meth').count >= 10 and xPlayer.getInventoryItem('pouches').count >= 6 then
        xPlayer.addInventoryItem("pure_meth", 6)
        xPlayer.removeInventoryItem("unprocessed_meth", 10) 
         xPlayer.removeInventoryItem("pouches", 6)
        cb(true)
    else
        cb(false)
    end
end)


ESX.RegisterServerCallback('sell', function(source,cb,item)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getInventoryItem('pure_meth').count >= 10  then
    xPlayer.addInventoryItem("money", 5000)
  xPlayer.removeInventoryItem("pure_meth", 10)  
  xPlayer.ShowNotification("You sell to the dealer")
  cb(true)
  else
    cb(false)
  end 
end)

ESX.RegisterUsableItem("pure_meth", function()
    xPlayer.removeInventoryItem("pure_meth")
  xPlayer.TE("abillity")
end)

RSE('meth:bure')
AEH('meth:bure', function()


    local luck = math.random(1, 3)

    local items = { 
        'lithium',
        'etanol',
        'propan'
    }

    local xPlayer = ESX.GetPlayerFromId(source)
    local randomItems = items[math.random(#items)]
    local quantity = math.random(#items)
    local itemfound = ESX.GetItemLabel(randomItems)

    xPlayer.addInventoryItem(randomItems, quantity)

    xPlayer.ShowNotification("Finished searching")

end)








