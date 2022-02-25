local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local w = lib.new("kokolaXD in beta")
local page1 = w:addPage("Home")

local section1 = page1:addSection("LocalPlayer")

local lplr = game:GetService("Players").LocalPlayer

section1:addSlider("WalkSpeed",math.floor(lplr.Character.Humanoid.WalkSpeed),math.floor(lplr.Character.Humanoid.WalkSpeed),1000,function(val)
    lplr.Character.Humanoid.WalkSpeed = val
end)

section1:addSlider("JumpPower",math.floor(lplr.Character.Humanoid.JumpPower),math.floor(lplr.Character.Humanoid.JumpPower),1000,function(val)
    lplr.Character.Humanoid.JumpPower = val
end)

if not syn_decompile then
    if not KRNL_LOADED then
        w:Notify("kokolaXD Script Support","Since you are not using synapse, I recommend you use krnl. Would you like to copy download link?",function(v)
            if v == true then
                setclipboard("https://krnl.ca")
                w:Notify("KRNL Download!", "The download link has been copied to your clipboard, Paste it in your browser for download.")
            end
        end)
    end
end

w:SelectPage(w.pages[1], true)