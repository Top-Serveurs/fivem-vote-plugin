# Votes plugin for GTA V FIVEM

- [:us: English documentation](./README.md)
- [:fr: Documentation française](./README_FR.md)

This is the Top-Games (also Top-Serveurs) votes plugin (https://top-games.net/gta) which is used to receive votes directly on your FIVEM server. When a player votes, Top-Games directly notifies your server and you can thus reward your players or make a ranking of the best voters (by example), the possibilities are endless.

But what is FiveM for? [FiveM](https://top-games.net/gta/type/fivem) allows you to create a GTA server, you can find in particular a [GTA 5 RP](https://top-games.net/gta/type/roleplay) on our site.

**Important:** This version of the plugin is in resource form according to the latest versions of FiveM, and therefore uses an fxmanifest. If you are having configuration problems it is most likely that you are using an older version of FiveM. So **if you are using an old version of Fivem, we advise you to download the old version of our plugin** (0.1.X): https://github.com/Top-Serveurs/fivem-vote-plugin/releases/tag/0.1.4.3.

## Features

- Event `onPlayerVote` allowing the reception of the votes cast on your server file in real time! This therefore allows actions to be taken accordingly. Example: rewarding voters.

## Installation

1. Copy the `vote` directory to the `resources` directory of your FIVEM server
2. Configure the voting plugin in the `vote/config.ini` file like this:

```ini
Token="XXXX" # The token is mandatory. It is the token of your server file available on your panel https://top-games.net/gta
Port=8192 # The listening port of the plugin. Default is port 8192 but you can specify which one you want. Do not forget to configure it also on the management panel of your server on https://top-games.net/gta
```
**Remember to open the chosen port (for example 8192) in UDP on your server/firewall**.

3. Edit your `server.cfg` file to activate the plugin. Just add the following line:

```
start vote
```

4. Use the `onPlayerVote` event to receive the votes cast. An example is available in the `example.lua` file and in the `example_esx.lua` file for a small example with ESX (remember to delete the examples). Here is an example:

```lua
AddEventHandler('onPlayerVote', function (playername, ip, date)
    -- Add actions here when a vote is received.
    -- For example: give In-Game money, give points, save in DB, ...
    print(playername)
    print(ip)
    print(date)
end)
```

5. Start your server. If you see the message `[VotePlugin] Voting plugin active on port xxxx`, everything is fine!

6. Last step: activate the voting plugin on the management panel of your server file. Go to https://top-games.net/gta in your server management, at the bottom there is a `Voting plugin` section. You need to activate the plugin and specify the port you indicated above in the `config.ini` file. Once the plugin is activated, you can click on the button to test the connectivity and then it's up to you!


## Help & Suggestions

If you need help setting up the plugin or if you have any suggestions, do not hesitate to contact us here: https://top-games.net/contact or at contact@top-games.net.

## Contributors

Thanks to our contributors who help us improve the plugin:
- [@meyervp](https://github.com/meyervp)
- [@dolutattoo](https://github.com/dolutattoo)
