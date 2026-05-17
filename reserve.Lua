local ScreenGui = Instance.new("ScreenGui")
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Stroke = Instance.new("UIStroke")
local Corner = Instance.new("UICorner")
local TopBar = Instance.new("Frame")

local CloseBtn = Instance.new("TextButton")
local MinBtn = Instance.new("TextButton")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.Name = "MainGUI"

Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 437, 0, 238)
Frame.Position = UDim2.new(0.5, -218.5, 0.5, -119)
Frame.BackgroundColor3 = Color3.fromRGB(18,18,22)
Frame.BackgroundTransparency = 0.1
Frame.BorderSizePixel = 0
Frame.Visible = false

-- Загрузочный экран
local LoadingFrame = Instance.new("Frame")
local LoadingTitle = Instance.new("TextLabel")
local LoadingBarBG = Instance.new("Frame")
local LoadingBar = Instance.new("Frame")
local LoadingCorner1 = Instance.new("UICorner")
local LoadingCorner2 = Instance.new("UICorner")

LoadingFrame.Parent = ScreenGui
LoadingFrame.Size = UDim2.new(0,500,0,300)
LoadingFrame.Position = UDim2.new(0.5,-250,0.5,-150)
LoadingFrame.BackgroundColor3 = Color3.fromRGB(10,10,15)
LoadingFrame.BackgroundTransparency = 0.15
LoadingFrame.BorderSizePixel = 0

local LoadingCorner = Instance.new("UICorner")
LoadingCorner.Parent = LoadingFrame
LoadingCorner.CornerRadius = UDim.new(0,20)
LoadingFrame.ZIndex = 999

local LoadingStroke = Instance.new("UIStroke")
LoadingStroke.Parent = LoadingFrame
LoadingStroke.Color = Color3.fromRGB(220,190,255)
LoadingStroke.Thickness = 1.5

LoadingTitle.Parent = LoadingFrame
LoadingTitle.Size = UDim2.new(1,0,0,60)
LoadingTitle.Position = UDim2.new(0,0,0.4,0)
LoadingTitle.BackgroundTransparency = 1
LoadingTitle.Text = "SEPTUS HUB"
LoadingTitle.Font = Enum.Font.GothamBlack
LoadingTitle.TextSize = 34
LoadingTitle.TextColor3 = Color3.fromRGB(220,190,255)
LoadingTitle.ZIndex = 1000

local LoadingStar = Instance.new("TextLabel")

LoadingStar.Parent = LoadingFrame
LoadingStar.Size = UDim2.new(0,80,0,80)
LoadingStar.Position = UDim2.new(0.5,-40,0.3,-40)
LoadingStar.BackgroundTransparency = 1
LoadingStar.Text = "★"
LoadingStar.TextSize = 65
LoadingStar.Font = Enum.Font.SourceSansBold
LoadingStar.TextColor3 = Color3.fromRGB(220,190,255)
LoadingStar.Rotation = 0
LoadingStar.ZIndex = 1000

-- лёгкое свечение
local StarStroke = Instance.new("UIStroke")
StarStroke.Parent = LoadingStar
StarStroke.Color = Color3.fromRGB(235,215,255)
StarStroke.Thickness = 1.5

local TweenService = game:GetService("TweenService")

local function createToggle(
parent,
name,
y
)

local label =
Instance.new(
"TextLabel"
)

label.Parent =
parent

label.Text =
name

label.Size =
UDim2.new(
0,
150,
0,
30
)

label.Position =
UDim2.new(
0,
0,
0,
y
)

label.BackgroundTransparency =
1

label.TextColor3 =
Color3.fromRGB(
220,
190,
255
)

label.Font =
Enum.Font.Gotham

local bg =
Instance.new(
"TextButton"
)

bg.Text = ""

bg.Parent =
parent

bg.Size =
UDim2.new(
0,
60,
0,
30
)

bg.Position =
UDim2.new(
1,
-65,
0,
y
)

bg.BackgroundColor3 =
Color3.fromRGB(
50,
50,
60
)

Instance.new(
"UICorner",
bg
).CornerRadius =
UDim.new(
1,
0
)

local circle =
Instance.new(
"Frame"
)

circle.Parent =
bg

circle.Size =
UDim2.new(
0,
24,
0,
24
)

circle.Position =
UDim2.new(
0,
3,
0.5,
-12
)

circle.BackgroundColor3 =
Color3.new(
1,
1,
1
)

Instance.new(
"UICorner",
circle
).CornerRadius =
UDim.new(
1,
0
)

return bg,circle

end

-- бесконечное вращение
task.spawn(function()
while LoadingStar.Parent do
local rotate = TweenService:Create(
LoadingStar,
TweenInfo.new(
2,
Enum.EasingStyle.Linear
),
{Rotation = LoadingStar.Rotation + 360}
)

rotate:Play()
rotate.Completed:Wait()
end

end)

-- лёгкая пульсация
task.spawn(function()
while LoadingStar.Parent do
TweenService:Create(
LoadingStar,
TweenInfo.new(1),
{TextTransparency = 0.2}
):Play()

task.wait(1)

TweenService:Create(    
	LoadingStar,    
	TweenInfo.new(1),    
	{TextTransparency = 0}    
):Play()    

task.wait(1)

end

end)

LoadingBarBG.Parent = LoadingFrame
LoadingBarBG.Size = UDim2.new(0,250,0,10)
LoadingBarBG.Position = UDim2.new(0.5,-125,0.55,0)
LoadingBarBG.BackgroundColor3 = Color3.fromRGB(40,40,50)
LoadingBarBG.BorderSizePixel = 0
LoadingBarBG.ZIndex = 1000
LoadingCorner1.Parent = LoadingBarBG

LoadingBar.Parent = LoadingBarBG
LoadingBar.Size = UDim2.new(0,0,1,0)
LoadingBar.BackgroundColor3 = Color3.fromRGB(210,180,255)
LoadingBar.BorderSizePixel = 0
LoadingBar.ZIndex = 1001
LoadingCorner2.Parent = LoadingBar

local TweenService = game:GetService("TweenService")

-- анимация загрузки (7 сек)
TweenService:Create(
LoadingBar,
TweenInfo.new(7, Enum.EasingStyle.Linear),
{Size = UDim2.new(1,0,1,0)}
):Play()

task.wait(7)

-- плавное исчезновение
TweenService:Create(
LoadingFrame,
TweenInfo.new(0.8),
{BackgroundTransparency = 1}
):Play()

TweenService:Create(
LoadingTitle,
TweenInfo.new(0.8),
{TextTransparency = 1}
):Play()

TweenService:Create(
LoadingBarBG,
TweenInfo.new(0.8),
{BackgroundTransparency = 1}
):Play()

TweenService:Create(
LoadingBar,
TweenInfo.new(0.8),
{BackgroundTransparency = 1}
):Play()

task.wait(1)

TweenService:Create(
LoadingStar,
TweenInfo.new(0.8),
{
TextTransparency = 1,
Rotation = LoadingStar.Rotation + 90
}
):Play()

task.wait(0.8)

LoadingFrame:Destroy()
Frame.Visible = true

Corner.Parent = Frame
Corner.CornerRadius = UDim.new(0,10)

Stroke.Parent = Frame
Stroke.Color = Color3.fromRGB(210,180,255)
Stroke.Thickness = 1.2
Stroke.Transparency = 0

-- тонкая серая полоска
TopBar.Parent = Frame
TopBar.Size = UDim2.new(1, -2, 0, 1)
TopBar.Position = UDim2.new(0, 1, 0.12, 0)
TopBar.BackgroundColor3 = Color3.fromRGB(140,140,140)
TopBar.BackgroundTransparency = 0.35
TopBar.BorderSizePixel = 0

-- левая полоска
local SideBar = Instance.new("Frame")

SideBar.Parent = Frame
SideBar.Size = UDim2.new(0, 1, 1, -30) -- высота без верхней полоски
SideBar.Position = UDim2.new(0, 100, 0, 30) -- начинается ниже верхней полоски
SideBar.BackgroundColor3 = Color3.fromRGB(140,140,140)
SideBar.BackgroundTransparency = 0.35
SideBar.BorderSizePixel = 0

-- HOME BUTTON
local HomeBtn = Instance.new("TextButton")
local HomeCorner = Instance.new("UICorner")

HomeBtn.Parent = Frame
HomeBtn.Size = UDim2.new(0,80,0,28)
HomeBtn.Position = UDim2.new(0,10,0,40) -- под верхней полоской
HomeBtn.BackgroundColor3 = Color3.fromRGB(220,190,255)
HomeBtn.Text = "Home"
HomeBtn.TextColor3 = Color3.fromRGB(20,20,25)
HomeBtn.Font = Enum.Font.GothamBold
HomeBtn.TextSize = 14
HomeBtn.BorderSizePixel = 0

HomeCorner.Parent = HomeBtn
HomeCorner.CornerRadius = UDim.new(0,8)

-- SERVER BUTTON
local ServerBtn = Instance.new("TextButton")
local ServerCorner = Instance.new("UICorner")

ServerBtn.Parent = Frame
ServerBtn.Size = UDim2.new(0,80,0,28)
ServerBtn.Position = UDim2.new(0,10,0,75)
ServerBtn.BackgroundColor3 =
Color3.fromRGB(220,190,255)

ServerBtn.Text = "Server"
ServerBtn.TextColor3 =
Color3.fromRGB(20,20,25)

ServerBtn.Font =
Enum.Font.GothamBold

ServerBtn.TextSize = 14
ServerBtn.BorderSizePixel = 0

ServerCorner.Parent =
ServerBtn

ServerCorner.CornerRadius =
UDim.new(0,8)

-- VISUALS BUTTON
local VisualsBtn = Instance.new("TextButton")
local VisualsCorner = Instance.new("UICorner")

VisualsBtn.Parent = Frame
VisualsBtn.Size = UDim2.new(0,80,0,28)
VisualsBtn.Position = UDim2.new(0,10,0,110)
VisualsBtn.BackgroundColor3 =
Color3.fromRGB(220,190,255)

VisualsBtn.Text = "Visuals"
VisualsBtn.TextColor3 =
Color3.fromRGB(20,20,25)

VisualsBtn.Font =
Enum.Font.GothamBold

