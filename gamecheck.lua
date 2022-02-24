local Http = game:GetService("HttpService")
data = Http:JSONDecode(Http:GetAsync("https://raw.githubusercontent.com/eqq-evil/kokolaXD/main/games/gamelist.json"))

print(data("155615604"))