# Plugin de votes pour GTA V FIVEM

Ceci est le plugin de votes de Top-Serveurs (https://gta.top-serveurs.net) qui sert à réceptionner les votes directement sur votre serveur FIVEM. Lorsqu'un joueur vote, Top-Serveurs notifie directement votre serveur et vous pouvez ainsi récompenser vos joueurs ou effectuer un clasement des meilleurs voteurs (par exemple), les possibilités sont infinies.

Mais à quoi sert FiveM ? [FiveM](https://gta.top-serveurs.net/type/fivem) vous permet de créer un serveur GTA, vous pouvez trouvez notamment un serveur [GTA 5 RP](https://gta.top-serveurs.net/type/roleplay) sur notre site.

## Fonctionnalités

- Event `onPlayerVote` permettant la réception des votes effectués sur votre fiche serveur en temps réel ! Ceci permet donc d'effectuer des actions en conséquence. Exemple : récompenser les voteurs.

## Installation

1. Copiez le répertoire `vote` dans le dossier `resources` de votre serveur FIVEM
2. Configurez le plugin de vote dans le fichier `vote/config.ini` comme ceci :

```ini
Token="XXXX" # La token est obligatoire. C'est la token de votre fiche serveur disponible sur votre panel https://gta.top-serveurs.net
Port=8192 # Le port d'écoute du plugin. Par défaut, c'est le port 8192 mais vous pouvez spécifier celui que vous voulez. N'oubliez pas de le configurer aussi sur le panel de gestion de votre serveur sur https://gta.top-serveurs.net
```

3. Editez votre fichier `server.cfg` pour activer le plugin. Il suffit de rajouter la ligne suivante :

```
start vote
```

4. Utilisez l'event `onPlayerVote` pour réceptionner les votes effectués. Un exemple est disponible dans le fichier `vote/example.lua` et dans le fichier `example_esx.lua` pour un petit exemple avec ESX (pensez à supprimer les exemples). Voici un exemple :

```lua
AddEventHandler('onPlayerVote', function (playername, ip, date)
    -- Ajouter ici des actions lorsqu'un vote est perçu.
    -- Par exemple : donner de l'argent In-Game, donner des points, enregistrer en BDD, ...
    print(playername)
    print(ip)
    print(date)
end)
```

5. Démarrez votre serveur. Si vous voyez le message `[VotePlugin] Plugin de vote actif sur le port xxxx`, tout est bon !

6. Dernière étape : activez le plugin de vote sur le panel de gestion de votre fiche serveur. Rendez-vous sur https://gta.top-serveurs.net dans la gestion de votre serveur, en bas il y a une section `Plugin de vote`. Vous devez activer le plugin et spécifier le port que vous avez indiqué plus haut dans le fichier `config.ini`. Une fois le plugin activé, vous pouvez cliquer sur le bouton pour tester la connectivité et ensuite à vous de jouer !


## Aide & Suggestions

Si vous avez besoin d'aide sur la mise en place du plugin ou si vous avez des suggestions, n'hésitez pas à nous contacter ici : https://gta.top-serveurs.net/contact ou à gta@top-serveurs.net.