VisualsBtn.TextSize = 14
VisualsBtn.BorderSizePixel = 0

VisualsCorner.Parent =
VisualsBtn

VisualsCorner.CornerRadius =
UDim.new(0,8)

-- TELEPORT BUTTON
local TeleportBtn =
Instance.new("TextButton")

local TeleportCorner =
Instance.new("UICorner")

TeleportBtn.Parent =
Frame

TeleportBtn.Size =
UDim2.new(
0,
80,
0,
28
)

TeleportBtn.Position =
UDim2.new(
0,
10,
0,
145
)

TeleportBtn.BackgroundColor3 =
Color3.fromRGB(
220,
190,
255
)

TeleportBtn.Text =
"Teleport"

TeleportBtn.TextColor3 =
Color3.fromRGB(
20,
20,
25
)

TeleportBtn.Font =
Enum.Font.GothamBold

TeleportBtn.TextSize =
14

TeleportBtn.BorderSizePixel =
0

TeleportCorner.Parent =
TeleportBtn

TeleportCorner.CornerRadius =
UDim.new(
0,
8
)

-- COMBAT BUTTON
local CombatBtn =
Instance.new("TextButton")

local CombatCorner =
Instance.new("UICorner")

CombatBtn.Parent =
Frame

CombatBtn.Size =
UDim2.new(
0,
80,
0,
28
)

CombatBtn.Position =
UDim2.new(
0,
10,
0,
180 -- ниже Teleport
)

CombatBtn.BackgroundColor3 =
Color3.fromRGB(
220,
190,
255
)

CombatBtn.Text =
"Combat"

CombatBtn.TextColor3 =
Color3.fromRGB(
20,
20,
25
)

CombatBtn.Font =
Enum.Font.GothamBold

CombatBtn.TextSize =
14

CombatBtn.BorderSizePixel =
0

CombatCorner.Parent =
CombatBtn

CombatCorner.CornerRadius =
UDim.new(
0,
8
)

-- COMBAT PAGE
local CombatPage = Instance.new("Frame")
CombatPage.Parent = Frame
CombatPage.Visible = false
CombatPage.Position = UDim2.new(0, 110, 0, 40)
CombatPage.Size = UDim2.new(1, -120, 1, -50)
CombatPage.BackgroundTransparency = 1

-- ==================== [ РАЗДЕЛ AIM В COMBAT ] ====================
local AimBtn = Instance.new("TextButton")
AimBtn.Parent = CombatPage
AimBtn.Size = UDim2.new(1, -20, 0, 35)
AimBtn.Position = UDim2.new(0, 10, 0, 10)
AimBtn.BackgroundColor3 = Color3.fromRGB(220, 190, 255)
AimBtn.Text = "AIM"
AimBtn.TextColor3 = Color3.fromRGB(20, 20, 25)
AimBtn.Font = Enum.Font.GothamBold
AimBtn.TextSize = 14
Instance.new("UICorner", AimBtn).CornerRadius = UDim.new(0, 8)

local AimArrow = Instance.new("TextLabel")
AimArrow.Parent = AimBtn
AimArrow.Size = UDim2.new(0, 20, 1, 0)
AimArrow.Position = UDim2.new(1, -25, 0, 0)
AimArrow.BackgroundTransparency = 1
AimArrow.Text = "▼"
AimArrow.Font = Enum.Font.GothamBold
AimArrow.TextColor3 = Color3.fromRGB(20, 20, 25)

local AimMenu = Instance.new("Frame")
AimMenu.Parent = CombatPage
AimMenu.Visible = false
AimMenu.Position = UDim2.new(0, 10, 0, 50)
AimMenu.Size = UDim2.new(1, -20, 0, 0)
AimMenu.BackgroundTransparency = 1
AimMenu.ClipsDescendants = true

local KillAuraToggle, KillAuraCircle = createToggle(AimMenu, "Kill aura", 5)
local SilentAimToggle, SilentAimCircle = createToggle(AimMenu, "Silent Aim", 45)
local WallCheckToggle, WallCheckCircle =
createToggle(AimMenu, "Wall Check", 85)

local DistanceToggle, DistanceCircle =
createToggle(AimMenu, "Distance Limit", 125)

local TargetPartBtn = Instance.new("TextButton")
TargetPartBtn.Parent = AimMenu
TargetPartBtn.Size = UDim2.new(1, 0, 0, 30)
TargetPartBtn.Position = UDim2.new(0, 0, 0, 85)
TargetPartBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
TargetPartBtn.Text = "Target: Head"
TargetPartBtn.TextColor3 = Color3.fromRGB(220, 190, 255)
TargetPartBtn.Font = Enum.Font.GothamBold
TargetPartBtn.BorderSizePixel = 0
Instance.new("UICorner", TargetPartBtn).CornerRadius = UDim.new(0, 8)

local aimOpened = false
local killAuraActive = false
local silentAimActive = false
local targetPart = "Head"

local AimSettings = {
    WallCheck = false,
    DistanceLimit = false,
    MaxDistance = 300
}

local WeaponSettings = {
    NoRecoil = false,
    NoSpread = false,
    RapidFire = false,
    InfAmmo = false
}

AimBtn.MouseButton1Click:Connect(function()
    aimOpened = not aimOpened
    TweenService:Create(AimArrow, TweenInfo.new(.2), {Rotation = aimOpened and 180 or 0}):Play()
    AimArrow.Text = aimOpened and "▲" or "▼"
    
    if aimOpened then
        AimMenu.Visible = true
        TweenService:Create(AimMenu, TweenInfo.new(.2), {Size = UDim2.new(1, -20, 0, 170)}):Play()
    else
        TweenService:Create(AimMenu, TweenInfo.new(.2), {Size = UDim2.new(1, -20, 0, 0)}):Play()
        task.delay(.2, function()
            if not aimOpened then AimMenu.Visible = false end
        end)
    end
end)

KillAuraToggle.MouseButton1Click:Connect(function()
    killAuraActive = not killAuraActive
    TweenService:Create(KillAuraCircle, TweenInfo.new(.2), {
        Position = killAuraActive and UDim2.new(1, -27, .5, -12) or UDim2.new(0, 3, .5, -12)
    }):Play()
    TweenService:Create(KillAuraToggle, TweenInfo.new(.2), {
        BackgroundColor3 = killAuraActive and Color3.fromRGB(220, 190, 255) or Color3.fromRGB(50, 50, 60)
    }):Play()
end)

SilentAimToggle.MouseButton1Click:Connect(function()
    silentAimActive = not silentAimActive
    TweenService:Create(SilentAimCircle, TweenInfo.new(.2), {
        Position = silentAimActive and UDim2.new(1, -27, .5, -12) or UDim2.new(0, 3, .5, -12)
    }):Play()
    TweenService:Create(SilentAimToggle, TweenInfo.new(.2), {
        BackgroundColor3 = silentAimActive and Color3.fromRGB(220, 190, 255) or Color3.fromRGB(50, 50, 60)
    }):Play()
end)

WallCheckToggle.MouseButton1Click:Connect(function()

AimSettings.WallCheck =
not AimSettings.WallCheck

TweenService:Create(
WallCheckCircle,
TweenInfo.new(.2),
{
Position =
AimSettings.WallCheck
and UDim2.new(1,-27,.5,-12)
or UDim2.new(0,3,.5,-12)
}
):Play()

end)


DistanceToggle.MouseButton1Click:Connect(function()

AimSettings.DistanceLimit =
not AimSettings.DistanceLimit

TweenService:Create(
DistanceCircle,
TweenInfo.new(.2),
{
Position =
AimSettings.DistanceLimit
and UDim2.new(1,-27,.5,-12)
or UDim2.new(0,3,.5,-12)
}
):Play()

end)

TargetPartBtn.MouseButton1Click:Connect(function()
    if targetPart == "Head" then
        targetPart = "Torso"
    else
        targetPart = "Head"
    end
    TargetPartBtn.Text = "Target: " .. targetPart
end)

-- РАБОЧИЙ ХУК ДЛЯ SILENT AIM (Наведение пуль)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local closestPlayer = nil

task.spawn(function()
    while task.wait(0.1) do
        if not silentAimActive then
            closestPlayer = nil
            continue
        end

        local shortest = math.huge
        local target = nil

        for _,plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer
            and plr.Character
            and plr.Character:FindFirstChild(targetPart)
            and plr.Character:FindFirstChild("Humanoid")
            and plr.Character.Humanoid.Health > 0 then

                local pos, visible =
                    Camera:WorldToViewportPoint(
                        plr.Character[targetPart].Position
                    )

                if visible then
                    local dist =
                    (
                        Vector2.new(
                            pos.X,
                            pos.Y
                        )
                        -
                        Camera.ViewportSize/2
                    ).Magnitude

                    if dist < shortest then
                        shortest = dist
                        target = plr
                    end
                end
            end
        end

        closestPlayer = target
    end
end)

local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
setreadonly(mt, false)

local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()

    -- Сначала проверяем, активен ли аимбот и не мы ли вызываем функцию
    if silentAimActive and not checkcaller() then
        -- Проверяем метод ДО того, как собирать аргументы в таблицу
        if method == "FindPartOnRayWithIgnoreList" or method == "FindPartOnRayWithWhitelist" or method == "FindPartOnRay" or method == "Raycast" then
            
            -- Проверяем, есть ли валидная цель
            if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild(targetPart) then
                
                -- Вот теперь, когда мы уверены, что это нужный вызов, собираем аргументы
                local args = {...}
                
                if method == "Raycast" then
                    local origin = args[1]
                    args[2] = (closestPlayer.Character[targetPart].Position - origin).Unit * 1000
                    return oldNamecall(self, unpack(args))
                else
                    local origin = args[1].Origin
                    local direction = (closestPlayer.Character[targetPart].Position - origin).Unit * 1000
                    args[1] = Ray.new(origin, direction)
                    return oldNamecall(self, unpack(args))
                end
            end
        end
    end
    
    -- Если это не Raycast, просто возвращаем оригинальный вызов без создания таблиц
    return oldNamecall(self, ...)
end)
setreadonly(mt, true)
-- =================================================================

local WeaponBtn =
Instance.new("TextButton")

WeaponBtn.Parent =
CombatPage

WeaponBtn.Size =
UDim2.new(1,-20,0,35)

