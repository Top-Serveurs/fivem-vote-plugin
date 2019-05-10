-- Ceci est un exemple basique permettant un affiche des détails du vote en console
-- C'est seulement une demo, à vous de modifier à votre convenance.

AddEventHandler('onPlayerVote', function (playername, ip, date)
    print(playername)
    print(ip)
    print(date)
end)