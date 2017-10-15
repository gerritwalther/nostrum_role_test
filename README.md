# NostrumTest

A simple project to show the bug when mentioning a role.

Add the token for the discord channel either to the config.exs or to config.secret.exs.

```
use Mix.Config

config :nostrum,
       token: "replace_with_your_token"
```

The bot requires permission to read and write permissions.

After starting the bot send "!role" in a channel where he has access and he will create 
a test role and afterwards tries to mention this role in a reply. Finally he deletes that role.