WeaponBtn.Position =
UDim2.new(0,10,0,180)

WeaponBtn.BackgroundColor3 =
Color3.fromRGB(220,190,255)

WeaponBtn.Text =
"WEAPON MODS"

Instance.new(
"UICorner",
WeaponBtn
)

local WeaponMenu =
Instance.new("Frame")

WeaponMenu.Parent =
CombatPage

WeaponMenu.Position =
UDim2.new(0,10,0,220)

WeaponMenu.Size =
UDim2.new(1,-20,0,0)

WeaponMenu.Visible =
false

WeaponMenu.ClipsDescendants =
true

local NoRecoilToggle, NoRecoilCircle =
createToggle(
WeaponMenu,
"No Recoil",
0
)

local NoSpreadToggle, NoSpreadCircle =
createToggle(
WeaponMenu,
"No Spread",
40
)

local RapidFireToggle, RapidFireCircle =
createToggle(
WeaponMenu,
"Rapid Fire",
80
)

local AmmoToggle, AmmoCircle =
createToggle(
WeaponMenu,
"Inf Ammo",
120
)

local weaponOpen =
false

WeaponBtn.MouseButton1Click:Connect(function()

weaponOpen =
not weaponOpen

WeaponMenu.Visible =
true

TweenService:Create(
WeaponMenu,
TweenInfo.new(.2),
{
Size =
weaponOpen
and UDim2.new(
1,-20,
0,170
)
or
UDim2.new(
1,-20,
0,0
)
}
):Play()

end)

NoRecoilToggle.MouseButton1Click:Connect(function()
WeaponSettings.NoRecoil =
not WeaponSettings.NoRecoil
end)

NoSpreadToggle.MouseButton1Click:Connect(function()
WeaponSettings.NoSpread =
not WeaponSettings.NoSpread
end)

RapidFireToggle.MouseButton1Click:Connect(function()
WeaponSettings.RapidFire =
not WeaponSettings.RapidFire
end)

AmmoToggle.MouseButton1Click:Connect(function()
WeaponSettings.InfAmmo =
not WeaponSettings.InfAmmo
end)

-- HOME PAGE
local HomePage = Instance.new("ScrollingFrame")

HomePage.Parent = Frame
HomePage.Position = UDim2.new(0,110,0,40) -- начинается после левой полоски
HomePage.Size = UDim2.new(1,-120,1,-50)
HomePage.CanvasSize = UDim2.new(0,0,0,400)
HomePage.ScrollBarThickness = 4
HomePage.BackgroundTransparency = 1
HomePage.Visible = false -- НЕ показывать сразу
HomePage.BorderSizePixel = 0

local ServerPage =
Instance.new("Frame")

ServerPage.Parent =
Frame

ServerPage.Visible =
false

ServerPage.Position =
UDim2.new(0,110,0,40)

ServerPage.Size =
UDim2.new(1,-120,1,-50)

ServerPage.BackgroundTransparency =
1

local VisualsPage =
Instance.new("ScrollingFrame")

VisualsPage.Parent =
Frame

VisualsPage.Visible =
false

VisualsPage.Position =
UDim2.new(0,110,0,40)

VisualsPage.Size =
UDim2.new(1,-120,1,-50)

VisualsPage.BackgroundTransparency =
1

VisualsPage.CanvasSize =
UDim2.new(0,0,0,900)

VisualsPage.ScrollBarThickness =
4

VisualsPage.BorderSizePixel =
0

VisualsPage.Parent =
Frame

VisualsPage.Visible =
false

VisualsPage.Position =
UDim2.new(0,110,0,40)

VisualsPage.Size =
UDim2.new(1,-120,1,-50)

VisualsPage.BackgroundTransparency =
1

local TeleportPage =
Instance.new(
"ScrollingFrame"
)

TeleportPage.Parent =
Frame

TeleportPage.Visible =
false

TeleportPage.Position =
UDim2.new(
0,
110,
0,
40
)

TeleportPage.Size =
UDim2.new(
1,
-120,
1,
-50
)

TeleportPage.CanvasSize =
UDim2.new(
0,
0,
0, 700
)

TeleportPage.ScrollBarThickness =
4

TeleportPage.BackgroundTransparency =
1

TeleportPage.BorderSizePixel =
0

local TPCard =
Instance.new("Frame")

TPCard.Parent =
TeleportPage

TPCard.Size =
UDim2.new(
1,
-10,
0,
90
)

TPCard.BackgroundColor3 =
Color3.fromRGB(
220,
190,
255
)

TPCard.BackgroundTransparency =
.15

Instance.new(
"UICorner",
TPCard
)

local SelectedAvatar =
Instance.new(
"ImageLabel"
)

SelectedAvatar.Parent =
TPCard

SelectedAvatar.Size =
UDim2.new(
0,
60,
0,
60
)

SelectedAvatar.Position =
UDim2.new(
0,
10,
0.5,
-30
)

SelectedAvatar.BackgroundTransparency =
1


local SelectedName =
Instance.new(
"TextLabel"
)

SelectedName.Parent =
TPCard

SelectedName.Position =
UDim2.new(
0,
80,
0,
15
)

SelectedName.Size =
UDim2.new(
1,
-90,
0,
20
)

SelectedName.BackgroundTransparency =
1

SelectedName.Text =
"Player"

SelectedName.Font =
Enum.Font.GothamBold

SelectedName.TextColor3 =
Color3.new(
1,
1,
1
)

local TPPlayer = nil

local function makeTPBtn(
text,
x
)

local b=
Instance.new(
"TextButton"
)

b.Parent=
TPCard

b.Size=
UDim2.new(
0,
100,
0,
30
)

b.Position=
UDim2.new(
0,
x,
0,
50
)

b.BackgroundColor3=
Color3.fromRGB(
220,
190,
255
)

b.Text=text

b.TextColor3=
Color3.fromRGB(
20,
20,
25
)

Instance.new(
"UICorner",
b
)

return b

end

local TPBtn =
makeTPBtn(
"Teleport",
80
)

local SpectateBtn =
makeTPBtn(
"Spectate",
190
)

local PlayersBtn =
Instance.new(
"TextButton"
)

PlayersBtn.Parent =
TeleportPage

PlayersBtn.Size =
UDim2.new(
1,
-20,
0,
35
)

PlayersBtn.Position =
UDim2.new(
0,
10,
0,
110
)

PlayersBtn.BackgroundColor3 =
Color3.fromRGB(
220,
190,
255
)

PlayersBtn.Text =
"Players"

PlayersBtn.TextColor3 =
Color3.fromRGB(
20,
20,
25
)

Instance.new(
"UICorner",
PlayersBtn
)

local PlayersMenu =
Instance.new(
"ScrollingFrame"
)

PlayersMenu.Parent =
TeleportPage

PlayersMenu.Position =
UDim2.new(
0,
10,
0,
150
)

PlayersMenu.Size =
UDim2.new(
1,
-20,
0,
0
)

PlayersMenu.Visible =
false

PlayersMenu.CanvasSize =
UDim2.new(
0,
0,
0,
500
)

PlayersMenu.BackgroundTransparency =
1

local playersOpen =
false

local function refreshPlayers()

PlayersMenu:ClearAllChildren()

local layout =
Instance.new("UIListLayout")

layout.Parent =
PlayersMenu

layout.Padding =
UDim.new(0,5)

for _,plr in ipairs(game.Players:GetPlayers()) do

if plr == game.Players.LocalPlayer then
continue
end

local btn =
Instance.new("TextButton")

btn.Parent =
PlayersMenu

btn.Size =
UDim2.new(1,0,0,35)

btn.BackgroundColor3 =
Color3.fromRGB(220,190,255)

btn.TextColor3 =
Color3.fromRGB(20,20,25)

btn.Font =
Enum.Font.GothamBold

btn.Text =
plr.Name

Instance.new("UICorner",btn)

btn.MouseButton1Click:Connect(function()

TPPlayer =
plr

SelectedName.Text =
plr.Name

SelectedAvatar.Image =
game.Players:GetUserThumbnailAsync(
plr.UserId,
Enum.ThumbnailType.HeadShot,
Enum.ThumbnailSize.Size420x420
)

end)

end

PlayersMenu.CanvasSize =
UDim2.new(
0,
0,
0,
layout.AbsoluteContentSize.Y
)

end

for i,plr in pairs(
game.Players:GetPlayers()
) do

if plr ==
game.Players.LocalPlayer then
continue
end

local btn=
Instance.new(
"TextButton"
)

btn.Parent=
PlayersMenu

btn.Size=
UDim2.new(
1,
0,
0,
35
)

btn.Position=
UDim2.new(
0,
0,
0,
(i-1)*40
)

btn.BackgroundColor3=
Color3.fromRGB(
220,
190,
255
)

btn.TextColor3=
Color3.fromRGB(
20,
20,
25
)

btn.Font=
Enum.Font.GothamBold

btn.Text=
plr.Name

Instance.new(
"UICorner",
btn
)

btn.MouseButton1Click:Connect(function()

TPPlayer=
plr

SelectedName.Text=
plr.Name

SelectedAvatar.Image=
game.Players:GetUserThumbnailAsync(

plr.UserId,

Enum.ThumbnailType.HeadShot,

Enum.ThumbnailSize.Size420x420

)

end)

end

local ToolBtn =
Instance.new(
"TextButton"
)

ToolBtn.Parent =
TeleportPage

ToolBtn.Size =
UDim2.new(
1,
-20,
0,
35
)

ToolBtn.Position =
UDim2.new(
0,
10,
0,
160
)

ToolBtn.BackgroundColor3 =
Color3.fromRGB(
220,
190,
255
)

ToolBtn.Text =
"Teleport Tool"

ToolBtn.TextColor3 =
Color3.fromRGB(
20,
20,
25
)

Instance.new(
"UICorner",
ToolBtn
)

ToolBtn.MouseButton1Click:Connect(function()

local tool=
Instance.new(
"Tool"
)

tool.Name=
"Teleport Tool"

tool.RequiresHandle=
false

tool.Parent=
game.Players.LocalPlayer.Backpack


tool.Activated:Connect(function()

local mouse=
game.Players.LocalPlayer:
GetMouse()

if mouse.Hit then

game.Players.LocalPlayer.Character:
MoveTo(
mouse.Hit.Position
)

end

end)

end)

