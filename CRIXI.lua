local _D = function(s) local r = "" local k = 0xAF for i=1,#s do r = r .. string.char(bit32.bxor(string.byte(s,i),k)) end return r end
local _V = "\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\70\111\111\116\97\103\101\115\117\115\47\87\105\110\100\85\73\47\109\97\105\110\47\100\105\115\116\47\109\97\105\110\46\108\117\97\34\41\41\40\41"

pcall(function()
    local WindUI = loadstring(_V)()
    local Window = WindUI:CreateWindow({
        Title = _D("\3\24\3\30\3\54\25\26\24\21\20\21\3\11\10\54\24\25\10\10\20\11\21\30\24\21\11\20\10"),
        Author = "Zae",
        Folder = "tsb_zae",
        Icon = "shaved-head",
        Theme = "Dark",
        Size = UDim2.fromOffset(600, 480),
        ToggleKey = Enum.KeyCode.J
    })

    local Main = Window:Tab({Title = "Main", Icon = "swords"})
    Main:Button({
        Title = "Kich hoat Script",
        Callback = function()
            WindUI:Notify({Title = "CRIXI", Content = "Script dang chay!"})
        end
    })
end)
