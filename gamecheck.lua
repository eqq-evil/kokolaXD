local callbacks = {}
local HttpService = game:GetService("HttpService")
local GameList = "https://raw.githubusercontent.com/eqq-evil/kokolaXD/main/games/gamelist.json"
local GameListJSON = HttpService:JSONDecode(game:HttpGet(GameList))

callbacks.Load = function()
    local xdloader = Instance.new("ScreenGui")
    local main = Instance.new("ImageLabel")
    local kokola = Instance.new("TextLabel")
    local XD = Instance.new("TextLabel")

    xdloader.Name = "xdloader"
    xdloader.Parent = game:GetService("CoreGui")

    main.Name = "main"
    main.Parent = xdloader
    main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    main.BackgroundTransparency = 1.000
    main.Position = UDim2.new(0.406811148, 0, 0.427509308, 0)
    main.Size = UDim2.new(0, 300, 0, 116)
    main.Image = "rbxassetid://3570695787"
    main.ImageColor3 = Color3.fromRGB(65, 88, 57)
    main.ScaleType = Enum.ScaleType.Slice
    main.SliceCenter = Rect.new(100, 100, 100, 100)
    main.SliceScale = 0.120

    kokola.Name = "kokola"
    kokola.Parent = main
    kokola.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    kokola.BackgroundTransparency = 1.000
    kokola.Position = UDim2.new(0.0733333379, 0, 0.137931034, 0)
    kokola.Size = UDim2.new(0, 200, 0, 83)
    kokola.Font = Enum.Font.GothamBold
    kokola.Text = "kokola"
    kokola.TextColor3 = Color3.fromRGB(144, 144, 144)
    kokola.TextSize = 39.000

    XD.Name = "XD"
    XD.Parent = kokola
    XD.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    XD.BackgroundTransparency = 1.000
    XD.Position = UDim2.new(0.796666622, 0, 0.00540091097, 0)
    XD.Size = UDim2.new(0, 200, 0, 83)
    XD.Font = Enum.Font.GothamBold
    XD.Text = "XD"
    XD.TextColor3 = Color3.fromRGB(107, 144, 93)
    XD.TextSize = 39.000
    XD.TextXAlignment = Enum.TextXAlignment.Left

    main.Position = UDim2.new(-0.407, 0, -0.428, 0)
    wait(0.1)
    main:TweenPosition(UDim2.new(0.407, 0, 0.428, 0),"Out","Quint",0.7)
    for i = 1,3,1 do
        wait(2)
        game:GetService("TweenService"):Create(kokola, TweenInfo.new(0.25), {TextColor3 = Color3.fromRGB(107, 144, 93)}):Play()
        game:GetService("TweenService"):Create(XD, TweenInfo.new(0.25), {TextColor3 = Color3.fromRGB(144, 144, 144)}):Play()
        wait(2)
        game:GetService("TweenService"):Create(kokola, TweenInfo.new(0.25), {TextColor3 = Color3.fromRGB(144, 144, 144)}):Play()
        game:GetService("TweenService"):Create(XD, TweenInfo.new(0.25), {TextColor3 = Color3.fromRGB(107, 144, 93)}):Play()
    end
    wait(1)
    main:TweenPosition(UDim2.new(-0.407, 0, -0.428, 0),"Out","Quint",0.7)
    wait(1)
    xdloader:Destroy()
    if game.PlaceId == GameListJSON.game1.PlaceID then
        loadstring(game:HttpGet(GameListJSON.game1.ScriptURL))()
    elseif game.PlaceId == GameListJSON.game2.PlaceID then
        loadstring(game:HttpGet(GameListJSON.game2.ScriptURL))()
    end
end

callbacks.Load()