PlayersBtn.MouseButton1Click:Connect(function()

    playersOpen = not playersOpen

    refreshPlayers()

    PlayersMenu.Visible = true

    local menuHeight =
        playersOpen and 200 or 0

    TweenService:Create(
        PlayersMenu,
        TweenInfo.new(0.2),
        {
            Size = UDim2.new(
                1,
                -20,
                0,
                menuHeight
            )
        }
    ):Play()

    -- двигаем кнопку ниже списка игроков
    TweenService:Create(
        ToolBtn,
        TweenInfo.new(0.2),
        {
            Position =
                UDim2.new(
                    0,
                    10,
                    0,
                    160 + menuHeight
                )
        }
    ):Play()

end)

TPBtn.MouseButton1Click:Connect(function()

if not TPPlayer then
return
end

local my =
game.Players.LocalPlayer.Character

local target =
TPPlayer.Character

if my
and target
and target:FindFirstChild(
"HumanoidRootPart"
) then

my:
MoveTo(

target.HumanoidRootPart.Position

)

end

end)

SpectateBtn.MouseButton1Click:Connect(function()

if not TPPlayer then
return
end

workspace.CurrentCamera.CameraSubject =
TPPlayer.Character.Humanoid

end)

local ESPBtn =
Instance.new("TextButton")

ESPBtn.Parent =
VisualsPage

ESPBtn.Size =
UDim2.new(1,-20,0,35)

ESPBtn.Position =
UDim2.new(0,10,0,10)

ESPBtn.BackgroundColor3 =
Color3.fromRGB(200,190,255)

ESPBtn.Text =
"ESP"

ESPBtn.TextColor3 =
Color3.fromRGB(
20,
20,
25
)

ESPBtn.TextColor3 =
Color3.fromRGB(20,20,25)

ESPBtn.Font =
Enum.Font.GothamBold

Instance.new(
"UICorner",
ESPBtn
)

local Arrow =
Instance.new("TextLabel")

Arrow.Parent =
ESPBtn

Arrow.Size =
UDim2.new(0,20,1,0)

Arrow.Position =
UDim2.new(1,-25,0,0)

Arrow.BackgroundTransparency =
1

Arrow.Text =
"▲"

Arrow.Font =
Enum.Font.GothamBold

Arrow.TextColor3 =
Color3.fromRGB(
220,
190,
255
)

local ESPMenu =
Instance.new("Frame")

ESPMenu.Parent =
VisualsPage

ESPMenu.Visible =
false

ESPMenu.Position =
UDim2.new(
0,
10,
0,
50
)

ESPMenu.Size =
UDim2.new(
1,
-20,
0,
220
)

ESPMenu.BackgroundTransparency =
1
ESPMenu.ClipsDescendants = true
ESPMenu.Size = UDim2.new(1,-20,0,0)

-- BOOST FPS BUTTON
local BoostBtn =
Instance.new("TextButton")

BoostBtn.Parent =
VisualsPage

BoostBtn.Size =
UDim2.new(1,-20,0,35)

BoostBtn.Position =
UDim2.new(0,10,0,55) -- под ESP

BoostBtn.BackgroundColor3 =
Color3.fromRGB(220,190,255)

BoostBtn.Text =
"Boostfps"

BoostBtn.TextColor3 =
Color3.fromRGB(20,20,25)

BoostBtn.Font =
Enum.Font.GothamBold

Instance.new(
"UICorner",
BoostBtn
)

local BoostArrow =
Instance.new("TextLabel")

BoostArrow.Parent =
BoostBtn

BoostArrow.Size =
UDim2.new(0,20,1,0)

BoostArrow.Position =
UDim2.new(1,-25,0,0)

BoostArrow.BackgroundTransparency =
1

BoostArrow.Text =
"▼"

BoostArrow.Font =
Enum.Font.GothamBold

BoostArrow.TextColor3 =
Color3.fromRGB(220,190,255)

local BoostMenu =
Instance.new("Frame")

BoostMenu.Parent =
VisualsPage

BoostMenu.Visible =
false

BoostMenu.Position =
UDim2.new(0,10,0,95)

BoostMenu.Size =
UDim2.new(1,-20,0,260)

BoostMenu.BackgroundTransparency =
1

BoostMenu.ClipsDescendants = true
BoostMenu.Size = UDim2.new(1,-20,0,0)

local boostOpened = false


-- MISC BUTTON
local MiscBtn =
Instance.new("TextButton")

MiscBtn.Parent =
VisualsPage

MiscBtn.Size =
UDim2.new(1,-20,0,35)

MiscBtn.Position =
UDim2.new(0,10,0,95)

MiscBtn.BackgroundColor3 =
Color3.fromRGB(220,190,255)

MiscBtn.Text =
"Misc"

MiscBtn.TextColor3 =
Color3.fromRGB(20,20,25)

MiscBtn.Font =
Enum.Font.GothamBold

Instance.new(
"UICorner",
MiscBtn
)

local MiscArrow =
Instance.new("TextLabel")

MiscArrow.Parent =
MiscBtn

MiscArrow.Size =
UDim2.new(0,20,1,0)

MiscArrow.Position =
UDim2.new(1,-25,0,0)

MiscArrow.BackgroundTransparency =
1

MiscArrow.Text =
"▼"

MiscArrow.Font =
Enum.Font.GothamBold

MiscArrow.TextColor3 =
Color3.fromRGB(220,190,255)

local MiscMenu =
Instance.new("Frame")

MiscMenu.Parent =
VisualsPage

MiscMenu.Visible =
false

MiscMenu.Position =
UDim2.new(0,10,0,135)

MiscMenu.Size =
UDim2.new(1,-20,0,200)

MiscMenu.BackgroundTransparency =
1

MiscMenu.ClipsDescendants =
true

MiscMenu.Size =
UDim2.new(1,-20,0,0)

-- FOV CHANGER
local FOVLabel =
Instance.new("TextLabel")

FOVLabel.Parent =
MiscMenu

FOVLabel.Position =
UDim2.new(0,0,0,10)

FOVLabel.Size =
UDim2.new(1,0,0,25)

FOVLabel.BackgroundTransparency =
1

FOVLabel.Text =
"FOV: 70"

FOVLabel.TextColor3 =
Color3.fromRGB(
220,
190,
255
)

FOVLabel.Font =
Enum.Font.GothamBold

FOVLabel.TextXAlignment =
Enum.TextXAlignment.Left


local SliderBG =
Instance.new("Frame")

SliderBG.Parent =
MiscMenu

SliderBG.Size =
UDim2.new(
1,
-20,
0,
8
)

SliderBG.Position =
UDim2.new(
0,
10,
0,
40
)

SliderBG.BackgroundColor3 =
Color3.fromRGB(
50,
50,
60
)

Instance.new(
"UICorner",
SliderBG
)


local Fill =
Instance.new("Frame")

Fill.Parent =
SliderBG

Fill.Size =
UDim2.new(
0,
0,
1,
0
)

Fill.BackgroundColor3 =
Color3.fromRGB(
220,
190,
255
)

Instance.new(
"UICorner",
Fill
)


local Knob =
Instance.new("Frame")

Knob.Parent =
SliderBG

Knob.Size =
UDim2.new(
0,
16,
0,
16
)

Knob.Position =
UDim2.new(
0,
-8,
0.5,
-8
)

Knob.BackgroundColor3 =
Color3.new(
1,
1,
1
)

Instance.new(
"UICorner",
Knob
).CornerRadius =
UDim.new(
1,
0
)


local UIS =
game:GetService(
"UserInputService"
)

local Camera =
workspace.CurrentCamera

local dragging =
false

local minFOV =
70

local maxFOV =
120

local currentFOV =
70


local function updateSlider(x)

local percent =
math.clamp(
(
x -
SliderBG.AbsolutePosition.X
)
/
SliderBG.AbsoluteSize.X,
0,
1
)

Fill.Size =
UDim2.new(
percent,
0,
1,
0
)

Knob.Position =
UDim2.new(
percent,
-8,
0.5,
-8
)

currentFOV =
math.floor(
minFOV +
(
(maxFOV-minFOV)
*
percent
)
)

Camera.FieldOfView =
currentFOV

FOVLabel.Text =
"FOV: "
..
currentFOV

end


Knob.InputBegan:Connect(function(input)

if input.UserInputType ==
Enum.UserInputType.MouseButton1
or input.UserInputType ==
Enum.UserInputType.Touch then

dragging =
true

end

end)


UIS.InputEnded:Connect(function(input)

if input.UserInputType ==
Enum.UserInputType.MouseButton1
or input.UserInputType ==
Enum.UserInputType.Touch then

dragging =
false

end

end)


UIS.InputChanged:Connect(function(input)

if dragging
and (
input.UserInputType ==
Enum.UserInputType.MouseMovement
or
input.UserInputType ==
Enum.UserInputType.Touch
) then

updateSlider(
input.Position.X
)

end

end)

local HeadlessToggle,
HeadlessCircle =
createToggle(
	MiscMenu,
	"Headless",
	55
)

local headless =
false

HeadlessToggle.MouseButton1Click:Connect(function()

headless =
not headless

TweenService:Create(
HeadlessCircle,
TweenInfo.new(.2),
{
Position =
headless
and UDim2.new(1,-27,.5,-12)
or UDim2.new(0,3,.5,-12)
}
):Play()

local char =
game.Players.LocalPlayer.Character

if char then

local head =
char:FindFirstChild("Head")

if head then

head.Transparency =
headless and 1 or 0

for _,v in pairs(
head:GetChildren()
) do

if v:IsA("Decal") then

v.Transparency =
headless and 1 or 0

end

end

end

end

end)

local KorbloxToggle,
KorbloxCircle =
createToggle(
	MiscMenu,
	"Korblox",
	100
)

local korblox =
false

KorbloxToggle.MouseButton1Click:Connect(function()

korblox =
not korblox

TweenService:Create(
KorbloxCircle,
TweenInfo.new(.2),
{
Position =
korblox
and UDim2.new(1,-27,.5,-12)
or UDim2.new(0,3,.5,-12)
}
):Play()

local char =
game.Players.LocalPlayer.Character

if not char then
return
end

local leg =
char:FindFirstChild(
"Right Leg"
)
or
char:FindFirstChild(
"RightLowerLeg"
)

if leg then

leg.Transparency =
korblox and 1 or 0

end

end)

