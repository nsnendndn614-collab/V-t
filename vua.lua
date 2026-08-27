-- 1. TẠO MÀN HÌNH ĐẾM NGƯỜC TROLL
local CoreGui = game:GetService("CoreGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "VuaHubCountdown"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 320, 0, 180)
Frame.Position = UDim2.new(0.5, -160, 0.5, -90)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Frame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(0, 170, 255)
UIStroke.Thickness = 2
UIStroke.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 35)
Title.Position = UDim2.new(0, 0, 0, 10)
Title.BackgroundTransparency = 1
Title.Text = "SCRIPT VUA HUB"
Title.TextColor3 = Color3.fromRGB(0, 170, 255)
Title.TextSize = 20
Title.Font = Enum.Font.SourceSansBold
Title.Parent = Frame

local Text = Instance.new("TextLabel")
Text.Size = UDim2.new(1, 0, 0, 25)
Text.Position = UDim2.new(0, 0, 0, 40)
Text.BackgroundTransparency = 1
Text.Text = "Đang tải Menu, vui lòng chờ..."
Text.TextColor3 = Color3.fromRGB(200, 200, 200)
Text.TextSize = 16
Text.Font = Enum.Font.SourceSans
Text.Parent = Frame

local CountdownText = Instance.new("TextLabel")
CountdownText.Size = UDim2.new(1, 0, 0, 45)
CountdownText.Position = UDim2.new(0, 0, 0, 68)
CountdownText.BackgroundTransparency = 1
CountdownText.Text = "10"
CountdownText.TextColor3 = Color3.fromRGB(255, 85, 85)
CountdownText.TextSize = 36
CountdownText.Font = Enum.Font.SourceSansBold
CountdownText.Parent = Frame

-- CHỮ "CỐ LÊN!" BÊN GÓC XUẤT HIỆN LIÊN TỤC
local CheerText = Instance.new("TextLabel")
CheerText.Size = UDim2.new(1, -20, 0, 30)
CheerText.Position = UDim2.new(0, 10, 0, 135)
CheerText.BackgroundTransparency = 1
CheerText.Text = "🔥 Cố lên! Sắp xong rồi! 🔥"
CheerText.TextColor3 = Color3.fromRGB(255, 215, 0)
CheerText.TextSize = 16
CheerText.Font = Enum.Font.SourceSansBold
CheerText.Parent = Frame

-- HIỆU ỨNG NHẤP NHÁY CHỮ "CỐ LÊN!"
local running = true
task.spawn(function()
    while running do
        CheerText.Visible = true
        task.wait(0.4)
        CheerText.Visible = false
        task.wait(0.4)
    end
end)

-- XỬ LÝ LỘ TRÌNH ĐẾM NGƯỜC TROLL
local count = 10
local stage = 1

while count > 0 and running do
    CountdownText.Text = tostring(count)
    
    if stage == 1 and count == 5 then
        task.wait(0.5)
        count = 10
        stage = 2
        CountdownText.Text = "10"
    elseif stage == 2 and count == 3 then
        task.wait(0.5)
        count = 5
        stage = 3
        CountdownText.Text = "5"
    else
        count = count - 1
    end
    
    task.wait(1)
end

-- TẮT HIỆU ỨNG VÀ HIỆN DÒNG CHỮ TROLL "CAY KO :)"
running = false
CheerText.Visible = false
CountdownText.Text = "0"
Text.Text = "Hoàn tất!"

local TrollText = Instance.new("TextLabel")
TrollText.Size = UDim2.new(1, 0, 0, 30)
TrollText.Position = UDim2.new(0, 0, 0, 135)
TrollText.BackgroundTransparency = 1
TrollText.Text = "cay ko :)"
TrollText.TextColor3 = Color3.fromRGB(255, 50, 50)
TrollText.TextSize = 22
TrollText.Font = Enum.Font.SourceSansBold
TrollText.Parent = Frame

-- Giữ màn hình troll 1.5 giây rồi mới xóa
task.wait(1.5)
ScreenGui:Destroy()

-- 2. KHỞI TẠO VÀ HIỆN MENU
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

Rayfield:Notify({
    Title = "SCRIPT VUA HUB",
    Content = "Đã tải menu thành công!",
    Duration = 2,
    Image = 4483345998,
})

local Window = Rayfield:CreateWindow({
   Name = "SCRIPT VUA HUB | on top",
   LoadingTitle = "Đang tải VUA HUB...",
   LoadingSubtitle = "Delta Executor",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "VuaHubConfig"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvite",
      RememberJoins = true
   },
   KeySystem = false
})

