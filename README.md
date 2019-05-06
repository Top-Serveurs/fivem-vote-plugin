# Plugin de votes pour GTA V FIVEM

Ceci est le plugin de votes de Top-Serveurs (https://gta.top-serveurs.net) qui sert à réceptionner les votes directement sur votre serveur FIVEM. Lorsqu'un joueur vote, Top-Serveurs notifie directement ovtre serveur et pouvez ainsi récomposer vos joueurs ou effectuer un clasement des meilleurs voteurs (par exemple), les possibilités sont infinies.

## Installation

1. Copiez le répertoire `vote` dans le dossier `resources` de votre serveur FIVEM
2. Configurez le plugin de vote dans le fichier `vote/lib/init.lua` comme ceci :

```lua
AddEventHandler('onServerResourceStart', function (resource)
    if resource == "vote" then
        port = 5394 -- Configurez ici le port d'écoute (pensez à vérifier qu'il est disponible)
        serverToken = "XXXXX" -- Ceci est la token de votre fiche serveur disponible sur votre panel Top-Serveurs (htps://gta.top-serveurs.net)
        exports['vote']:vote_configure(port, serverToken)
    end
end)
```

3. Editez votre fichier `server.cfg` pour activer le plugin. Il suffit de rajouter la ligne suivante :

```
start vote
```

4. Utilisez l'event `onPlayerVote` pour réceptionner les votes effectués. Un exemple est disponible dans le fichier `vote/example.lua` (pensez à la supprimer). Voici un exemple :

```lua
AddEventHandler('onPlayerVote', function (playername, ip, date)
    print(playername)
    print(ip)
    print(date)
end)
```

5. Démarrez votre serveur. Si vous voyez le message `[VotePlugin] Plugin de vote actif sur le port xxxx`, tout est bon !