local miscOpened =
false

MiscBtn.MouseButton1Click:Connect(function()

miscOpened =
not miscOpened

TweenService:Create(
MiscArrow,
TweenInfo.new(.2),
{
Rotation =
miscOpened and 180 or 0
}
):Play()

MiscArrow.Text =
miscOpened and "▲"
or "▼"

MiscMenu.Visible =
true

TweenService:Create(
MiscMenu,
TweenInfo.new(.2),
{
Size =
miscOpened
and UDim2.new(1,-20,0,200)
or UDim2.new(1,-20,0,0)
}
):Play()

task.delay(.2,function()

if not miscOpened then
MiscMenu.Visible =
false
end

end)

end)

local espOpened =
false

local function updatePositions()

    local espHeight =
        espOpened and 170 or 0

    local boostHeight =
        boostOpened and 260 or 0

    -- BOOST
    TweenService:Create(
        BoostBtn,
        TweenInfo.new(.2),
        {
            Position = UDim2.new(
                0,10,0,
                55 + espHeight
            )
        }
    ):Play()

    TweenService:Create(
        BoostMenu,
        TweenInfo.new(.2),
        {
            Position = UDim2.new(
                0,10,0,
                95 + espHeight
            )
        }
    ):Play()


    -- MISC
    TweenService:Create(
        MiscBtn,
        TweenInfo.new(.2),
        {
            Position = UDim2.new(
                0,10,0,
                95 + espHeight + boostHeight
            )
        }
    ):Play()

    TweenService:Create(
        MiscMenu,
        TweenInfo.new(.2),
        {
            Position = UDim2.new(
                0,10,0,
                135 + espHeight + boostHeight
            )
        }
    ):Play()

end

BoostBtn.MouseButton1Click:Connect(function()

    boostOpened = not boostOpened

    TweenService:Create(
        BoostArrow,
        TweenInfo.new(.2),
        {
            Rotation = boostOpened and 180 or 0
        }
    ):Play()

    BoostArrow.Text =
        boostOpened and "▲" or "▼"

    BoostMenu.Visible = true

    TweenService:Create(
        BoostMenu,
        TweenInfo.new(.2),
        {
            Size =
                boostOpened
                and UDim2.new(1,-20,0,260)
                or UDim2.new(1,-20,0,0)
        }
    ):Play()

    TweenService:Create(
        BoostBtn,
        TweenInfo.new(.2),
        {
            Position =
                espOpened
                and UDim2.new(0,10,0,225)
                or UDim2.new(0,10,0,55)
        }
    ):Play()

    TweenService:Create(
        BoostMenu,
        TweenInfo.new(.2),
        {
            Position =
                espOpened
                and UDim2.new(0,10,0,265)
                or UDim2.new(0,10,0,95)
        }
    ):Play()

updatePositions()

end)

ESPBtn.MouseButton1Click:Connect(function()

    espOpened = not espOpened

    TweenService:Create(
        Arrow,
        TweenInfo.new(.2),
        {Rotation = espOpened and 180 or 0}
    ):Play()

    Arrow.Text =
        espOpened and "▲"
        or "▼"

    ESPMenu.Visible = true

    TweenService:Create(
        ESPMenu,
        TweenInfo.new(.2),
        {
            Size =
                espOpened
                and UDim2.new(1,-20,0,160)
                or UDim2.new(1,-20,0,0)
        }
    ):Play()

    task.delay(.2,function()
        if not espOpened then
            ESPMenu.Visible = false
        end
    end)

updatePositions()

end)

local BoostToggle,
BoostCircle =
createToggle(
BoostMenu,
"Boostfps",
0
)

BoostToggle.Parent =
BoostMenu

local SkinToggle,
SkinCircle =
createToggle(
BoostMenu,
"Skin Replacement",
40
)

SkinToggle.Parent =
BoostMenu

local boostFPS =
false

local skinReplace =
false

BoostToggle.MouseButton1Click:Connect(function()

boostFPS =
not boostFPS

TweenService:Create(
BoostCircle,
TweenInfo.new(.2),
{
Position =
boostFPS
and UDim2.new(1,-27,.5,-12)
or UDim2.new(0,3,.5,-12)
}
):Play()

TweenService:Create(
BoostToggle,
TweenInfo.new(.2),
{
BackgroundColor3 =
boostFPS
and Color3.fromRGB(
220,
190,
255
)
or Color3.fromRGB(
50,
50,
60
)
}
):Play()

if boostFPS then

for _,obj in pairs(
workspace:GetDescendants()
) do

if obj:IsA("Texture")
or obj:IsA("Decal") then

obj.Transparency =
1

end

if obj:IsA("BasePart") then

obj.Material =
Enum.Material.Plastic

obj.Reflectance =
0

end

end

end

end)

SkinToggle.MouseButton1Click:Connect(function()

skinReplace =
not skinReplace

TweenService:Create(
SkinCircle,
TweenInfo.new(.2),
{
Position =
skinReplace
and UDim2.new(1,-27,.5,-12)
or UDim2.new(0,3,.5,-12)
}
):Play()

TweenService:Create(
SkinToggle,
TweenInfo.new(.2),
{
BackgroundColor3 =
skinReplace
and Color3.fromRGB(
220,
190,
255
)
or Color3.fromRGB(
50,
50,
60
)
}
):Play()

for _,plr in pairs(
game.Players:GetPlayers()
) do

if plr ==
game.Players.LocalPlayer then
continue
end

local char =
plr.Character

if not char then
continue
end

if skinReplace then

for _,v in pairs(
char:GetDescendants()
) do

if v:IsA(
"MeshPart"
) then

v.MeshId =
""

v.Size =
Vector3.new(
1,
1,
1
)

end

end

end

end

end)

-- POTATO MODE
local PotatoToggle,
PotatoCircle =
createToggle(
BoostMenu,
"Potato Mode",
80
)

local potatoEnabled =
false

PotatoToggle.MouseButton1Click:Connect(function()

potatoEnabled =
not potatoEnabled

TweenService:Create(
PotatoCircle,
TweenInfo.new(.2),
{
Position =
potatoEnabled
and UDim2.new(1,-27,.5,-12)
or UDim2.new(0,3,.5,-12)
}
):Play()

TweenService:Create(
PotatoToggle,
TweenInfo.new(.2),
{
BackgroundColor3 =
potatoEnabled
and Color3.fromRGB(
220,
190,
255
)
or Color3.fromRGB(
50,
50,
60
)
}
):Play()

if potatoEnabled then

for _,obj in pairs(
workspace:GetDescendants()
) do

if obj:IsA(
"Texture"
)
or obj:IsA(
"Decal"
) then

obj.Transparency =
1

end

if obj:IsA(
"BasePart"
) then

obj.Material =
Enum.Material.SmoothPlastic

obj.Reflectance =
0

obj.CastShadow =
false

end

if obj:IsA(
"MeshPart"
) then

obj.TextureID =
""

obj.Material =
Enum.Material.Plastic

end

if obj:IsA(
"ParticleEmitter"
)
or obj:IsA(
"Trail"
)
or obj:IsA(
"Smoke"
)
or obj:IsA(
"Fire"
) then

obj.Enabled =
false

end

end

end

end)

-- REMOVING TEXTURES
local RemoveToggle,
RemoveCircle =
createToggle(
BoostMenu,
"Removing Textures",
120
)

local removeEnabled =
false

local RemoveTool

RemoveToggle.MouseButton1Click:Connect(function()

removeEnabled =
not removeEnabled

TweenService:Create(
RemoveCircle,
TweenInfo.new(.2),
{
Position =
removeEnabled
and UDim2.new(
1,
-27,
.5,
-12
)
or UDim2.new(
0,
3,
.5,
-12
)
}
):Play()

TweenService:Create(
RemoveToggle,
TweenInfo.new(.2),
{
BackgroundColor3 =
removeEnabled
and Color3.fromRGB(
220,
190,
255
)
or Color3.fromRGB(
50,
50,
60
)
}
):Play()

local player =
game.Players.LocalPlayer

if removeEnabled then

RemoveTool =
Instance.new(
"Tool"
)

RemoveTool.Name =
"Texture Remover"

RemoveTool.RequiresHandle =
false

RemoveTool.Parent =
player.Backpack

RemoveTool.Activated:Connect(function()

local mouse =
player:GetMouse()

local target =
mouse.Target

if not target then
return
end

for _,v in pairs(
target:GetDescendants()
) do

if v:IsA(
"Texture"
)
or v:IsA(
"Decal"
) then

v:Destroy()

end

end

if target:IsA(
"MeshPart"
) then

target.TextureID =
""

end

end)

else

if RemoveTool then

RemoveTool:Destroy()

RemoveTool =
nil

end

end

end)

-- FULLBRIGHT
local FullBrightToggle, FullBrightCircle =
createToggle(
BoostMenu,
"FullBright",
160
)

local fullbright = false
local oldLighting = {}

FullBrightToggle.MouseButton1Click:Connect(function()

fullbright = not fullbright

TweenService:Create(
FullBrightCircle,
TweenInfo.new(.2),
{
Position =
fullbright
and UDim2.new(1,-27,.5,-12)
or UDim2.new(0,3,.5,-12)
}
):Play()

TweenService:Create(
FullBrightToggle,
TweenInfo.new(.2),
{
BackgroundColor3 =
fullbright
and Color3.fromRGB(220,190,255)
or Color3.fromRGB(50,50,60)
}
):Play()

local Lighting =
game:GetService("Lighting")

if fullbright then

oldLighting.Brightness =    
Lighting.Brightness    

oldLighting.ClockTime =    
Lighting.ClockTime    

oldLighting.GlobalShadows =    
Lighting.GlobalShadows    

oldLighting.FogEnd =    
Lighting.FogEnd    

Lighting.Brightness = 3    
Lighting.ClockTime = 14    
Lighting.GlobalShadows = false    
Lighting.FogEnd = 999999

else

Lighting.Brightness =    
oldLighting.Brightness or 1    

Lighting.ClockTime =    
oldLighting.ClockTime or 14    

Lighting.GlobalShadows =    
oldLighting.GlobalShadows    

Lighting.FogEnd =    
oldLighting.FogEnd or 1000

end

end)

