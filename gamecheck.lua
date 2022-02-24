local HttpService = game:GetService("HttpService")
local GameList = "https://raw.githubusercontent.com/eqq-evil/kokolaXD/main/games/gamelist.json"
local GameListJSON = HttpService:JSONDecode(game:HttpGet(GameList))

if game.PlaceId == GameListJSON.game1.PlaceID then
    loadstring(game:HttpGet(GameListJSON.game1.ScriptURL))()
elseif game.PlaceId == GameListJSON.game2.PlaceID then
    loadstring(game:HttpGet(GameListJSON.game2.ScriptURL))()
end