-- =============================================================
-- CÁC TAB DANH MỤC SCRIPT
-- =============================================================
local Tabs = {
    Home     = Window:CreateTab("Trang Chủ", 4483345998),
    Scripts1 = Window:CreateTab("Script  farm", 4483345998),
    Scripts2 = Window:CreateTab("Script  kaitun", 4483345998),
    Scripts3 = Window:CreateTab("Script  auto buonty", 4483345998),
    Scripts4 = Window:CreateTab("Script  kaitun cybrog", 4483345998),
    Scripts5 = Window:CreateTab("Script  auto fruits", 4483345998)
}

-- =============================================================
-- TRANG CHỦ (THÔNG BÁO)
-- =============================================================
Tabs.Home:CreateSection("Thông Báo")

Tabs.Home:CreateParagraph({
    Title = "Thông Báo",
    Content = "tao yêu việt nam"
})

Tabs.Home:CreateButton({
    Name = "Ẩn Giao Diện",
    Callback = function()
        Rayfield:Destroy()
    end
})

-- =============================================================
-- DANH SÁCH SCRIPT FARM (Scripts1)
-- =============================================================
Tabs.Scripts1:CreateSection("Danh Sách Script farm")

Tabs.Scripts1:CreateButton({
    Name = "Script realkid hub ►",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/realkidhub/realkid/refs/heads/main/main.lua"))()
        
        Rayfield:Notify({
            Title = "Thành công",
            Content = "Đã chạy Script Realkid!",
            Duration = 3,
            Image = 4483345998,
        })
    end
})

Tabs.Scripts1:CreateButton({
    Name = "Script bố mày yêu việt nam ►",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/banamkhoi/BOMAYYEUVIETNAM-Hub-menu-redz-hub/refs/heads/main/BOMAYYEUVIETNAM%20Hub%20fix.lua"))()
        
        Rayfield:Notify({
            Title = "Thành công",
            Content = "Đã chạy Script !",
            Duration = 3,
            Image = 4483345998,
        })
    end
})

Tabs.Scripts1:CreateButton({
    Name = "Script  Aquamarine►",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bloxfruitsnokey/Redz/refs/heads/main/Aquamarine/script.luau"))()
        
        Rayfield:Notify({
            Title = "Thành công",
            Content = "Đã chạy Script !",
            Duration = 3,
            Image = 4483345998,
        })
    end
})

Tabs.Scripts1:CreateButton({
    Name = "Script  long hihi►",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/longhihilonghihi-hub/Devs-LongHiHiV4.5.1/refs/heads/main/Main.TxT.Luau"))()
        
        Rayfield:Notify({
            Title = "Thành công",
            Content = "Đã chạy Script !",
            Duration = 3,
            Image = 4483345998,
        })
    end
})

Tabs.Scripts1:CreateButton({
    Name = "Script  gravity►",
    Callback = function()
        GravityHub = {
            Key = "",
            Team = "Pirates",
            Color = "Red",
            SaveSetting = false,
            AutoExecutor = false
        }
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Dev-GravityHub/BloxFruit/refs/heads/main/MainPremium.lua"))()
        
        Rayfield:Notify({
            Title = "Thành công",
            Content = "Đã chạy Script !",
            Duration = 3,
            Image = 4483345998,
        })
    end
})

Tabs.Scripts1:CreateButton({
    Name = "Script  Hinishi►",
    Callback = function()
        local Settings = {
            JoinTeam = "Pirates",
            Translator = true,
        }
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Dev-Hinishi/Hinishi-Hub/refs/heads/main/Freemium.lua"))(Settings)
        
        Rayfield:Notify({
            Title = "Thành công",
            Content = "Đã chạy Script !",
            Duration = 3,
            Image = 4483345998,
        })
    end
})

Tabs.Scripts1:CreateButton({
    Name = "Script  tày►",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VTDROBLOX/Animehub/refs/heads/main/Tayhub.lua"))()
        
        Rayfield:Notify({
            Title = "Thành công",
            Content = "Đã chạy Script !",
            Duration = 3,
            Image = 4483345998,
        })
    end
})

Tabs.Scripts1:CreateButton({
    Name = "Script  trigent hub►",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bloxfruitsnokey/Banana/refs/heads/main/Trident/script.luau"))()
        
        Rayfield:Notify({
            Title = "Thành công",
            Content = "Đã chạy Script !",
            Duration = 3,
            Image = 4483345998,
        })
    end
})

Tabs.Scripts1:CreateButton({
    Name = "Script  Meteor hub►",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bloxfruitsnokey/Stellar/refs/heads/main/Meteor/script.luau"))()

        Rayfield:Notify({
            Title = "Thành công",
            Content = "Đã chạy Script !",
            Duration = 3,
            Image = 4483345998,
        })
    end
})