-- REMOVE EFFECTS
local EffectsToggle, EffectsCircle =
createToggle(
BoostMenu,
"Remove Effects",
200
)

local effectsEnabled =
false

EffectsToggle.MouseButton1Click:Connect(function()

effectsEnabled =
not effectsEnabled

TweenService:Create(
EffectsCircle,
TweenInfo.new(.2),
{
Position =
effectsEnabled
and UDim2.new(1,-27,.5,-12)
or UDim2.new(0,3,.5,-12)
}
):Play()

TweenService:Create(
EffectsToggle,
TweenInfo.new(.2),
{
BackgroundColor3 =
effectsEnabled
and Color3.fromRGB(
220,
190,
255
)
or Color3.fromRGB(
50,
50,
60
)
}
):Play()

for _,v in pairs(
game.Lighting:GetChildren()
) do

if v:IsA(
"BlurEffect"
)
or v:IsA(
"BloomEffect"
)
or v:IsA(
"ColorCorrectionEffect"
)
or v:IsA(
"SunRaysEffect"
)
or v:IsA(
"DepthOfFieldEffect"
)
or v:IsA(
"Atmosphere"
) then

v.Enabled =
not effectsEnabled

end

end

end)

local NameToggle,
NameCircle =
createToggle(
ESPMenu,
"ESP Name",
0
)

local OutlineToggle,
OutlineCircle =
createToggle(
ESPMenu,
"ESP Outline",
40
)

local nameESP =
false

local outlineESP =
false

NameToggle.MouseButton1Click:Connect(function()

nameESP =
not nameESP

TweenService:Create(
NameCircle,
TweenInfo.new(.2),
{
Position =
nameESP
and UDim2.new(1,-27,.5,-12)
or UDim2.new(0,3,.5,-12)
}
):Play()

TweenService:Create(
NameToggle,
TweenInfo.new(.2),
{
BackgroundColor3 =
nameESP
and Color3.fromRGB(
220,
190,
255
)
or Color3.fromRGB(
50,
50,
60
)
}
):Play()

end)

OutlineToggle.MouseButton1Click:Connect(function()

outlineESP =
not outlineESP

TweenService:Create(
OutlineCircle,
TweenInfo.new(.2),
{
Position =
outlineESP
and UDim2.new(1,-27,.5,-12)
or UDim2.new(0,3,.5,-12)
}
):Play()

TweenService:Create(
OutlineToggle,
TweenInfo.new(.2),
{
BackgroundColor3 =
outlineESP
and Color3.fromRGB(
220,
190,
255
)
or Color3.fromRGB(
50,
50,
60
)
}
):Play()

end)

-- ITEM ESP
local ItemToggle,
ItemCircle =
createToggle(
ESPMenu,
"Item ESP",
80
)

local itemESP =
false

ItemToggle.MouseButton1Click:Connect(function()

itemESP =
not itemESP

TweenService:Create(
ItemCircle,
TweenInfo.new(.2),
{
Position =
itemESP
and UDim2.new(1,-27,.5,-12)
or UDim2.new(0,3,.5,-12)
}
):Play()

TweenService:Create(
ItemToggle,
TweenInfo.new(.2),
{
BackgroundColor3 =
itemESP
and Color3.fromRGB(
220,
190,
255
)
or Color3.fromRGB(
50,
50,
60
)
}
):Play()

end)

task.spawn(function()

while task.wait(.5) do

for _,plr in pairs(
game.Players:GetPlayers()
) do

if plr == game.Players.LocalPlayer then
continue
end

-- ITEM ESP

if itemESP then

for _,obj in pairs(
workspace:GetDescendants()
) do

if obj:IsA("Tool")
or obj.Name:lower():find("gun")
or obj.Name:lower():find("key")
then

if not obj:FindFirstChild(
"ItemESP"
) then

local bb =
Instance.new(
"BillboardGui"
)

bb.Name =
"ItemESP"

bb.Size =
UDim2.new(
0,
100,
0,
30
)

bb.AlwaysOnTop =
true

bb.Adornee =
obj:FindFirstChildWhichIsA(
"BasePart"
)

bb.Parent =
obj

local txt =
Instance.new(
"TextLabel"
)

txt.Parent =
bb

txt.Size =
UDim2.new(1,0,1,0)

txt.BackgroundTransparency =
1

txt.Text =
obj.Name

txt.TextScaled =
true

txt.TextColor3 =
Color3.fromRGB(
220,
190,
255
)

end

end

end

end

local char =
plr.Character

if not char then
continue
end

local head =
char:FindFirstChild(
"Head"
)

local hrp =
char:FindFirstChild(
"HumanoidRootPart"
)

if not head
or not hrp then
continue
end

-- NAME ESP
if nameESP then

local gui =
head:FindFirstChild(
"ESP"
)

if not gui then

gui = Instance.new("BillboardGui")

gui.Name = "ESP"
gui.Size = UDim2.new(0,100,0,40)

gui.AlwaysOnTop = true
gui.StudsOffset = Vector3.new(0,2,0)

gui.Adornee = head
gui.Parent = head

local txt =
Instance.new("TextLabel")

txt.Name = "TXT"

txt.Parent = gui

txt.Size =
UDim2.new(
1,
0,
1,
0
)

txt.BackgroundTransparency =
1

txt.TextColor3 =
Color3.fromRGB(
220,
190,
255
)

txt.TextStrokeTransparency =
0

txt.TextStrokeColor3 =
Color3.new(
0,
0,
0
)

txt.Font =
Enum.Font.GothamBold

txt.TextScaled =
true

end

local player =
game.Players.LocalPlayer

local myChar =
player.Character

if myChar and myChar:FindFirstChild("HumanoidRootPart") then

local dist =
math.floor(
(
myChar.HumanoidRootPart.Position
-
hrp.Position
).Magnitude
)

gui.TXT.Text =
plr.Name..
"\n"..dist.."m"

end

else

local gui =
head:FindFirstChild(
"ESP"

)

if gui then
gui:Destroy()
end

end

-- OUTLINE ESP
if outlineESP then

local hl =
char:FindFirstChild("ESPHighlight")

if not hl then

hl =
Instance.new("Highlight")

hl.Name =
"ESPHighlight"

hl.FillColor =
Color3.fromRGB(
220,
190,
255
)

hl.FillTransparency =
0.7

hl.OutlineTransparency =
0

hl.OutlineColor =
Color3.fromRGB(
220,
190,
255
)

hl.DepthMode =
Enum.HighlightDepthMode.AlwaysOnTop

hl.OutlineColor =
Color3.fromRGB(
220,
190,
255
)

hl.Parent =
char

end

else

local hl =
char:FindFirstChild(
"ESPHighlight"
)

if hl then
hl:Destroy()
end

end

end

end

end)

local function createBtn(name,posY)

local btn =
Instance.new("TextButton")

btn.Parent =
ServerPage

btn.Size =
UDim2.new(1,-20,0,35)

btn.Position =
UDim2.new(0,10,0,posY)

btn.BackgroundColor3 =
Color3.fromRGB(220,190,255)

btn.BackgroundTransparency =
0.15

btn.Text =
"🖱 "..name

btn.Font =
Enum.Font.GothamBold

btn.TextColor3 =
Color3.new(1,1,1)

local c =
Instance.new("UICorner")
c.Parent = btn

return btn

end

local RejoinBtn =
createBtn(
"Rejoin",
10
)

local HopBtn =
createBtn(
"Server Hop",
55
)

local ListBtn =
createBtn(
"Servers Toggle",
100
)

local UIS =
game:GetService(
"UserInputService"
)

local ServerWidget =
Instance.new(
"TextButton"
)

ServerWidget.Parent =
ScreenGui

ServerWidget.Visible =
false

ServerWidget.Size =
UDim2.new(
0,
95,
0,
30
)

ServerWidget.Position =
UDim2.new(
0.5,
-90,
0,
20
)

ServerWidget.BackgroundColor3 =
Color3.fromRGB(
25,
25,
30
)

ServerWidget.BackgroundTransparency =
0.2

ServerWidget.Text =
"● Servers"

ServerWidget.TextSize =
14

ServerWidget.TextColor3 =
Color3.fromRGB(
220,
190,
255
)

local ServerCorner =
Instance.new("UICorner")

ServerCorner.Parent =
ServerWidget

ServerCorner.CornerRadius =
UDim.new(
1,
0
)

local widgetStroke =
Instance.new("UIStroke")

widgetStroke.Parent =
ServerWidget

widgetStroke.ApplyStrokeMode =
Enum.ApplyStrokeMode.Border

widgetStroke.Color =
Color3.fromRGB(
220,
190,
255
)

widgetStroke.Thickness =
1.5

widgetStroke.Transparency =
0.15

local dragging = false
local dragStart
local startPos

ServerWidget.InputBegan:Connect(function(input)

if input.UserInputType ==
Enum.UserInputType.MouseButton1
or input.UserInputType ==
Enum.UserInputType.Touch then

dragging = true    
dragStart = input.Position    
startPos = ServerWidget.Position    


input.Changed:Connect(function()    

	if input.UserInputState ==    
	Enum.UserInputState.End then    

		dragging =    
		false    

	end    

end)

end

end)

UIS.InputChanged:Connect(function(input)

if dragging then

local delta =    
input.Position -    
dragStart    


ServerWidget.Position =    
UDim2.new(    

	startPos.X.Scale,    

	startPos.X.Offset +    
	delta.X,    

	startPos.Y.Scale,    

	startPos.Y.Offset +    
	delta.Y    

)

end

end)

UIS.InputEnded:Connect(function(input)

if input.UserInputType ==
Enum.UserInputType.MouseButton1 then

dragging =    
false

end

end)

local ServerMenu =
Instance.new("Frame")

ServerMenu.Parent =
ScreenGui

ServerMenu.Visible =
false

ServerMenu.Size =
UDim2.new(
0,
420,
0,
300
)

ServerMenu.Position =
UDim2.new(
0.5,
-210,
0.5,
-150
)

ServerMenu.BackgroundColor3 =
Color3.fromRGB(
20,
20,
25
)

ServerMenu.BackgroundTransparency =
0.15

