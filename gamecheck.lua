local HttpService = game:GetService("HttpService")

----game list:

local GameList = "https://raw.githubusercontent.com/eqq-evil/kokolaXD/main/games/gamelist.json"
local GameListJSON = HttpService:JSONDecode(game:HttpGet(GameList))

print(GameListJSON)