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

local data =
game:GetService(
"HttpService"
):JSONDecode(

game:HttpGet(

"https://games.roblox.com/v1/games/"
..
game.PlaceId
..
"/servers/Public?limit=50"

))

local servers =
data.data

print("Всего серверов:", #servers)

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

    -- пропускаем только пустые и фулл
    if srv.playing <= 1 or srv.playing >= srv.maxPlayers then
        continue
    end

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

List.CanvasSize =
UDim2.new(
0,
0,
0,
layout.AbsoluteContentSize.Y
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
		opened = false
	end

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
