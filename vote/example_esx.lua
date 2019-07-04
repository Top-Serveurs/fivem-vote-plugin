-- Ceci est un exemple basique utilisant ESX.
-- C'est seulement une demo, à vous de modifier à votre convenance.

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local function getPlayerByName(playername)
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer ~= nil and xPlayer.getName() == playername then
            return xPlayer
        end
    end
    return nil
end

AddEventHandler('onPlayerVote', function (playername, ip, date)
    local Player = getPlayerByName(playername)
    if Player then
        Player.addMoney(100)
        
        -- Pour notifier (requiert pNotify) :
		-- TriggerClientEvent("pNotify:SendNotification", -1, {
		-- 			text = ""..playername.. " a voté pour le serveur</br>Il a gagné <b style='color:green'>100$</b>",
		-- 			type = "info",
		-- 			timeout = 15000,
		-- 			layout = "centerRight"
	    -- })
    else
        print("Joueur introuvable !")

        -- Pour notifier (requiert pNotify) :
		-- TriggerClientEvent("pNotify:SendNotification", -1, {
		-- 			text = "Un inconnu a voté pour le serveur !",
		-- 			type = "info",
		-- 			timeout = 15000,
		-- 			layout = "centerRight"
	    -- })
    end
end)