Tabs.Scripts1:CreateButton({
    Name = "Script  nataov hub►",
    Callback = function()
        repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer
        getgenv().Team = "Marines"
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Dev-AnhTuanSiTinkk/Module/refs/heads/main/BloxFruitsModule/beta.lua'))()
    
        Rayfield:Notify({
            Title = "Thành công",
            Content = "Đã chạy Script !",
            Duration = 3,
            Image = 4483345998,
        })
    end
})

Tabs.Scripts1:CreateButton({
    Name = "Script  neva hub►",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/VEZ2/NEVAHUB/main/2'))()
    
        Rayfield:Notify({
            Title = "Thành công",
            Content = "Đã chạy Script !",
            Duration = 3,
            Image = 4483345998,
        })
    end
})

Tabs.Scripts1:CreateButton({
    Name = "Script  ez hub►",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bloxfruitsnokey/Fluent/refs/heads/main/EZ/script.luau"))()
    
        Rayfield:Notify({
            Title = "Thành công",
            Content = "Đã chạy Script !",
            Duration = 3,
            Image = 4483345998,
        })
    end
})

Tabs.Scripts1:CreateButton({
    Name = "Script  dragon hub►",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Tdk-Dragon/DragonX.lua/refs/heads/main/DragonX.lua.txt"))()
    
        Rayfield:Notify({
            Title = "Thành công",
            Content = "Đã chạy Script !",
            Duration = 3,
            Image = 4483345998,
        })
    end
})

Tabs.Scripts1:CreateButton({
    Name = "Script  flen hub►",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bloxfruitsnokey/Fluent/refs/heads/main/Flen/script.luau"))()
    
        Rayfield:Notify({
            Title = "Thành công",
            Content = "Đã chạy Script !",
            Duration = 3,
            Image = 4483345998,
        })
    end
})

Tabs.Scripts1:CreateButton({
    Name = "Script  gb hub►",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bloxfruitsnokey/Banana/refs/heads/main/GB/script.luau"))()
    
        Rayfield:Notify({
            Title = "Thành công",
            Content = "Đã chạy Script !",
            Duration = 3,
            Image = 4483345998,
        })
    end
})

Tabs.Scripts1:CreateButton({
    Name = "Script  ngọc lục bảo hub►",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bloxfruitsnokey/Redz/refs/heads/main/Emerald/script.luau"))()
    
        Rayfield:Notify({
            Title = "Thành công",
            Content = "Đã chạy Script !",
            Duration = 3,
            Image = 4483345998,
        })
    end
})

Tabs.Scripts1:CreateButton({
    Name = "Script  W-Azeox►",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ru-3/W-Azeox/refs/heads/main/scripts/Bloxfruit.lua"))()
    
        Rayfield:Notify({
            Title = "Thành công",
            Content = "Đã chạy Script !",
            Duration = 3,
            Image = 4483345998,
        })
    end
})

Tabs.Scripts1:CreateButton({
    Name = "Script  turbo►",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TurboLite/Script/refs/heads/main/MainV2.lua"))()
    
        Rayfield:Notify({
            Title = "Thành công",
            Content = "Đã chạy Script !",
            Duration = 3,
            Image = 4483345998,
        })
    end
})

Tabs.Scripts1:CreateButton({
    Name = "Script  dumvn►",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DumHubdz/DumHubdzVN/refs/heads/main/DumHubdzVN.lua"))()
    
        Rayfield:Notify({
            Title = "Thành công",
            Content = "Đã chạy Script !",
            Duration = 3,
            Image = 4483345998,
        })
    end
})

Tabs.Scripts1:CreateButton({
    Name = "Script  neji►",
    Callback = function()
        repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Dev-NejiDepzai/Bloxfruits/refs/heads/main/Main.lua"))()
    
        Rayfield:Notify({
            Title = "Thành công",
            Content = "Đã chạy Script !",
            Duration = 3,
            Image = 4483345998,
        })
    end
})

Tabs.Scripts1:CreateButton({
    Name = "Script  star►",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bloxfruitsnokey/Stellar/refs/heads/main/Star/script.luau"))()
    
        Rayfield:Notify({
            Title = "Thành công",
            Content = "Đã chạy Script !",
            Duration = 3,
            Image = 4483345998,
        })
    end
})

-- =============================================================
-- DANH SÁCH SCRIPT KAITUN (Scripts2)
-- =============================================================
Tabs.Scripts2:CreateSection("Script kaitun")