Instance.new(
"UICorner",
ServerMenu
)

local menuStroke =
Instance.new(
"UIStroke"
)

menuStroke.Parent =
ServerMenu

menuStroke.Color =
Color3.fromRGB(
220,
190,
255
)

local menuDragging = false
local menuDragStart
local menuStartPos

ServerMenu.InputBegan:Connect(function(input)

if input.UserInputType ==
Enum.UserInputType.MouseButton1
or input.UserInputType ==
Enum.UserInputType.Touch then

menuDragging = true    
menuDragStart = input.Position    
menuStartPos = ServerMenu.Position    

input.Changed:Connect(function()    

	if input.UserInputState ==    
	Enum.UserInputState.End then    

		menuDragging = false    

	end    

end)

end

end)

UIS.InputChanged:Connect(function(input)

if menuDragging then

local delta =    
input.Position -    
menuDragStart    


ServerMenu.Position =    
UDim2.new(    

	menuStartPos.X.Scale,    

	menuStartPos.X.Offset +    
	delta.X,    

	menuStartPos.Y.Scale,    

	menuStartPos.Y.Offset +    
	delta.Y    

)

end

end)

ServerWidget.MouseButton1Click:Connect(function()

ServerMenu.Visible =
not ServerMenu.Visible

end)

local sortLow=true

local Sort=
Instance.new(
"TextButton"
)

Sort.Parent=
ServerMenu

Sort.Text=
"↓↑"

Sort.Position=
UDim2.new(
1,
-90,
0,
5
)

Sort.MouseButton1Click:Connect(function()

sortLow=
not sortLow

end)

local ServerClose =
Instance.new(
"TextButton"
)

ServerClose.Parent =
ServerMenu

ServerClose.Size =
UDim2.new(
0,
25,
0,
25
)

ServerClose.Position =
UDim2.new(
1,
-30,
0,
5
)

ServerClose.BackgroundTransparency =
1

ServerClose.Text =
"X"

ServerClose.TextColor3 =
Color3.new(
1,
1,
1
)

ServerClose.Font =
Enum.Font.GothamBold

ServerClose.MouseButton1Click:Connect(function()

ServerMenu.Visible =
false

end)

local ServerMin =
Instance.new(
"TextButton"
)

ServerMin.Parent =
ServerMenu

ServerMin.Size =
UDim2.new(
0,
25,
0,
25
)

ServerMin.Position =
UDim2.new(
1,
-60,
0,
5
)

ServerMin.BackgroundTransparency =
1

ServerMin.Text =
"-"

ServerMin.TextColor3 =
Color3.new(
1,
1,
1
)

ServerMin.Font =
Enum.Font.GothamBold

local serverMinimized =
false

local List =
Instance.new(
"ScrollingFrame"
)

List.Parent =
ServerMenu

List.Position =
UDim2.new(
0,
10,
0,
40
)

List.Size =
UDim2.new(
1,
-20,
1,
-50
)

List.CanvasSize =
UDim2.new(
0,
0,
0,
0
)

List.BackgroundTransparency =
1

List.ScrollBarThickness =
4

local layout =
Instance.new(
"UIListLayout"
)

layout.Parent =
List

layout.Padding = UDim.new(0,5)

layout:GetPropertyChangedSignal(
"AbsoluteContentSize"
):Connect(function()

List.CanvasSize =
UDim2.new(
0,
0,
0,
layout.AbsoluteContentSize.Y + 10
)

end)

ServerMin.MouseButton1Click:Connect(function()

serverMinimized =
not serverMinimized

if serverMinimized then

List.Visible =    
false    

ServerMenu:TweenSize(    

	UDim2.new(    
	0,    
	420,    
	0,    
	35    
	),    

	Enum.EasingDirection.Out,    

	Enum.EasingStyle.Quad,    

	0.2,    

	true    

)

else

List.Visible =    
true    


ServerMenu:TweenSize(    

	UDim2.new(    
	0,    
	420,    
	0,    
	300    
	),    

	Enum.EasingDirection.Out,    

	Enum.EasingStyle.Quad,    

	0.2,    

	true    

)

end

end)

local HttpService = game:GetService("HttpService")
local servers = {}

local success, result = pcall(function()

return HttpService:JSONDecode(
game:HttpGet(
"https://games.roblox.com/v1/games/"
..game.PlaceId..
"/servers/Public?sortOrder=Asc&limit=100"
)
)

end)

if success and result and result.data then

servers = result.data

