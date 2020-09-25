-- This is a basic example using ESX.
-- It's only a demo, it's up to you to modify at your convenience.

AddEventHandler('onPlayerVote', function (playername, ip, date)
    print(playername)
    print(ip)
    print(date)
end)