Tabs.Scripts2:CreateButton({
    Name = "Script teddy ►",
    Callback = function()
        getgenv()["Config"] = {
            ["Fps Boost"] = true,
            ["FPS Cap"] = 30,
            ["Quests"] = {
                ["Pull Level"] = true,
                ["Upgrading Race"] = true,
            },
            ["Hopping"] = {
                ["Auto Hop"] = true,
                ["Hop Idle"] = true,
                ["High Ping Hop"] = true,
                ["Player Nearing Hop"] = true,
            },
            ["Sniper Fruit Shop"] = {
                ["Enabled"] = true,
                ["Fruit"] = {
                    "Kitsune-Kitsune",
                    "Dragon-Dragon",
                    "Yeti-Yeti",
                    "Gas-Gas"
                },
            },
            ["Oneclick"] = {
                ["Auto Fully Fighting Style"] = true,
                ["Rainbow Haki"] = true,
                ["Skull Guitar"] = true,
                ["Cursed Dual Katana"] = true,
                ["Saber"] = true,
                ["Get Ghoul"] = false,
                ["Collect Berries"] = false,
                ["Haki Legendery"] = false,
                ["TTK"] = false, 
            },
        }
        loadstring(game:HttpGet("https://raw.githubusercontent.com/teddyhubdev/diepvy/refs/heads/main/TeddyHub-kaitunBF.lua"))()
    end
})

Tabs.Scripts2:CreateButton({
    Name = "Script realkid hub ►",
    Callback = function()
        getgenv().Configs = {
            ["Quest"] = {
                ["Evo Race V1"] = true,
                ["Evo Race V2"] = true,
                ["RGB Haki"] = true,
                ["Pull Lerver"] = true,
            },
            Sword = {
                "Dual-Headed Blade", "Smoke Admiral", "Wardens Sword", "Cutlass",
                "Katana", "Dual Katana", "Triple Katana", "Iron Mace", "Saber",
                "Pole (1st Form)", "Gravity Blade", "Longsword", "Rengoku",
                "Midnight Blade", "Soul Cane", "Bisento", "Yama", "Tushita", "Cursed Dual Katana"
            },
            Gun = {
                "Skull Guitar", "Kabucha", "Venom Bow", "Musket", "Flintlock",
                "Refined Slingshot", "Magma Blaster", "Dual Flintlock", "Cannon",
                "Bizarre Revolver", "Bazooka"
            },
            ["Bypass TP"] = true,
            ["Auto Active Race V4"] = true,
        }
        loadstring(game:HttpGet("https://raw.githubusercontent.com/realkidhub/realkid/refs/heads/main/kaitun.lua"))()
    end
})

Tabs.Scripts2:CreateButton({
    Name = "Script night hub ►",
    Callback = function()
        getgenv().Config = {
            Team = "Pirates",
            FarmConfig = {
                ["Out game when done all"] = true,
                ["Bypass Teleport"] = true,
                ["Double Quest(RISK)"] = true
            },
            Items = {
                ["Saber"] = true,
                ["Pole (1st form)"] = true,
                ["Skull Guitar"] = true,
                ["Cursed Dual Katana"] = true,
                ["Godhuman"] = true
            },
            Webhook = {
                ["Enabled"] = false,
                ["Url"] = ""
            }
        }
        loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/d6c7959dcc94cd24467080d82a56dcf9.lua"))()
    end
})

Tabs.Scripts2:CreateButton({
    Name = "Script black v hub ►",
    Callback = function()
        getgenv().Config = {
            ["Hide UI"] = false,
            ["White Screen"] = false,
            ["Black Screen"] = false,
            ["Start Farm"] = true,
            ["Exit When Full Item"] = true,  
            ["Settings"] = {
                ["FPS Booster"] = true,
            },
            ["Auto Chat"] = {
                ["Enabled"] = false,
                ["Content"] = {"", "", ""},
                ["Time Chat"] = 9999 
            },
            ["HOP"] = {
                ["Enabled"] = true,
                ["time hop"] = 3000 
            },
            ["Melee"] = {
                ["All Melee V1"] = true,
                ["Super Huamn"] = true,
                ["Dragon Talon"] = true,
                ["Sharkman Karate"] = true,
                ["Elechic Claw"] = true,
                ["GodHuman"] = true,
            },
            ["Sword"] = {
                ["All Sword"] = true,
                ["Saber"] = true,
                ["Pole"] = true,
                ["Rengoku"] = true,
                ["Midnight Blade"] = true,
                ["Soul Cane"] = true,
                ["Gravity Cane"] = true,
                ["Dragon Trident"] = true,
                ["Legendary Sword"] = true,
                ["True Triple Katana"] = true,
                ["Twin Hooks"] = true,
                ["Canvander"] = true,
                ["Buddy Sword"] = true,
                ["Hallow Scythe"] = true,
                ["Yama"] = true,
                ["Tushita"] = true,
                ["Cursed Dual Katana"] = true,
            },
            ["Gun"] = {
                ["All Gun"] = true,
                ["Acidum Rifle"] = true,
                ["Kabucha"] = true,
                ["Serpent Bow"] = true,
                ["Skull Guitar"] = true,
            },
            ["Race"] = {
                ["Auto V2"] = true,
                ["Auto V3"] = true,
            },
        }
        loadstring(game:HttpGet("https://raw.githubusercontent.com/nvb201112/Black-V-Hub/refs/heads/main/KaitunBF.luau"))()
    end
})