print("Loaded:", #servers)

else

warn("Ошибка загрузки серверов")

end

table.sort(
servers,

function(a,b)

if sortLow then
return a.playing < b.playing
else
return a.playing > b.playing
end

end)

for _,srv in pairs(servers) do

-- пропускаем только фулловые
if srv.playing >= srv.maxPlayers then
continue
end

print(
"Server:",
srv.id,
"Players:",
srv.playing.."/"..srv.maxPlayers
)

local holder = Instance.new("Frame")
holder.Parent = List
holder.Size = UDim2.new(1,0,0,40)
holder.BackgroundTransparency = 1

local players = Instance.new("TextLabel")
players.Parent = holder
players.Size = UDim2.new(0.6,0,1,0)
players.BackgroundTransparency = 1
players.Text =
srv.playing.." / "..srv.maxPlayers.." players"

players.Font =
Enum.Font.GothamBold

players.TextColor3 =
Color3.fromRGB(255,255,255)

players.TextSize =
14

players.TextXAlignment =
Enum.TextXAlignment.Left

local join =
Instance.new("TextButton")

join.Parent =
holder

join.Size =
UDim2.new(0,75,0,26)

join.Position =
UDim2.new(1,-80,0.5,-13)

join.Text =
"Join"

join.Font =
Enum.Font.GothamBold

join.TextColor3 =
Color3.new(1,1,1)

join.BackgroundColor3 =
Color3.fromRGB(220,190,255)

join.BackgroundTransparency =
.15

join.BorderSizePixel =
0

local corner =
Instance.new("UICorner")

corner.Parent =
join

corner.CornerRadius =
UDim.new(0,8)

join.MouseButton1Click:Connect(function()

game:GetService("TeleportService")    
:TeleportToPlaceInstance(    
    game.PlaceId,    
    srv.id,    
    player    
)

end)

end

task.wait()

List.CanvasSize =
UDim2.new(
0,
0,
0,
layout.AbsoluteContentSize.Y + 10
)

-- TOGGLE SWITCH
local ToggleBG = Instance.new("TextButton")
ToggleBG.Text = ""
ToggleBG.AutoButtonColor = false
ToggleBG.Parent = ServerPage
ToggleBG.Size = UDim2.new(0,60,0,30)
ToggleBG.Position = UDim2.new(1,-75,0,102)
ToggleBG.BackgroundColor3 =
Color3.fromRGB(50,50,60)
ToggleBG.BorderSizePixel = 0

local ToggleCorner =
Instance.new("UICorner")
ToggleCorner.Parent =
ToggleBG
ToggleCorner.CornerRadius =
UDim.new(1,0)

local ToggleCircle =
Instance.new("Frame")
ToggleCircle.Parent =
ToggleBG
ToggleCircle.Size =
UDim2.new(0,24,0,24)
ToggleCircle.Position =
UDim2.new(0,3,0.5,-12)
ToggleCircle.BackgroundColor3 =
Color3.new(1,1,1)
ToggleCircle.BorderSizePixel =
0

local CircleCorner =
Instance.new("UICorner")
CircleCorner.Parent =
ToggleCircle
CircleCorner.CornerRadius =
UDim.new(1,0)

local toggleEnabled = false

local function updateToggle()

if toggleEnabled then

if ServerWidget then    
	ServerWidget.Visible = true    
end    

TweenService:Create(    
	ToggleCircle,    
	TweenInfo.new(.2),    
	{    
		Position = UDim2.new(1,-27,0.5,-12)    
	}    
):Play()    

TweenService:Create(    
	ToggleBG,    
	TweenInfo.new(.2),    
	{    
		BackgroundColor3 =    
		Color3.fromRGB(220,190,255)    
	}    
):Play()

else

if ServerWidget then    
	ServerWidget.Visible = false    
end    

if ServerMenu then    
	ServerMenu.Visible = false    
end    

TweenService:Create(    
	ToggleCircle,    
	TweenInfo.new(.2),    
	{    
		Position = UDim2.new(0,3,0.5,-12)    
	}    
):Play()    

TweenService:Create(    
	ToggleBG,    
	TweenInfo.new(.2),    
	{    
		BackgroundColor3 =    
		Color3.fromRGB(50,50,60)    
	}    
):Play()

end

end

ToggleBG.MouseButton1Click:Connect(function()
toggleEnabled = not toggleEnabled
updateToggle()
end)

local player =
game.Players.LocalPlayer

RejoinBtn.MouseButton1Click:Connect(function()

game:GetService(
"TeleportService"
):Teleport(
game.PlaceId,
player
)

end)

HopBtn.MouseButton1Click:Connect(function()

local servers=
game:GetService(
"HttpService"
):JSONDecode(
game:HttpGet(
"https://games.roblox.com/v1/games/"
..game.PlaceId..
"/servers/Public?limit=100"
)
)

for _,v in pairs(
servers.data
) do

if v.playing <
v.maxPlayers then

game:GetService(
"TeleportService"
):TeleportToPlaceInstance(
game.PlaceId,
v.id,
player
)

break
end

end

end)

-- PLAYER CARD
local PlayerCard = Instance.new("Frame")
PlayerCard.Parent = HomePage
PlayerCard.Size = UDim2.new(1,-10,0,80)
PlayerCard.BackgroundColor3 = Color3.fromRGB(220,190,255)
PlayerCard.BackgroundTransparency = .15
PlayerCard.BorderSizePixel = 0

local PCCorner = Instance.new("UICorner")
PCCorner.Parent = PlayerCard
PCCorner.CornerRadius = UDim.new(0,10)

local Avatar = Instance.new("ImageLabel")
Avatar.Parent = PlayerCard
Avatar.Size = UDim2.new(0,55,0,55)
Avatar.Position = UDim2.new(0,10,0.5,-27)
Avatar.BackgroundTransparency = 1

local player = game.Players.LocalPlayer

Avatar.Image =
game.Players:GetUserThumbnailAsync(
player.UserId,
Enum.ThumbnailType.HeadShot,
Enum.ThumbnailSize.Size420x420
)

local Welcome = Instance.new("TextLabel")
Welcome.Parent = PlayerCard
Welcome.Position = UDim2.new(0,75,0,20)
Welcome.Size = UDim2.new(1,-80,0,30)
Welcome.BackgroundTransparency = 1
Welcome.Text =
"Welcome, "..player.Name

Welcome.Font =
Enum.Font.GothamBold

Welcome.TextColor3 =
Color3.fromRGB(255,255,255)

Welcome.TextXAlignment =
Enum.TextXAlignment.Left

Welcome.TextSize = 18

-- STATUS MENU
local Status = Instance.new("Frame")
Status.Parent = HomePage
Status.Position = UDim2.new(0,0,0,95)
Status.Size = UDim2.new(1,-10,0,160)
Status.BackgroundColor3 =
Color3.fromRGB(220,190,255)

Status.BackgroundTransparency=.15
Status.BorderSizePixel=0

local SCorner =
Instance.new("UICorner")

SCorner.Parent=
Status

SCorner.CornerRadius=
UDim.new(0,10)

local StatusTitle =
Instance.new("TextLabel")

StatusTitle.Parent=
Status

StatusTitle.Text="Status"

StatusTitle.Position=
UDim2.new(0,10,0,5)

StatusTitle.Size=
UDim2.new(1,0,0,20)

StatusTitle.BackgroundTransparency=1

StatusTitle.TextColor3=
Color3.fromRGB(255,255,255)

StatusTitle.Font=
Enum.Font.GothamBold

StatusTitle.TextXAlignment=
Enum.TextXAlignment.Left

local Game =
Instance.new("TextLabel")

local FPS =
Instance.new("TextLabel")

local Ping =
Instance.new("TextLabel")

local Players =
Instance.new("TextLabel")

local labels={
Game,FPS,Ping,Players
}

for i,v in pairs(labels) do

v.Parent=Status

v.Position=
UDim2.new(
0,
10,
0,
30+(i*25)
)

v.Size=
UDim2.new(
1,-20,
0,20
)

v.BackgroundTransparency=1

v.TextColor3=
Color3.fromRGB(
255,255,255
)

v.Font=
Enum.Font.Gotham

v.TextXAlignment=
Enum.TextXAlignment.Left

end

Game.Text=
"Game     "
..
game:GetService(
"MarketplaceService"
):GetProductInfo(
game.PlaceId
).Name

task.spawn(function()

while true do

FPS.Text=
"FPS     "
..
math.floor(
workspace:GetRealPhysicsFPS()
)

local ping=
math.floor(
game:GetService(
"Stats"
).Network.ServerStatsItem[
"Data Ping"
]:GetValue()
)

Ping.Text=
"Ping     "
..
ping.." ms"

Players.Text=
"Players     "
..
#game.Players:GetPlayers()

task.wait(.5)

end

end)

-- Открыт ли раздел Home
local opened = false

HomeBtn.MouseButton1Click:Connect(function()

if minimized then return end

opened = not opened

HomePage.Visible = opened

if opened then
ServerPage.Visible = false
serverOpened = false
end

end)

local serverOpened = false

ServerBtn.MouseButton1Click:Connect(function()

if minimized then return end

serverOpened = not serverOpened

ServerPage.Visible = serverOpened

-- закрывать Home при открытии Server
if serverOpened then
HomePage.Visible = false
VisualsPage.Visible =

false

ESPMenu.Visible =
false

espOpened =
false

Arrow.Text =
"▶"
opened = false
end

end)

local visualsOpened =
false

VisualsBtn.MouseButton1Click:Connect(function()

visualsOpened =
not visualsOpened

VisualsPage.Visible =
visualsOpened

if visualsOpened then

HomePage.Visible =
false

ServerPage.Visible =
false

opened =
false

serverOpened =
false

end

end)

local tpOpened =
false

TeleportBtn.MouseButton1Click:Connect(function()

tpOpened =
not tpOpened

TeleportPage.Visible =
tpOpened

HomePage.Visible =
false

ServerPage.Visible =
false

VisualsPage.Visible =
false

end)

local combatOpened =
false

CombatBtn.MouseButton1Click:Connect(function()

combatOpened =
not combatOpened

CombatPage.Visible =
combatOpened

HomePage.Visible =
false

ServerPage.Visible =
false

VisualsPage.Visible =
false

TeleportPage.Visible =
false

opened =
false

serverOpened =
false

visualsOpened =
false

tpOpened =
false

end)

local Title = Instance.new("TextLabel")

local InjectorTag = Instance.new("TextLabel")
local InjectorCorner = Instance.new("UICorner")

local executor = "Unknown"

pcall(function()
if identifyexecutor then
executor = identifyexecutor()
elseif getexecutorname then
executor = getexecutorname()
end
end)

InjectorTag.Parent = Frame
InjectorTag.Size = UDim2.new(0, 90, 0, 20)
InjectorTag.Position = UDim2.new(1, -145, 0, 6) -- рядом с "-"
InjectorTag.BackgroundColor3 = Color3.fromRGB(220,190,255)
InjectorTag.BorderSizePixel = 0
InjectorTag.Text = executor
InjectorTag.TextColor3 = Color3.fromRGB(20,20,25)
InjectorTag.TextSize = 11
InjectorTag.Font = Enum.Font.GothamBold

InjectorCorner.Parent = InjectorTag
InjectorCorner.CornerRadius = UDim.new(0,8)

Title.Parent = Frame
Title.Size = UDim2.new(0, 180, 0, 30)
Title.Position = UDim2.new(0, 12, 0, 4)
Title.BackgroundTransparency = 1
Title.Text = "SEPTUS HUB"
Title.TextColor3 = Color3.fromRGB(220, 190, 255) -- светло-фиолетовый
Title.TextSize = 20
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left

-- кнопка сворачивания
MinBtn.Parent = Frame
MinBtn.Size = UDim2.new(0, 20, 0, 20)
MinBtn.Position = UDim2.new(1, -50, 0, 6)
MinBtn.Text = "-"
MinBtn.TextColor3 = Color3.fromRGB(255,255,255)
MinBtn.TextSize = 18
MinBtn.Font = Enum.Font.Gotham
MinBtn.BackgroundTransparency = 1
MinBtn.BorderSizePixel = 0

local minimized = false

MinBtn.MouseButton1Click:Connect(function()

minimized = not minimized

if minimized then

Frame:TweenSize(    
	UDim2.new(0,437,0,35),    
	Enum.EasingDirection.Out,    
	Enum.EasingStyle.Quad,    
	0.2,    
	true    
)    

HomeBtn.Visible = false    
HomePage.Visible = false    
SideBar.Visible = false    
opened = false

ServerBtn.Visible=false
ServerPage.Visible=false
VisualsPage.Visible =
false

ESPMenu.Visible =
false

espOpened =
false

Arrow.Rotation =
0

Arrow.Text =
"▶"
VisualsBtn.Visible=false
VisualsPage.Visible=false
TeleportBtn.Visible =
false

TeleportPage.Visible =
false

CombatBtn.Visible =
false

CombatPage.Visible =
false

else

Frame:TweenSize(    
	UDim2.new(0,437,0,238),    
	Enum.EasingDirection.Out,    
	Enum.EasingStyle.Quad,    
	0.2,    
	true    
)    

HomeBtn.Visible = true    
SideBar.Visible = true

ServerBtn.Visible=true
VisualsBtn.Visible=true
TeleportBtn.Visible =
true
CombatBtn.Visible =
true

end

end)

-- кнопка закрытия
CloseBtn.Parent = Frame
CloseBtn.Size = UDim2.new(0, 20, 0, 20)
CloseBtn.Position = UDim2.new(1, -25, 0, 6)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255,255,255)
CloseBtn.TextSize = 14
CloseBtn.Font = Enum.Font.Gotham
CloseBtn.BackgroundTransparency = 1
CloseBtn.BorderSizePixel = 0

-- закрыть GUI
CloseBtn.MouseButton1Click:Connect(function()
ScreenGui:Destroy()
end)

-- Кнопка SH (отдельно от GUI)
local UserInputService = game:GetService("UserInputService")

local ToggleBtn = Instance.new("TextButton")
local ToggleCorner = Instance.new("UICorner")
local ToggleStroke = Instance.new("UIStroke")

ToggleBtn.Parent = ScreenGui
ToggleBtn.Size = UDim2.new(0,50,0,50)
ToggleBtn.Position = UDim2.new(0,50,0.5,-25)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(220,190,255)
ToggleBtn.Text = "SH"
ToggleBtn.TextColor3 = Color3.fromRGB(20,20,25)
ToggleBtn.TextSize = 20
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.Visible = false
ToggleBtn.BorderSizePixel = 0

ToggleCorner.Parent = ToggleBtn
ToggleCorner.CornerRadius = UDim.new(0,12)

ToggleStroke.Parent = ToggleBtn
ToggleStroke.Color = Color3.fromRGB(240,220,255)
ToggleStroke.Thickness = 1.2

-- показать кнопку после загрузки
task.spawn(function()
repeat task.wait() until Frame.Visible
ToggleBtn.Visible = true
end)

-- скрыть / показать GUI
local guiVisible = true

ToggleBtn.MouseButton1Click:Connect(function()
guiVisible = not guiVisible
Frame.Visible = guiVisible
end)

-- перетаскивание кнопки
local dragging = false
local dragStart
local startPos
local dragInput

ToggleBtn.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1
or input.UserInputType == Enum.UserInputType.Touch then

dragging = true
dragStart = input.Position
startPos = ToggleBtn.Position

input.Changed:Connect(function()    
	if input.UserInputState == Enum.UserInputState.End then    
		dragging = false    
	end    
end)

end

end)

ToggleBtn.InputChanged:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseMovement
or input.UserInputType == Enum.UserInputType.Touch then
dragInput = input
end
end)

UserInputService.InputChanged:Connect(function(input)
if dragging and input == dragInput then

local delta = input.Position - dragStart

ToggleBtn.Position = UDim2.new(    
	startPos.X.Scale,    
	startPos.X.Offset + delta.X,    
	startPos.Y.Scale,    
	startPos.Y.Offset + delta.Y    
)

end

end)