-- =============================================================
-- DANH SÁCH SCRIPT AUTO BOUNTY (Scripts3)
-- =============================================================
Tabs.Scripts3:CreateSection("Script farm auto buonty")

Tabs.Scripts3:CreateButton({
    Name = "ko biết name ►",
    Callback = function()
        getgenv().AutoBountyConfig = {
            Team = "Pirates",
            Settings = {
                SpectateTarget = false,
                ESPTarget = true,
                CameraLock = true,
                BigHitbox = true,
                BypassTeleport = true,
                SkipV4Player = true,
                SkipFruit = {"Portal-Portal", "Buddha-Buddha", "Kitsune-Kitsune", "Dragon-Dragon", "Yeti-Yeti"},
                LowHealth = {
                    Min = 4000,
                    Max = 6000,
                },
                Others = {
                    AutoAwakeningV4 = true,
                    AutoTurnRaceV3 = true,
                    AutoKen = true,
                },
            },
            Weapon = {
                Melee = {
                    Enabled = true,
                    Delay = 0.1,
                    Skills = {
                        Z = {Enabled = true, Hold = 0},
                        X = {Enabled = true, Hold = 0},
                        C = {Enabled = true, Hold = 0},
                    },
                },
                Sword = {
                    Enabled = true,
                    Delay = 0.1,
                    Skills = {
                        Z = {Enabled = true, Hold = 0},
                        X = {Enabled = true, Hold = 0},
                    },
                },
                Gun = {
                    Enabled = true,
                    Delay = 0.1,
                    Skills = {
                        Z = {Enabled = true, Hold = 0},
                        X = {Enabled = true, Hold = 0},
                    },
                },
                ["Blox Fruit"] = {
                    Enabled = true,
                    Delay = 0.1,
                    Skills = {
                        Z = {Enabled = true, Hold = 0},
                        X = {Enabled = true, Hold = 0},
                        C = {Enabled = true, Hold = 0},
                        V = {Enabled = false, Hold = 0},
                        F = {Enabled = true, Hold = 0},
                    },
                },
            },
            Server = {
                StopAtBounty = 0,
                HopDelay = 5,
                HopCooldown = 15,
            },
            Webhook = {
                Enabled = false,
                Url = ""
            },
        }
        repeat task.wait() until game:IsLoaded()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/napun87/script/refs/heads/main/auto%20bounty.lua"))()
    end
})

-- =============================================================
-- DANH SÁCH SCRIPT AUTO CHEST & CYBORG (Scripts4)
-- =============================================================
Tabs.Scripts4:CreateButton({
    Name = "Script  Maris hub►",
    Callback = function()
        getgenv().Settings = {
            ["Team"] = "Pirates", 
            ["Max Chests"] = 30,
            ["Fragments"] = 2500
        }
        loadstring(game:HttpGet("https://raw.githubusercontent.com/godhnam/Script-Free/refs/heads/main/KaitunCyborg.Vip"))()

        Rayfield:Notify({
            Title = "Thành công",
            Content = "Đã chạy Script !",
            Duration = 3,
            Image = 4483345998,
        })
    end
})

-- =============================================================
-- DANH SÁCH SCRIPT AUTO FRUITS (Scripts5)
-- =============================================================
Tabs.Scripts5:CreateButton({
    Name = "Script  Maris hub►",
    Callback = function()
        repeat task.wait() until game:IsLoaded()
        getgenv().Settings = {
            ["Team"] = "Pirates",
            ["Webhook"] = "",
        }
        loadstring(game:HttpGet("https://raw.githubusercontent.com/godhnam/Script-Free/refs/heads/main/FindFruit.Vip"))()
        
        Rayfield:Notify({
            Title = "Thành công",
            Content = "Đã chạy Script !",
            Duration = 3,
            Image = 4483345998,
        })
    end
})
