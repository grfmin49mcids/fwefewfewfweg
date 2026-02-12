--[[
    ████████╗██╗████████╗ █████╗ ███╗   ██╗██╗██╗   ██╗███╗   ███╗
    ╚══██╔══╝██║╚══██╔══╝██╔══██╗████╗  ██║██║██║   ██║████╗ ████║
       ██║   ██║   ██║   ███████║██╔██╗ ██║██║██║   ██║██╔████╔██║
       ██║   ██║   ██║   ██╔══██║██║╚██╗██║██║██║   ██║██║╚██╔╝██║
       ██║   ██║   ██║   ██║  ██║██║ ╚████║██║╚██████╔╝██║ ╚═╝ ██║
       ╚═╝   ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═╝     ╚═╝
    
    TITANIUM LOADER v4.0 PREMIUM
    High-Performance Roblox Cheat Engine
    Enhanced UI with Glow Effects, Animations & Modern Design
]]

print(">>> TITANIUM PREMIUM LOADER v4.0 <<<")

local UI = (function()
    --[[
        TITANIUM UI LIBRARY v4.0 PREMIUM
        "The pinnacle of high-performance interfaces."
    ]]

    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local CoreGui = game:GetService("CoreGui")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer

    local Titanium = {}
    Titanium.__index = Titanium

    -- PREMIUM THEME with Glow Colors
    local THEME = {
        -- Core Colors
        Main = Color3.fromRGB(12, 12, 16),
        Secondary = Color3.fromRGB(18, 18, 24),
        Tertiary = Color3.fromRGB(24, 24, 32),
        
        -- Accent Colors (Neon Cyan)
        Accent = Color3.fromRGB(0, 170, 255),
        AccentDark = Color3.fromRGB(0, 120, 200),
        AccentGlow = Color3.fromRGB(0, 200, 255),
        
        -- Text
        Text = Color3.fromRGB(245, 245, 250),
        TextDark = Color3.fromRGB(140, 145, 160),
        TextMuted = Color3.fromRGB(80, 85, 100),
        
        -- Borders & Strokes
        Stroke = Color3.fromRGB(35, 38, 48),
        StrokeLight = Color3.fromRGB(50, 55, 70),
        StrokeAccent = Color3.fromRGB(0, 100, 160),
        
        -- Status Colors
        Success = Color3.fromRGB(0, 255, 140),
        SuccessGlow = Color3.fromRGB(0, 255, 180),
        Warning = Color3.fromRGB(255, 200, 0),
        Error = Color3.fromRGB(255, 70, 70),
        ErrorGlow = Color3.fromRGB(255, 100, 100),
        
        -- Gradient Colors
        GradientStart = Color3.fromRGB(0, 140, 255),
        GradientEnd = Color3.fromRGB(120, 0, 255),
        
        -- Special
        Shadow = Color3.fromRGB(0, 0, 0),
        Highlight = Color3.fromRGB(255, 255, 255)
    }

    -- Smooth Tween Presets
    local TWEENS = {
        Fast = TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
        Normal = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
        Smooth = TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
        Bounce = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        Spring = TweenInfo.new(0.6, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out),
        Glow = TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
        Pulse = TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
    }

    local function Create(class, props)
        local obj = Instance.new(class)
        for k, v in pairs(props) do
            if k ~= "Parent" then
                obj[k] = v
            end
        end
        if props.Parent then
            obj.Parent = props.Parent
        end
        return obj
    end

    local function Tween(obj, info, props)
        local tween = TweenService:Create(obj, info, props)
        tween:Play()
        return tween
    end

    -- Create Glow Effect
    local function CreateGlow(parent, color, transparency)
        local glow = Create("ImageLabel", {
            Name = "Glow",
            Size = UDim2.new(1, 60, 1, 60),
            Position = UDim2.new(0.5, 0, 0.5, 0),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundTransparency = 1,
            Image = "rbxassetid://5028857084",
            ImageColor3 = color or THEME.Accent,
            ImageTransparency = transparency or 0.7,
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(24, 24, 276, 276),
            ZIndex = -1,
            Parent = parent
        })
        return glow
    end

    -- Create Gradient
    local function CreateGradient(parent, startColor, endColor, rotation)
        local gradient = Create("UIGradient", {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, startColor or THEME.GradientStart),
                ColorSequenceKeypoint.new(1, endColor or THEME.GradientEnd)
            }),
            Rotation = rotation or 45,
            Parent = parent
        })
        return gradient
    end

    -- Pulsing Glow Animation
    local function PulseGlow(glowObj, minTrans, maxTrans)
        task.spawn(function()
            while glowObj and glowObj.Parent do
                Tween(glowObj, TWEENS.Glow, {ImageTransparency = minTrans or 0.5})
                task.wait(1.5)
                if not glowObj or not glowObj.Parent then break end
                Tween(glowObj, TWEENS.Glow, {ImageTransparency = maxTrans or 0.8})
                task.wait(1.5)
            end
        end)
    end

    -- Ripple Effect on Click
    local function CreateRipple(parent, position)
        local ripple = Create("Frame", {
            Name = "Ripple",
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0, position.X - parent.AbsolutePosition.X, 0, position.Y - parent.AbsolutePosition.Y),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = THEME.Accent,
            BackgroundTransparency = 0.7,
            ZIndex = 10,
            Parent = parent
        })
        Create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = ripple})
        
        local maxSize = math.max(parent.AbsoluteSize.X, parent.AbsoluteSize.Y) * 2
        Tween(ripple, TweenInfo.new(0.5, Enum.EasingStyle.Quart), {
            Size = UDim2.new(0, maxSize, 0, maxSize),
            BackgroundTransparency = 1
        })
        
        task.delay(0.5, function()
            if ripple then ripple:Destroy() end
        end)
    end

    function Titanium.new()
        local self = setmetatable({}, Titanium)

        self.ScreenGui = Create("ScreenGui", {
            Name = "TitaniumPremium_" .. math.random(10000, 99999),
            ResetOnSpawn = false,
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
            IgnoreGuiInset = true,
            Parent = (gethui and gethui()) or (syn and syn.protect_gui and CoreGui) or LocalPlayer:WaitForChild("PlayerGui")
        })

        self.NotificationContainer = Create("Frame", {
            Name = "Notifications",
            Size = UDim2.new(0, 340, 1, 0),
            Position = UDim2.new(1, -360, 0, 0),
            BackgroundTransparency = 1,
            Parent = self.ScreenGui
        })
        
        Create("UIListLayout", {
            Padding = UDim.new(0, 10),
            VerticalAlignment = Enum.VerticalAlignment.Bottom,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Parent = self.NotificationContainer
        })
        Create("UIPadding", {
            PaddingBottom = UDim.new(0, 20),
            Parent = self.NotificationContainer
        })

        return self
    end

    -- PREMIUM NOTIFICATION SYSTEM
    function Titanium:Notify(title, text, duration, notifType)
        notifType = notifType or "info"
        
        local accentColor = THEME.Accent
        local glowColor = THEME.AccentGlow
        local icon = "🔔"
        
        if notifType == "success" then
            accentColor = THEME.Success
            glowColor = THEME.SuccessGlow
            icon = "✓"
        elseif notifType == "error" then
            accentColor = THEME.Error
            glowColor = THEME.ErrorGlow
            icon = "✕"
        elseif notifType == "warning" then
            accentColor = THEME.Warning
            glowColor = THEME.Warning
            icon = "⚠"
        elseif notifType == "toggle_on" then
            accentColor = THEME.Success
            glowColor = THEME.SuccessGlow
            icon = "◉"
        elseif notifType == "toggle_off" then
            accentColor = THEME.Error
            glowColor = THEME.ErrorGlow
            icon = "○"
        end

        local NotifFrame = Create("Frame", {
            Name = "Notification",
            Size = UDim2.new(1, 0, 0, 0),
            BackgroundColor3 = THEME.Secondary,
            BackgroundTransparency = 0.05,
            BorderSizePixel = 0,
            ClipsDescendants = true,
            Parent = self.NotificationContainer
        })

        Create("UICorner", {CornerRadius = UDim.new(0, 10), Parent = NotifFrame})
        
        local stroke = Create("UIStroke", {
            Color = accentColor,
            Thickness = 1.5,
            Transparency = 0.5,
            Parent = NotifFrame
        })

        -- Glow Effect
        local glow = CreateGlow(NotifFrame, glowColor, 0.85)
        
        -- Accent Bar with Gradient
        local AccentBar = Create("Frame", {
            Size = UDim2.new(0, 4, 1, 0),
            BackgroundColor3 = accentColor,
            BorderSizePixel = 0,
            Parent = NotifFrame
        })
        Create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = AccentBar})

        -- Icon Container
        local IconContainer = Create("Frame", {
            Size = UDim2.new(0, 36, 0, 36),
            Position = UDim2.new(0, 14, 0.5, -18),
            BackgroundColor3 = accentColor,
            BackgroundTransparency = 0.85,
            Parent = NotifFrame
        })
        Create("UICorner", {CornerRadius = UDim.new(0, 8), Parent = IconContainer})
        
        Create("TextLabel", {
            Text = icon,
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            TextColor3 = accentColor,
            Font = Enum.Font.GothamBold,
            TextSize = 18,
            Parent = IconContainer
        })

        -- Title
        Create("TextLabel", {
            Text = title,
            Font = Enum.Font.GothamBold,
            TextSize = 14,
            TextColor3 = THEME.Text,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 60, 0, 12),
            Size = UDim2.new(1, -70, 0, 18),
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = NotifFrame
        })

        -- Description
        Create("TextLabel", {
            Text = text,
            Font = Enum.Font.Gotham,
            TextSize = 12,
            TextColor3 = THEME.TextDark,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 60, 0, 32),
            Size = UDim2.new(1, -70, 0, 16),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextWrapped = true,
            Parent = NotifFrame
        })

        -- Progress Bar
        local ProgressBg = Create("Frame", {
            Size = UDim2.new(1, -20, 0, 3),
            Position = UDim2.new(0, 10, 1, -8),
            BackgroundColor3 = THEME.Main,
            BorderSizePixel = 0,
            Parent = NotifFrame
        })
        Create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = ProgressBg})

        local ProgressFill = Create("Frame", {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundColor3 = accentColor,
            BorderSizePixel = 0,
            Parent = ProgressBg
        })
        Create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = ProgressFill})
        CreateGradient(ProgressFill, accentColor, Color3.fromRGB(
            math.min(255, accentColor.R * 255 + 50),
            math.min(255, accentColor.G * 255 + 50),
            math.min(255, accentColor.B * 255 + 50)
        ), 0)

        -- Animate In
        Tween(NotifFrame, TWEENS.Bounce, {Size = UDim2.new(1, 0, 0, 70)})
        Tween(glow, TWEENS.Normal, {ImageTransparency = 0.7})
        
        -- Pulse the stroke
        task.spawn(function()
            while NotifFrame and NotifFrame.Parent do
                Tween(stroke, TWEENS.Glow, {Transparency = 0.3})
                task.wait(1)
                if not NotifFrame or not NotifFrame.Parent then break end
                Tween(stroke, TWEENS.Glow, {Transparency = 0.7})
                task.wait(1)
            end
        end)

        -- Progress bar countdown
        Tween(ProgressFill, TweenInfo.new(duration or 3, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 1, 0)})

        task.delay(duration or 3, function()
            Tween(NotifFrame, TWEENS.Smooth, {Size = UDim2.new(1, 0, 0, 0), BackgroundTransparency = 1})
            Tween(glow, TWEENS.Normal, {ImageTransparency = 1})
            task.wait(0.4)
            if NotifFrame then NotifFrame:Destroy() end
        end)
    end

    -- PREMIUM WINDOW
    function Titanium:Window(title)
        local WindowObj = {}

        -- Main Container with Shadow
        local ShadowContainer = Create("Frame", {
            Name = "ShadowContainer",
            Size = UDim2.new(0, 720, 0, 500),
            Position = UDim2.new(0.5, -360, 0.5, -250),
            BackgroundTransparency = 1,
            Parent = self.ScreenGui
        })

        -- Shadow Layer
        local Shadow = Create("ImageLabel", {
            Name = "Shadow",
            Size = UDim2.new(1, 80, 1, 80),
            Position = UDim2.new(0.5, 0, 0.5, 0),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundTransparency = 1,
            Image = "rbxassetid://5028857084",
            ImageColor3 = Color3.new(0, 0, 0),
            ImageTransparency = 0.5,
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(24, 24, 276, 276),
            ZIndex = -2,
            Parent = ShadowContainer
        })

        -- Main Frame
        local MainFrame = Create("Frame", {
            Name = "Main",
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundColor3 = THEME.Main,
            BorderSizePixel = 0,
            ClipsDescendants = true,
            Parent = ShadowContainer
        })
        self.MainFrame = MainFrame

        Create("UICorner", {CornerRadius = UDim.new(0, 12), Parent = MainFrame})
        
        -- Outer glow
        local outerGlow = CreateGlow(MainFrame, THEME.Accent, 0.85)
        PulseGlow(outerGlow, 0.75, 0.9)

        -- Border Stroke with Gradient feel
        local mainStroke = Create("UIStroke", {
            Color = THEME.StrokeLight,
            Thickness = 1,
            Transparency = 0.5,
            Parent = MainFrame
        })

        -- Top Bar with Gradient
        local TopBar = Create("Frame", {
            Name = "TopBar",
            Size = UDim2.new(1, 0, 0, 50),
            BackgroundColor3 = THEME.Secondary,
            BorderSizePixel = 0,
            Parent = MainFrame
        })
        Create("UICorner", {CornerRadius = UDim.new(0, 12), Parent = TopBar})
        
        -- Fix corner overlap
        local TopBarFix = Create("Frame", {
            Size = UDim2.new(1, 0, 0, 20),
            Position = UDim2.new(0, 0, 1, -20),
            BackgroundColor3 = THEME.Secondary,
            BorderSizePixel = 0,
            Parent = TopBar
        })

        -- Gradient line under top bar
        local GradientLine = Create("Frame", {
            Size = UDim2.new(1, 0, 0, 2),
            Position = UDim2.new(0, 0, 0, 50),
            BackgroundColor3 = Color3.new(1, 1, 1),
            BorderSizePixel = 0,
            Parent = MainFrame
        })
        CreateGradient(GradientLine, THEME.GradientStart, THEME.GradientEnd, 0)

        -- Logo with Glow
        local LogoContainer = Create("Frame", {
            Size = UDim2.new(0, 180, 0, 50),
            BackgroundTransparency = 1,
            Parent = TopBar
        })

        local LogoIcon = Create("TextLabel", {
            Text = "⬡",
            Size = UDim2.new(0, 40, 1, 0),
            Position = UDim2.new(0, 10, 0, 0),
            BackgroundTransparency = 1,
            TextColor3 = THEME.Accent,
            Font = Enum.Font.GothamBold,
            TextSize = 24,
            Parent = LogoContainer
        })

        local LogoText = Create("TextLabel", {
            Text = title,
            Font = Enum.Font.GothamBlack,
            TextSize = 20,
            TextColor3 = THEME.Text,
            Size = UDim2.new(1, -50, 1, 0),
            Position = UDim2.new(0, 45, 0, 0),
            BackgroundTransparency = 1,
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = LogoContainer
        })

        -- Version Badge
        local VersionBadge = Create("Frame", {
            Size = UDim2.new(0, 60, 0, 22),
            Position = UDim2.new(0, 160, 0.5, -11),
            BackgroundColor3 = THEME.Accent,
            BackgroundTransparency = 0.85,
            Parent = TopBar
        })
        Create("UICorner", {CornerRadius = UDim.new(0, 6), Parent = VersionBadge})
        Create("UIStroke", {Color = THEME.Accent, Thickness = 1, Transparency = 0.5, Parent = VersionBadge})
        Create("TextLabel", {
            Text = "v4.0",
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            TextColor3 = THEME.Accent,
            Font = Enum.Font.GothamBold,
            TextSize = 11,
            Parent = VersionBadge
        })

        -- Window Controls
        local Controls = Create("Frame", {
            Size = UDim2.new(0, 80, 0, 30),
            Position = UDim2.new(1, -90, 0.5, -15),
            BackgroundTransparency = 1,
            Parent = TopBar
        })

        -- Minimize Button
        local MinBtn = Create("TextButton", {
            Size = UDim2.new(0, 30, 0, 30),
            Position = UDim2.new(0, 0, 0, 0),
            BackgroundColor3 = THEME.Tertiary,
            BackgroundTransparency = 0.5,
            Text = "─",
            TextColor3 = THEME.TextDark,
            Font = Enum.Font.GothamBold,
            TextSize = 14,
            AutoButtonColor = false,
            Parent = Controls
        })
        Create("UICorner", {CornerRadius = UDim.new(0, 8), Parent = MinBtn})

        MinBtn.MouseEnter:Connect(function()
            Tween(MinBtn, TWEENS.Fast, {BackgroundTransparency = 0, TextColor3 = THEME.Warning})
        end)
        MinBtn.MouseLeave:Connect(function()
            Tween(MinBtn, TWEENS.Fast, {BackgroundTransparency = 0.5, TextColor3 = THEME.TextDark})
        end)

        -- Close Button
        local CloseBtn = Create("TextButton", {
            Size = UDim2.new(0, 30, 0, 30),
            Position = UDim2.new(0, 40, 0, 0),
            BackgroundColor3 = THEME.Tertiary,
            BackgroundTransparency = 0.5,
            Text = "×",
            TextColor3 = THEME.TextDark,
            Font = Enum.Font.GothamBold,
            TextSize = 18,
            AutoButtonColor = false,
            Parent = Controls
        })
        Create("UICorner", {CornerRadius = UDim.new(0, 8), Parent = CloseBtn})

        CloseBtn.MouseEnter:Connect(function()
            Tween(CloseBtn, TWEENS.Fast, {BackgroundTransparency = 0, BackgroundColor3 = THEME.Error, TextColor3 = THEME.Text})
        end)
        CloseBtn.MouseLeave:Connect(function()
            Tween(CloseBtn, TWEENS.Fast, {BackgroundTransparency = 0.5, BackgroundColor3 = THEME.Tertiary, TextColor3 = THEME.TextDark})
        end)

        CloseBtn.MouseButton1Click:Connect(function()
            Tween(ShadowContainer, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 0, 0, 0),
                Position = UDim2.new(0.5, 0, 0.5, 0)
            })
            Tween(outerGlow, TWEENS.Fast, {ImageTransparency = 1})
            task.wait(0.3)
            self.ScreenGui:Destroy()
        end)

        -- Minimize functionality
        local minimized = false
        MinBtn.MouseButton1Click:Connect(function()
            minimized = not minimized
            if minimized then
                Tween(MainFrame, TWEENS.Smooth, {Size = UDim2.new(1, 0, 0, 50)})
                Tween(ShadowContainer, TWEENS.Smooth, {Size = UDim2.new(0, 720, 0, 50)})
            else
                Tween(MainFrame, TWEENS.Smooth, {Size = UDim2.new(1, 0, 1, 0)})
                Tween(ShadowContainer, TWEENS.Smooth, {Size = UDim2.new(0, 720, 0, 500)})
            end
        end)

        -- Dragging with smooth follow
        local dragging, dragStart, startPos
        TopBar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                dragStart = input.Position
                startPos = ShadowContainer.Position
            end
        end)
        TopBar.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                local delta = input.Position - dragStart
                Tween(ShadowContainer, TweenInfo.new(0.06), {
                    Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
                })
            end
        end)

        -- SIDEBAR
        local Sidebar = Create("Frame", {
            Size = UDim2.new(0, 200, 1, -52),
            Position = UDim2.new(0, 0, 0, 52),
            BackgroundColor3 = THEME.Secondary,
            BorderSizePixel = 0,
            Parent = MainFrame
        })

        -- Sidebar separator
        local SidebarSep = Create("Frame", {
            Size = UDim2.new(0, 1, 1, 0),
            Position = UDim2.new(1, 0, 0, 0),
            BackgroundColor3 = THEME.Stroke,
            BorderSizePixel = 0,
            Parent = Sidebar
        })

        -- Tab Container
        local TabContainer = Create("ScrollingFrame", {
            Size = UDim2.new(1, -10, 1, -20),
            Position = UDim2.new(0, 5, 0, 10),
            BackgroundTransparency = 1,
            ScrollBarThickness = 2,
            ScrollBarImageColor3 = THEME.Accent,
            ScrollBarImageTransparency = 0.5,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            ScrollingDirection = Enum.ScrollingDirection.Y,
            Parent = Sidebar
        })
        
        local TabLayout = Create("UIListLayout", {
            Padding = UDim.new(0, 6),
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Parent = TabContainer
        })
        TabLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            TabContainer.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y + 10)
        end)

        -- Page Container
        local PageContainer = Create("Frame", {
            Size = UDim2.new(1, -201, 1, -52),
            Position = UDim2.new(0, 201, 0, 52),
            BackgroundTransparency = 1,
            Parent = MainFrame
        })

        WindowObj.Tabs = {}
        WindowObj._Titanium = self

        -- TAB FUNCTION
        function WindowObj:Tab(name, icon)
            local TabObj = {}
            TabObj._Titanium = WindowObj._Titanium

            icon = icon or "◆"

            local TabButton = Create("TextButton", {
                Text = "",
                Size = UDim2.new(1, -10, 0, 42),
                BackgroundColor3 = THEME.Main,
                BackgroundTransparency = 1,
                AutoButtonColor = false,
                Parent = TabContainer
            })
            Create("UICorner", {CornerRadius = UDim.new(0, 8), Parent = TabButton})

            -- Active Indicator
            local ActiveIndicator = Create("Frame", {
                Size = UDim2.new(0, 3, 0.6, 0),
                Position = UDim2.new(0, 0, 0.2, 0),
                BackgroundColor3 = THEME.Accent,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Parent = TabButton
            })
            Create("UICorner", {CornerRadius = UDim.new(0, 2), Parent = ActiveIndicator})

            -- Icon
            local TabIcon = Create("TextLabel", {
                Text = icon,
                Size = UDim2.new(0, 30, 1, 0),
                Position = UDim2.new(0, 12, 0, 0),
                BackgroundTransparency = 1,
                TextColor3 = THEME.TextDark,
                Font = Enum.Font.GothamBold,
                TextSize = 14,
                Parent = TabButton
            })

            -- Name
            local TabName = Create("TextLabel", {
                Text = name,
                Size = UDim2.new(1, -50, 1, 0),
                Position = UDim2.new(0, 45, 0, 0),
                BackgroundTransparency = 1,
                TextColor3 = THEME.TextDark,
                Font = Enum.Font.GothamMedium,
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = TabButton
            })

            local Page = Create("ScrollingFrame", {
                Size = UDim2.new(1, -30, 1, -30),
                Position = UDim2.new(0, 15, 0, 15),
                BackgroundTransparency = 1,
                ScrollBarThickness = 3,
                ScrollBarImageColor3 = THEME.Accent,
                ScrollBarImageTransparency = 0.3,
                CanvasSize = UDim2.new(0, 0, 0, 0),
                ScrollingDirection = Enum.ScrollingDirection.Y,
                Visible = false,
                Parent = PageContainer
            })
            
            local PageLayout = Create("UIListLayout", {
                Padding = UDim.new(0, 8),
                SortOrder = Enum.SortOrder.LayoutOrder,
                Parent = Page
            })
            PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                Page.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y + 20)
            end)

            -- Hover Effect
            TabButton.MouseEnter:Connect(function()
                if not Page.Visible then
                    Tween(TabButton, TWEENS.Fast, {BackgroundTransparency = 0.8})
                    Tween(TabIcon, TWEENS.Fast, {TextColor3 = THEME.Text})
                    Tween(TabName, TWEENS.Fast, {TextColor3 = THEME.Text})
                end
            end)
            TabButton.MouseLeave:Connect(function()
                if not Page.Visible then
                    Tween(TabButton, TWEENS.Fast, {BackgroundTransparency = 1})
                    Tween(TabIcon, TWEENS.Fast, {TextColor3 = THEME.TextDark})
                    Tween(TabName, TWEENS.Fast, {TextColor3 = THEME.TextDark})
                end
            end)

            TabButton.MouseButton1Click:Connect(function()
                for _, t in pairs(WindowObj.Tabs) do
                    Tween(t.Btn, TWEENS.Normal, {BackgroundTransparency = 1})
                    Tween(t.Icon, TWEENS.Normal, {TextColor3 = THEME.TextDark})
                    Tween(t.Name, TWEENS.Normal, {TextColor3 = THEME.TextDark})
                    Tween(t.Indicator, TWEENS.Normal, {BackgroundTransparency = 1})
                    t.Page.Visible = false
                end
                
                Tween(TabButton, TWEENS.Normal, {BackgroundTransparency = 0})
                Tween(TabIcon, TWEENS.Normal, {TextColor3 = THEME.Accent})
                Tween(TabName, TWEENS.Normal, {TextColor3 = THEME.Text})
                Tween(ActiveIndicator, TWEENS.Normal, {BackgroundTransparency = 0})
                Page.Visible = true
            end)

            table.insert(WindowObj.Tabs, {
                Btn = TabButton,
                Page = Page,
                Icon = TabIcon,
                Name = TabName,
                Indicator = ActiveIndicator
            })
            
            if #WindowObj.Tabs == 1 then
                TabButton.BackgroundTransparency = 0
                TabIcon.TextColor3 = THEME.Accent
                TabName.TextColor3 = THEME.Text
                ActiveIndicator.BackgroundTransparency = 0
                Page.Visible = true
            end

            -- SECTION
            function TabObj:Section(text)
                local SectionFrame = Create("Frame", {
                    Size = UDim2.new(1, 0, 0, 32),
                    BackgroundTransparency = 1,
                    Parent = Page
                })

                Create("TextLabel", {
                    Text = string.upper(text),
                    Size = UDim2.new(1, -10, 1, 0),
                    Position = UDim2.new(0, 5, 0, 0),
                    BackgroundTransparency = 1,
                    TextColor3 = THEME.Accent,
                    Font = Enum.Font.GothamBold,
                    TextSize = 11,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = SectionFrame
                })

                local SectionLine = Create("Frame", {
                    Size = UDim2.new(1, -10, 0, 1),
                    Position = UDim2.new(0, 5, 1, -1),
                    BackgroundColor3 = THEME.Stroke,
                    BorderSizePixel = 0,
                    Parent = SectionFrame
                })
            end

            -- PREMIUM TOGGLE with Notification
            function TabObj:Toggle(text, default, callback)
                local toggled = default or false

                local ToggleFrame = Create("TextButton", {
                    Size = UDim2.new(1, 0, 0, 46),
                    BackgroundColor3 = THEME.Secondary,
                    Text = "",
                    AutoButtonColor = false,
                    ClipsDescendants = true,
                    Parent = Page
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 8), Parent = ToggleFrame})
                
                local toggleStroke = Create("UIStroke", {
                    Color = THEME.Stroke,
                    Thickness = 1,
                    Transparency = 0.3,
                    Parent = ToggleFrame
                })

                Create("TextLabel", {
                    Text = text,
                    Size = UDim2.new(0.7, 0, 1, 0),
                    Position = UDim2.new(0, 16, 0, 0),
                    BackgroundTransparency = 1,
                    TextColor3 = THEME.Text,
                    Font = Enum.Font.GothamMedium,
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = ToggleFrame
                })

                -- Toggle Switch Container
                local SwitchContainer = Create("Frame", {
                    Size = UDim2.new(0, 48, 0, 24),
                    Position = UDim2.new(1, -60, 0.5, -12),
                    BackgroundColor3 = THEME.Main,
                    BorderSizePixel = 0,
                    Parent = ToggleFrame
                })
                Create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = SwitchContainer})
                Create("UIStroke", {Color = THEME.Stroke, Thickness = 1, Parent = SwitchContainer})

                -- Knob with glow
                local Knob = Create("Frame", {
                    Size = UDim2.new(0, 18, 0, 18),
                    Position = UDim2.new(0, 3, 0.5, -9),
                    BackgroundColor3 = THEME.TextDark,
                    Parent = SwitchContainer
                })
                Create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Knob})
                
                local KnobGlow = CreateGlow(Knob, THEME.Accent, 1)
                KnobGlow.Size = UDim2.new(1, 20, 1, 20)

                local function Update(notify)
                    local targetPos = toggled and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
                    local switchColor = toggled and THEME.Accent or THEME.Main
                    local knobColor = toggled and THEME.Text or THEME.TextDark
                    local strokeColor = toggled and THEME.AccentDark or THEME.Stroke
                    local glowTrans = toggled and 0.6 or 1

                    Tween(Knob, TWEENS.Bounce, {Position = targetPos, BackgroundColor3 = knobColor})
                    Tween(SwitchContainer, TWEENS.Normal, {BackgroundColor3 = switchColor})
                    Tween(SwitchContainer:FindFirstChildOfClass("UIStroke"), TWEENS.Normal, {Color = strokeColor})
                    Tween(KnobGlow, TWEENS.Normal, {ImageTransparency = glowTrans})
                    Tween(toggleStroke, TWEENS.Normal, {Color = toggled and THEME.StrokeAccent or THEME.Stroke})

                    if notify and self._Titanium and self._Titanium.Notify then
                        self._Titanium:Notify(
                            text,
                            toggled and "Feature enabled" or "Feature disabled",
                            2,
                            toggled and "toggle_on" or "toggle_off"
                        )
                    end

                    callback(toggled)
                end

                -- Hover Effect
                ToggleFrame.MouseEnter:Connect(function()
                    Tween(ToggleFrame, TWEENS.Fast, {BackgroundColor3 = THEME.Tertiary})
                end)
                ToggleFrame.MouseLeave:Connect(function()
                    Tween(ToggleFrame, TWEENS.Fast, {BackgroundColor3 = THEME.Secondary})
                end)

                ToggleFrame.MouseButton1Click:Connect(function(_, _, _, position)
                    toggled = not toggled
                    Update(true)
                end)

                if default then Update(false) end

                return {
                    Set = function(_, value)
                        toggled = value
                        Update(false)
                    end,
                    Get = function()
                        return toggled
                    end
                }
            end

            -- PREMIUM SLIDER
            function TabObj:Slider(text, min, max, default, callback)
                local SliderFrame = Create("Frame", {
                    Size = UDim2.new(1, 0, 0, 65),
                    BackgroundColor3 = THEME.Secondary,
                    Parent = Page
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 8), Parent = SliderFrame})
                Create("UIStroke", {Color = THEME.Stroke, Thickness = 1, Transparency = 0.3, Parent = SliderFrame})

                Create("TextLabel", {
                    Text = text,
                    Size = UDim2.new(1, -80, 0, 30),
                    Position = UDim2.new(0, 16, 0, 5),
                    BackgroundTransparency = 1,
                    TextColor3 = THEME.Text,
                    Font = Enum.Font.GothamMedium,
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = SliderFrame
                })

                -- Value Display
                local ValueBg = Create("Frame", {
                    Size = UDim2.new(0, 50, 0, 24),
                    Position = UDim2.new(1, -66, 0, 8),
                    BackgroundColor3 = THEME.Main,
                    Parent = SliderFrame
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 6), Parent = ValueBg})

                local ValueLabel = Create("TextLabel", {
                    Text = tostring(default),
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundTransparency = 1,
                    TextColor3 = THEME.Accent,
                    Font = Enum.Font.GothamBold,
                    TextSize = 12,
                    Parent = ValueBg
                })

                -- Slider Track
                local BarBG = Create("TextButton", {
                    Text = "",
                    Size = UDim2.new(1, -32, 0, 8),
                    Position = UDim2.new(0, 16, 0, 45),
                    BackgroundColor3 = THEME.Main,
                    AutoButtonColor = false,
                    Parent = SliderFrame
                })
                Create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = BarBG})

                -- Fill with gradient
                local BarFill = Create("Frame", {
                    Size = UDim2.new((default - min) / (max - min), 0, 1, 0),
                    BackgroundColor3 = THEME.Accent,
                    ClipsDescendants = true,
                    Parent = BarBG
                })
                Create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = BarFill})
                CreateGradient(BarFill, THEME.GradientStart, THEME.GradientEnd, 0)

                -- Glow on fill
                local fillGlow = Create("Frame", {
                    Size = UDim2.new(0, 20, 0, 20),
                    Position = UDim2.new(1, -10, 0.5, -10),
                    BackgroundColor3 = THEME.Accent,
                    BackgroundTransparency = 0.6,
                    Parent = BarFill
                })
                Create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = fillGlow})

                -- Knob
                local SliderKnob = Create("Frame", {
                    Size = UDim2.new(0, 16, 0, 16),
                    Position = UDim2.new((default - min) / (max - min), -8, 0.5, -8),
                    BackgroundColor3 = THEME.Text,
                    ZIndex = 5,
                    Parent = BarBG
                })
                Create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = SliderKnob})
                Create("UIStroke", {Color = THEME.Accent, Thickness = 2, Parent = SliderKnob})

                local function Update(input)
                    local sizeX = math.clamp((input.Position.X - BarBG.AbsolutePosition.X) / BarBG.AbsoluteSize.X, 0, 1)
                    local value = math.floor(min + ((max - min) * sizeX))

                    Tween(BarFill, TweenInfo.new(0.05), {Size = UDim2.new(sizeX, 0, 1, 0)})
                    Tween(SliderKnob, TweenInfo.new(0.05), {Position = UDim2.new(sizeX, -8, 0.5, -8)})
                    ValueLabel.Text = tostring(value)
                    callback(value)
                end

                local dragging = false
                BarBG.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true
                        Update(input)
                    end
                end)
                UserInputService.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false
                    end
                end)
                UserInputService.InputChanged:Connect(function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        Update(input)
                    end
                end)

                return {
                    Set = function(_, value)
                        local sizeX = (value - min) / (max - min)
                        Tween(BarFill, TWEENS.Normal, {Size = UDim2.new(sizeX, 0, 1, 0)})
                        Tween(SliderKnob, TWEENS.Normal, {Position = UDim2.new(sizeX, -8, 0.5, -8)})
                        ValueLabel.Text = tostring(value)
                        callback(value)
                    end
                }
            end

            -- PREMIUM BUTTON
            function TabObj:Button(text, callback)
                local ButtonFrame = Create("TextButton", {
                    Size = UDim2.new(1, 0, 0, 42),
                    BackgroundColor3 = THEME.Secondary,
                    Text = "",
                    AutoButtonColor = false,
                    ClipsDescendants = true,
                    Parent = Page
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 8), Parent = ButtonFrame})
                Create("UIStroke", {Color = THEME.Stroke, Thickness = 1, Transparency = 0.3, Parent = ButtonFrame})

                local ButtonText = Create("TextLabel", {
                    Text = text,
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundTransparency = 1,
                    TextColor3 = THEME.Text,
                    Font = Enum.Font.GothamMedium,
                    TextSize = 14,
                    Parent = ButtonFrame
                })

                -- Hover & Click Effects
                ButtonFrame.MouseEnter:Connect(function()
                    Tween(ButtonFrame, TWEENS.Fast, {BackgroundColor3 = THEME.Tertiary})
                    Tween(ButtonFrame:FindFirstChildOfClass("UIStroke"), TWEENS.Fast, {Color = THEME.StrokeLight})
                end)
                ButtonFrame.MouseLeave:Connect(function()
                    Tween(ButtonFrame, TWEENS.Fast, {BackgroundColor3 = THEME.Secondary})
                    Tween(ButtonFrame:FindFirstChildOfClass("UIStroke"), TWEENS.Fast, {Color = THEME.Stroke})
                end)

                ButtonFrame.MouseButton1Click:Connect(function()
                    -- Flash effect
                    Tween(ButtonFrame, TweenInfo.new(0.1), {BackgroundColor3 = THEME.Accent})
                    Tween(ButtonText, TweenInfo.new(0.1), {TextColor3 = THEME.Main})
                    task.wait(0.1)
                    Tween(ButtonFrame, TWEENS.Normal, {BackgroundColor3 = THEME.Secondary})
                    Tween(ButtonText, TWEENS.Normal, {TextColor3 = THEME.Text})
                    task.spawn(callback)
                end)
            end

            -- PREMIUM KEYBIND
            function TabObj:Keybind(text, defaultKeyCode, callback)
                local current = defaultKeyCode or Enum.KeyCode.RightShift
                local waiting = false
                local conn

                local KeyFrame = Create("TextButton", {
                    Size = UDim2.new(1, 0, 0, 46),
                    BackgroundColor3 = THEME.Secondary,
                    Text = "",
                    AutoButtonColor = false,
                    Parent = Page
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 8), Parent = KeyFrame})
                Create("UIStroke", {Color = THEME.Stroke, Thickness = 1, Transparency = 0.3, Parent = KeyFrame})

                Create("TextLabel", {
                    Text = text,
                    Size = UDim2.new(0.6, 0, 1, 0),
                    Position = UDim2.new(0, 16, 0, 0),
                    BackgroundTransparency = 1,
                    TextColor3 = THEME.Text,
                    Font = Enum.Font.GothamMedium,
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = KeyFrame
                })

                -- Key Display
                local KeyBadge = Create("Frame", {
                    Size = UDim2.new(0, 80, 0, 28),
                    Position = UDim2.new(1, -96, 0.5, -14),
                    BackgroundColor3 = THEME.Main,
                    Parent = KeyFrame
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 6), Parent = KeyBadge})
                Create("UIStroke", {Color = THEME.Accent, Thickness = 1, Transparency = 0.5, Parent = KeyBadge})

                local KeyText = Create("TextLabel", {
                    Text = current.Name,
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundTransparency = 1,
                    TextColor3 = THEME.Accent,
                    Font = Enum.Font.GothamBold,
                    TextSize = 11,
                    Parent = KeyBadge
                })

                local function setKey(keyCode)
                    current = keyCode
                    KeyText.Text = current.Name
                    Tween(KeyBadge, TWEENS.Bounce, {Size = UDim2.new(0, 80, 0, 28)})
                    callback(current)
                end

                KeyFrame.MouseEnter:Connect(function()
                    Tween(KeyFrame, TWEENS.Fast, {BackgroundColor3 = THEME.Tertiary})
                end)
                KeyFrame.MouseLeave:Connect(function()
                    Tween(KeyFrame, TWEENS.Fast, {BackgroundColor3 = THEME.Secondary})
                end)

                KeyFrame.MouseButton1Click:Connect(function()
                    if waiting then return end
                    waiting = true
                    KeyText.Text = "..."
                    Tween(KeyBadge, TWEENS.Pulse, {BackgroundColor3 = THEME.Accent})
                    Tween(KeyText, TWEENS.Fast, {TextColor3 = THEME.Main})

                    if conn then conn:Disconnect() end
                    conn = UserInputService.InputBegan:Connect(function(input, gpe)
                        if gpe then return end
                        if not waiting then return end
                        if input.KeyCode and input.KeyCode ~= Enum.KeyCode.Unknown then
                            waiting = false
                            if conn then conn:Disconnect() end
                            Tween(KeyBadge, TWEENS.Normal, {BackgroundColor3 = THEME.Main})
                            Tween(KeyText, TWEENS.Normal, {TextColor3 = THEME.Accent})
                            setKey(input.KeyCode)
                        end
                    end)
                end)

                if callback then callback(current) end

                return {
                    Set = function(_, keyCode)
                        setKey(keyCode)
                    end,
                    Get = function()
                        return current
                    end
                }
            end

            return TabObj
        end

        return WindowObj
    end

    return Titanium
end)()

-- PREMIUM AUTHENTICATION SYSTEM
local Auth = (function(UI)
    local TweenService = game:GetService("TweenService")
    local Players = game:GetService("Players")

    local Auth = {}

    function Auth.Run(onSuccess)
        local Titanium = UI.new()
        local ScreenGui = Titanium.ScreenGui

        -- Background Blur/Overlay
        local Overlay = Instance.new("Frame")
        Overlay.Size = UDim2.new(1, 0, 1, 0)
        Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        Overlay.BackgroundTransparency = 0.55
        Overlay.BorderSizePixel = 0
        Overlay.ZIndex = 0
        Overlay.Parent = ScreenGui

        -- Main Auth Container
        local Container = Instance.new("Frame")
        Container.Size = UDim2.new(0, 440, 0, 340)
        Container.Position = UDim2.new(0.5, -220, 0.5, -170)
        Container.BackgroundTransparency = 1
        Container.Parent = ScreenGui

        -- Shadow
        local Shadow = Instance.new("ImageLabel")
        Shadow.Size = UDim2.new(1, 100, 1, 100)
        Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
        Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
        Shadow.BackgroundTransparency = 1
        Shadow.Image = "rbxassetid://5028857084"
        Shadow.ImageColor3 = Color3.new(0, 0, 0)
        Shadow.ImageTransparency = 0.4
        Shadow.ScaleType = Enum.ScaleType.Slice
        Shadow.SliceCenter = Rect.new(24, 24, 276, 276)
        Shadow.ZIndex = -1
        Shadow.Parent = Container

        -- Main Frame
        local Frame = Instance.new("Frame")
        Frame.Size = UDim2.new(0, 0, 0, 0)
        Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
        Frame.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
        Frame.BorderSizePixel = 0
        Frame.ClipsDescendants = true
        Frame.Parent = Container

        local FrameGradient = Instance.new("UIGradient")
        FrameGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(14, 14, 20)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 14))
        })
        FrameGradient.Rotation = 90
        FrameGradient.Parent = Frame

        local FramePadding = Instance.new("UIPadding")
        FramePadding.PaddingTop = UDim.new(0, 18)
        FramePadding.PaddingBottom = UDim.new(0, 18)
        FramePadding.PaddingLeft = UDim.new(0, 22)
        FramePadding.PaddingRight = UDim.new(0, 22)
        FramePadding.Parent = Frame

        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(0, 14)
        Corner.Parent = Frame

        local Stroke = Instance.new("UIStroke")
        Stroke.Color = Color3.fromRGB(0, 170, 255)
        Stroke.Thickness = 2
        Stroke.Transparency = 0.5
        Stroke.Parent = Frame

        -- Glow Effect
        local Glow = Instance.new("ImageLabel")
        Glow.Size = UDim2.new(1, 80, 1, 80)
        Glow.Position = UDim2.new(0.5, 0, 0.5, 0)
        Glow.AnchorPoint = Vector2.new(0.5, 0.5)
        Glow.BackgroundTransparency = 1
        Glow.Image = "rbxassetid://5028857084"
        Glow.ImageColor3 = Color3.fromRGB(0, 170, 255)
        Glow.ImageTransparency = 0.8
        Glow.ScaleType = Enum.ScaleType.Slice
        Glow.SliceCenter = Rect.new(24, 24, 276, 276)
        Glow.ZIndex = -1
        Glow.Parent = Frame

        -- Pulsing glow
        task.spawn(function()
            while Glow and Glow.Parent do
                TweenService:Create(Glow, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {ImageTransparency = 0.6}):Play()
                TweenService:Create(Stroke, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency = 0.3}):Play()
                task.wait(1.5)
                if not Glow or not Glow.Parent then break end
                TweenService:Create(Glow, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {ImageTransparency = 0.85}):Play()
                TweenService:Create(Stroke, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency = 0.6}):Play()
                task.wait(1.5)
            end
        end)

        -- Open Animation
        TweenService:Create(Frame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(1, 0, 1, 0)
        }):Play()
        task.wait(0.3)

        -- Logo Icon
        local LogoIcon = Instance.new("TextLabel")
        LogoIcon.Text = "⬡"
        LogoIcon.Size = UDim2.new(0, 34, 0, 34)
        LogoIcon.Position = UDim2.new(0, 0, 0, 0)
        LogoIcon.BackgroundTransparency = 1
        LogoIcon.TextColor3 = Color3.fromRGB(0, 170, 255)
        LogoIcon.Font = Enum.Font.GothamBold
        LogoIcon.TextSize = 28
        LogoIcon.Parent = Frame

        -- Title
        local Title = Instance.new("TextLabel")
        Title.Text = "TITANIUM"
        Title.Font = Enum.Font.GothamBold
        Title.TextSize = 22
        Title.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title.Size = UDim2.new(1, -44, 0, 26)
        Title.Position = UDim2.new(0, 44, 0, 2)
        Title.BackgroundTransparency = 1
        Title.TextXAlignment = Enum.TextXAlignment.Left
        Title.Parent = Frame

        -- Subtitle
        local Subtitle = Instance.new("TextLabel")
        Subtitle.Text = "Login systemm"
        Subtitle.Font = Enum.Font.Gotham
        Subtitle.TextSize = 12
        Subtitle.TextColor3 = Color3.fromRGB(140, 145, 160)
        Subtitle.Size = UDim2.new(1, -44, 0, 18)
        Subtitle.Position = UDim2.new(0, 44, 0, 26)
        Subtitle.BackgroundTransparency = 1
        Subtitle.TextXAlignment = Enum.TextXAlignment.Left
        Subtitle.Parent = Frame

        local Disclaimer = Instance.new("TextLabel")
        Disclaimer.Text = "Note: i havent added a server yet so its placeholders"
        Disclaimer.Font = Enum.Font.Gotham
        Disclaimer.TextSize = 11
        Disclaimer.TextColor3 = Color3.fromRGB(140, 145, 160)
        Disclaimer.Size = UDim2.new(1, 0, 0, 18)
        Disclaimer.Position = UDim2.new(0, 0, 0, 52)
        Disclaimer.BackgroundTransparency = 1
        Disclaimer.TextXAlignment = Enum.TextXAlignment.Left
        Disclaimer.Parent = Frame

        -- Input Container
        local InputContainer = Instance.new("Frame")
        InputContainer.Size = UDim2.new(0.85, 0, 0, 50)
        InputContainer.Position = UDim2.new(0.075, 0, 0, 110)
        InputContainer.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
        InputContainer.BorderSizePixel = 0
        InputContainer.Parent = Frame
        Instance.new("UICorner", InputContainer).CornerRadius = UDim.new(0, 10)
        
        local InputStroke = Instance.new("UIStroke")
        InputStroke.Color = Color3.fromRGB(35, 38, 48)
        InputStroke.Thickness = 1.5
        InputStroke.Parent = InputContainer

        -- Key Icon
        local KeyIcon = Instance.new("TextLabel")
        KeyIcon.Text = "🔑"
        KeyIcon.Size = UDim2.new(0, 40, 1, 0)
        KeyIcon.BackgroundTransparency = 1
        KeyIcon.TextColor3 = Color3.fromRGB(0, 170, 255)
        KeyIcon.Font = Enum.Font.GothamBold
        KeyIcon.TextSize = 18
        KeyIcon.Parent = InputContainer

        local KeyInput = Instance.new("TextBox")
        KeyInput.PlaceholderText = "Login"
        KeyInput.PlaceholderColor3 = Color3.fromRGB(80, 85, 100)
        KeyInput.Text = ""
        KeyInput.Size = UDim2.new(1, -50, 1, 0)
        KeyInput.Position = UDim2.new(0, 45, 0, 0)
        KeyInput.BackgroundTransparency = 1
        KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
        KeyInput.Font = Enum.Font.GothamMedium
        KeyInput.TextSize = 14
        KeyInput.TextXAlignment = Enum.TextXAlignment.Left
        KeyInput.ClearTextOnFocus = false
        KeyInput.Parent = InputContainer

        -- Focus effects
        KeyInput.Focused:Connect(function()
            TweenService:Create(InputStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(0, 170, 255)}):Play()
        end)
        KeyInput.FocusLost:Connect(function()
            TweenService:Create(InputStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(35, 38, 48)}):Play()
        end)

        -- Login Button
        local LoginBtn = Instance.new("TextButton")
        LoginBtn.Text = "Login"
        LoginBtn.Size = UDim2.new(0.85, 0, 0, 48)
        LoginBtn.Position = UDim2.new(0.075, 0, 0, 180)
        LoginBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
        LoginBtn.TextColor3 = Color3.new(1, 1, 1)
        LoginBtn.Font = Enum.Font.GothamBold
        LoginBtn.TextSize = 14
        LoginBtn.AutoButtonColor = false
        LoginBtn.Parent = Frame
        Instance.new("UICorner", LoginBtn).CornerRadius = UDim.new(0, 10)

        -- Button gradient
        local BtnGradient = Instance.new("UIGradient")
        BtnGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 0, 255))
        })
        BtnGradient.Rotation = 45
        BtnGradient.Parent = LoginBtn

        -- Hover effects
        LoginBtn.MouseEnter:Connect(function()
            TweenService:Create(LoginBtn, TweenInfo.new(0.2), {Size = UDim2.new(0.87, 0, 0, 50)}):Play()
        end)
        LoginBtn.MouseLeave:Connect(function()
            TweenService:Create(LoginBtn, TweenInfo.new(0.2), {Size = UDim2.new(0.85, 0, 0, 48)}):Play()
        end)

        -- Status Text
        local StatusText = Instance.new("TextLabel")
        StatusText.Text = ""
        StatusText.Font = Enum.Font.Gotham
        StatusText.TextSize = 12
        StatusText.TextColor3 = Color3.fromRGB(140, 145, 160)
        StatusText.Size = UDim2.new(1, 0, 0, 20)
        StatusText.Position = UDim2.new(0, 0, 1, -40)
        StatusText.BackgroundTransparency = 1
        StatusText.Parent = Frame

        local Footer = Instance.new("TextLabel")
        Footer.Text = "Backend: Unconnncted"
        Footer.Font = Enum.Font.Gotham
        Footer.TextSize = 10
        Footer.TextColor3 = Color3.fromRGB(80, 85, 100)
        Footer.Size = UDim2.new(1, 0, 0, 18)
        Footer.Position = UDim2.new(0, 0, 1, -22)
        Footer.BackgroundTransparency = 1
        Footer.TextXAlignment = Enum.TextXAlignment.Left
        Footer.Parent = Frame

        LoginBtn.MouseButton1Click:Connect(function()
            LoginBtn.Text = "VERIFYING..."
            StatusText.Text = "Loading."
            StatusText.TextColor3 = Color3.fromRGB(255, 200, 0)
            
            TweenService:Create(BtnGradient, TweenInfo.new(0.3), {Rotation = 180}):Play()
            task.wait(0.6)

            -- Success
            LoginBtn.Text = "✓ AUTHORIZED"
            StatusText.Text = "Loaded, please wait."
            StatusText.TextColor3 = Color3.fromRGB(0, 255, 140)
            
            TweenService:Create(LoginBtn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(0, 255, 140)}):Play()
            TweenService:Create(Stroke, TweenInfo.new(0.3), {Color = Color3.fromRGB(0, 255, 140)}):Play()
            TweenService:Create(Glow, TweenInfo.new(0.3), {ImageColor3 = Color3.fromRGB(0, 255, 140)}):Play()
            task.wait(0.8)

            -- Close animation
            TweenService:Create(Frame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 0, 0, 0)
            }):Play()
            TweenService:Create(Overlay, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
            TweenService:Create(Glow, TweenInfo.new(0.3), {ImageTransparency = 1}):Play()
            task.wait(0.5)
            ScreenGui:Destroy()
            onSuccess()
        end)
    end

    return Auth
end)(UI)

-- PREMIUM LOADING SCREEN
local LoadingScreen = (function(UI)
    local TweenService = game:GetService("TweenService")
    
    local Loading = {}
    
    function Loading.Show(onComplete)
        local Titanium = UI.new()
        local ScreenGui = Titanium.ScreenGui
        
        -- Full screen overlay
        local Overlay = Instance.new("Frame")
        Overlay.Size = UDim2.new(1, 0, 1, 0)
        Overlay.BackgroundColor3 = Color3.fromRGB(8, 8, 12)
        Overlay.BorderSizePixel = 0
        Overlay.Parent = ScreenGui

        -- Center Container
        local Container = Instance.new("Frame")
        Container.Size = UDim2.new(0, 420, 0, 180)
        Container.Position = UDim2.new(0.5, -210, 0.5, -90)
        Container.BackgroundTransparency = 1
        Container.Parent = Overlay

        local Spinner = Instance.new("Frame")
        Spinner.Size = UDim2.new(0, 64, 0, 64)
        Spinner.Position = UDim2.new(0.5, -32, 0, 18)
        Spinner.BackgroundTransparency = 1
        Spinner.Parent = Container

        local SpinnerStroke = Instance.new("UIStroke")
        SpinnerStroke.Thickness = 6
        SpinnerStroke.Color = Color3.fromRGB(0, 170, 255)
        SpinnerStroke.Transparency = 0.05
        SpinnerStroke.Parent = Spinner

        local SpinnerCorner = Instance.new("UICorner")
        SpinnerCorner.CornerRadius = UDim.new(1, 0)
        SpinnerCorner.Parent = Spinner

        local SpinnerGradient = Instance.new("UIGradient")
        SpinnerGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 0, 255))
        })
        SpinnerGradient.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.4, 0.15),
            NumberSequenceKeypoint.new(0.7, 0.5),
            NumberSequenceKeypoint.new(1, 0.95)
        })
        SpinnerGradient.Rotation = 0
        SpinnerGradient.Parent = Spinner

        local StatusText = Instance.new("TextLabel")
        StatusText.Text = "Loading."
        StatusText.Font = Enum.Font.GothamMedium
        StatusText.TextSize = 14
        StatusText.TextColor3 = Color3.fromRGB(245, 245, 250)
        StatusText.Size = UDim2.new(1, 0, 0, 30)
        StatusText.Position = UDim2.new(0, 0, 0, 98)
        StatusText.BackgroundTransparency = 1
        StatusText.Parent = Container

        local spinning = true
        task.spawn(function()
            while spinning and SpinnerGradient and SpinnerGradient.Parent do
                SpinnerGradient.Rotation = (SpinnerGradient.Rotation + 6) % 360
                task.wait(0.016)
            end
        end)

        task.spawn(function()
            task.wait(1.2)

            spinning = false

            -- Fade out
            TweenService:Create(Overlay, TweenInfo.new(0.35), {BackgroundTransparency = 1}):Play()
            TweenService:Create(Container, TweenInfo.new(0.35), {Position = UDim2.new(0.5, -210, 0.45, -90)}):Play()

            for _, child in pairs(Container:GetDescendants()) do
                if child:IsA("TextLabel") then
                    TweenService:Create(child, TweenInfo.new(0.25), {TextTransparency = 1}):Play()
                elseif child:IsA("Frame") then
                    TweenService:Create(child, TweenInfo.new(0.25), {BackgroundTransparency = 1}):Play()
                elseif child:IsA("ImageLabel") then
                    TweenService:Create(child, TweenInfo.new(0.25), {ImageTransparency = 1}):Play()
                elseif child:IsA("UIStroke") then
                    TweenService:Create(child, TweenInfo.new(0.25), {Transparency = 1}):Play()
                end
            end

            task.wait(0.4)
            ScreenGui:Destroy()
            onComplete()
        end)
    end
    
    return Loading
end)(UI)

-- ============================================
-- FEATURE MODULES (Your existing code below)
-- ============================================

local AimFeature = (function()
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local Camera = workspace.CurrentCamera
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local GuiService = game:GetService("GuiService")
    local TweenService = game:GetService("TweenService")

    local Aim = {}
    Aim.__index = Aim

    local Settings = {
        Aimbot = {
            Enabled = false,
            AimLock = false,
            TeamCheck = true,
            FriendCheck = false,
            WallCheck = true,
            AliveCheck = true,
            Hitbox = "Head",
            NearestPart = false,
            FOV = 100,
            DynamicFOV = false,
            Smoothness = 0.2,
            Randomization = 0,
            Prediction = 0.145,
            MaxDistance = 2000,
            AutoFire = false,
            AimOnKey = true,
            Keybind = Enum.UserInputType.MouseButton2,
            TargetPriority = "Distance",
            AutoScope = false
        },
        Triggerbot = {
            Enabled = false,
            Delay = 0.05,
            BurstEnabled = false,
            BurstDelay = 0.15
        },
        FOVCircle = {
            Enabled = true,
            Color = Color3.fromRGB(0, 170, 255),
            Thickness = 1.5,
            Filled = false,
            Transparency = 0.7
        },
        Crosshair = {
            Enabled = false,
            Color = Color3.fromRGB(0, 255, 140),
            Size = 8,
            Gap = 4,
            Thickness = 1.5
        },
        SoftAim = {
            Enabled = false,
            Size = 8,
            Transparency = 1
        },
        HitboxExpander = {
            Enabled = false,
            Size = 2,
            Transparency = 0.5
        }
    }

    local DrawingAvailable = (type(Drawing) == "table" and type(Drawing.new) == "function")
    local FOVCircle = nil
    local Crosshair = {}
    local CurrentTarget = nil
    local Holding = false

    local OriginalHitboxes = {}
    local lastHitboxUpdate = 0

    local function GetEnv()
        local ok, g = pcall(function()
            return (getgenv and getgenv()) or _G
        end)
        if ok and g then return g end
        return _G
    end

    local function DefaultEntityResolver()
        local Resolver = {}

        function Resolver:GetEntities()
            return Players:GetPlayers()
        end

        function Resolver:GetLocalEntity()
            return LocalPlayer
        end

        function Resolver:IsSameEntity(a, b)
            return a == b
        end

        function Resolver:GetEntityId(ent)
            if typeof(ent) == "Instance" then
                return ent:GetDebugId()
            end
            return tostring(ent)
        end

        function Resolver:GetCharacter(ent)
            if ent == nil then return nil end
            if typeof(ent) == "Instance" then
                if ent:IsA("Player") then
                    return ent.Character
                end
                if ent:IsA("Model") then
                    return ent
                end
                if ent:IsA("Humanoid") then
                    return ent.Parent
                end
            elseif type(ent) == "table" then
                local c = ent.Character or ent.character or ent.Model or ent.model or ent.Avatar or ent.avatar
                if typeof(c) == "Instance" and c:IsA("Model") then
                    return c
                end
            end
            return nil
        end

        function Resolver:GetHumanoid(char)
            if not char then return nil end
            local hum = char:FindFirstChildOfClass("Humanoid")
            return hum
        end

        function Resolver:IsAlive(ent)
            local char = self:GetCharacter(ent)
            local hum = self:GetHumanoid(char)
            return hum ~= nil and hum.Health > 0
        end

        function Resolver:GetRootPart(ent)
            local char = self:GetCharacter(ent)
            if not char then return nil end
            return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
        end

        function Resolver:GetAimPart(ent, preferredName)
            local char = self:GetCharacter(ent)
            if not char then return nil end
            if preferredName and type(preferredName) == "string" then
                local p = char:FindFirstChild(preferredName)
                if p and p:IsA("BasePart") then return p end
            end
            local head = char:FindFirstChild("Head")
            if head and head:IsA("BasePart") then return head end
            return self:GetRootPart(ent)
        end

        function Resolver:GetDisplayName(ent)
            if typeof(ent) == "Instance" and ent:IsA("Player") then
                return ent.Name
            end
            local char = self:GetCharacter(ent)
            if char and char.Name then
                return char.Name
            end
            return "Entity"
        end

        function Resolver:GetTeam(ent)
            if typeof(ent) == "Instance" and ent:IsA("Player") then
                return ent.Team
            end
            return nil
        end

        return Resolver
    end

    local function GetEntityResolver()
        local env = GetEnv()
        local r = env and env.TITANIUM_ENTITY_RESOLVER
        if type(r) == "table" and type(r.GetEntities) == "function" then
            return r
        end
        return DefaultEntityResolver()
    end

    local EntityResolver = GetEntityResolver()

    if DrawingAvailable then
        FOVCircle = Drawing.new("Circle")
        FOVCircle.Visible = false
        FOVCircle.Radius = Settings.Aimbot.FOV
        FOVCircle.Color = Settings.FOVCircle.Color
        FOVCircle.Thickness = Settings.FOVCircle.Thickness
        FOVCircle.Filled = Settings.FOVCircle.Filled
        FOVCircle.Transparency = Settings.FOVCircle.Transparency
        FOVCircle.NumSides = 64

        for i = 1, 4 do
            Crosshair[i] = Drawing.new("Line")
            Crosshair[i].Visible = false
            Crosshair[i].Color = Settings.Crosshair.Color
            Crosshair[i].Thickness = Settings.Crosshair.Thickness
        end
    end

    local function GetClosestPlayer()
        local closest = nil
        local shortestDist = Settings.Aimbot.FOV

        local localEnt = EntityResolver:GetLocalEntity()
        local localTeam = EntityResolver:GetTeam(localEnt)

        for _, ent in pairs(EntityResolver:GetEntities()) do
            if not EntityResolver:IsSameEntity(ent, localEnt) then
                if Settings.Aimbot.AliveCheck and not EntityResolver:IsAlive(ent) then
                    continue
                end
                if Settings.Aimbot.TeamCheck then
                    local t = EntityResolver:GetTeam(ent)
                    if t ~= nil and localTeam ~= nil and t == localTeam then
                        continue
                    end
                end

                local targetPart = EntityResolver:GetAimPart(ent, Settings.Aimbot.Hitbox)
                if not targetPart then
                    continue
                end

                local screenPos, onScreen = Camera:WorldToViewportPoint(targetPart.Position)
                if not onScreen then continue end

                local mouse = UserInputService:GetMouseLocation()
                local dist = (Vector2.new(screenPos.X, screenPos.Y) - mouse).Magnitude

                if dist < shortestDist then
                    if Settings.Aimbot.WallCheck then
                        local ray = Ray.new(Camera.CFrame.Position, (targetPart.Position - Camera.CFrame.Position).Unit * 2000)
                        local ignore = {}
                        local lc = EntityResolver:GetCharacter(localEnt)
                        if lc then table.insert(ignore, lc) end
                        local hit = workspace:FindPartOnRayWithIgnoreList(ray, ignore)

                        local char = EntityResolver:GetCharacter(ent)
                        if hit and char and hit:IsDescendantOf(char) then
                            shortestDist = dist
                            closest = ent
                        end
                    else
                        shortestDist = dist
                        closest = ent
                    end
                end
            end
        end

        return closest
    end

    local function RestoreHitbox(plr)
        local data = OriginalHitboxes[plr]
        if not data then return end
        if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = plr.Character.HumanoidRootPart
            if hrp and hrp:IsA("BasePart") then
                if data.Size then hrp.Size = data.Size end
                if data.Transparency ~= nil then hrp.Transparency = data.Transparency end
            end
        end
        OriginalHitboxes[plr] = nil
    end

    -- Simplified Hitbox Expander taken from OLDMAIN.LUA
    local function ApplyHitboxExpander()
        if not Settings.HitboxExpander.Enabled then return end

        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                if not Settings.Aimbot.TeamCheck or plr.Team ~= LocalPlayer.Team then
                    local hrp = plr.Character.HumanoidRootPart
                    hrp.Size = Vector3.new(Settings.HitboxExpander.Size, Settings.HitboxExpander.Size, Settings.HitboxExpander.Size)
                    hrp.Transparency = Settings.HitboxExpander.Transparency
                end
            end
        end
    end

    -- Silent Aim (soft aim) implementation
    local function GetClosestPlayerToCursor(fov)
        local closest, dist = nil, fov
        local mousePos = UserInputService:GetMouseLocation()
        local localEnt = EntityResolver:GetLocalEntity()
        local localTeam = EntityResolver:GetTeam(localEnt)

        for _, ent in ipairs(EntityResolver:GetEntities()) do
            if not EntityResolver:IsSameEntity(ent, localEnt) then
                if Settings.Aimbot.TeamCheck then
                    local t = EntityResolver:GetTeam(ent)
                    if t ~= nil and localTeam ~= nil and t == localTeam then
                        continue
                    end
                end

                local aimPart = EntityResolver:GetAimPart(ent, "Head")
                if aimPart then
                    local pos, onScreen = Camera:WorldToViewportPoint(aimPart.Position)
                    if onScreen then
                        local mag = (Vector2.new(pos.X, pos.Y) - mousePos).Magnitude
                        if mag < dist then
                            dist = mag
                            closest = ent
                        end
                    end
                end
            end
        end
        return closest
    end

 -- Silent Aim Raycast Hook
do
    local success, mt = pcall(getrawmetatable, game)
    if success and mt and not rawget(mt, "__titanium_silentaim") then
        local oldNamecall = mt.__namecall
        setreadonly(mt, false)
        mt.__namecall = newcclosure(function(self, ...)
            local args = {...}
            local method = getnamecallmethod()

            if Settings and Settings.Combat.SilentAim.Enabled and (method == "FindPartOnRay" or method == "FindPartOnRayWithIgnoreList" or method == "Raycast") then
                local target = GetClosestPlayerToCursor(Settings.Combat.SilentAim.FOV)
                local targetPart = EntityResolver:GetAimPart(target, Settings.Combat.SilentAim.TargetPart)
                    if targetPart then
                        if method == "Raycast" then
                            -- args[1] = origin, args[2] = direction
                            args[2] = (targetPart.Position - args[1]).Unit * 1000
                            return oldNamecall(self, unpack(args))
                        else
                            -- FindPartOnRay / FindPartOnRayWithIgnoreList
                            local origin = args[1].Origin or args[1].Position
                            args[1] = Ray.new(origin, (targetPart.Position - origin).Unit * 1000)
                            return oldNamecall(self, unpack(args))
                        end
                    end
            end

            return oldNamecall(self, ...)
        end)

        rawset(mt, "__titanium_silentaim", true)
        setreadonly(mt, true)
    end
end

    function Aim.Init(Window)
        local Tab = Window:Tab("Aimbot", "◎")

        Tab:Section("AIMBOT")
        Tab:Toggle("Enable Aimbot", false, function(s) Settings.Aimbot.Enabled = s end)
        Tab:Toggle("Aim Lock", false, function(s) Settings.Aimbot.AimLock = s end)
        Tab:Slider("FOV Size", 50, 500, 100, function(v) 
            Settings.Aimbot.FOV = v
            if FOVCircle then FOVCircle.Radius = v end
        end)
        Tab:Slider("Smoothness", 0, 100, 20, function(v) Settings.Aimbot.Smoothness = v / 100 end)
        Tab:Slider("Prediction", 0, 50, 15, function(v) Settings.Aimbot.Prediction = v / 100 end)

        Tab:Section("CHECKS")
        Tab:Toggle("Team Check", true, function(s) Settings.Aimbot.TeamCheck = s end)
        Tab:Toggle("Wall Check", true, function(s) Settings.Aimbot.WallCheck = s end)
        Tab:Toggle("Alive Check", true, function(s) Settings.Aimbot.AliveCheck = s end)

        Tab:Section("VISUALS")
        Tab:Toggle("FOV Circle", true, function(s) 
            Settings.FOVCircle.Enabled = s
            if FOVCircle then FOVCircle.Visible = s end
        end)
        Tab:Toggle("Crosshair", false, function(s) 
            Settings.Crosshair.Enabled = s
            for _, line in pairs(Crosshair) do
                if line then line.Visible = s end
            end
        end)

        Tab:Section("TRIGGERBOT")
        Tab:Toggle("Triggerbot", false, function(s) Settings.Triggerbot.Enabled = s end)
        Tab:Slider("Trigger Delay (ms)", 0, 200, 50, function(v) Settings.Triggerbot.Delay = v / 1000 end)

        Tab:Section("RAGE")
        Tab:Toggle("Hitbox Expander", false, function(s) Settings.HitboxExpander.Enabled = s end)
        Tab:Slider("Hitbox Size", 1, 20, 2, function(v) Settings.HitboxExpander.Size = v end)
        Tab:Slider("Hitbox Transparency", 0, 100, 50, function(v) Settings.HitboxExpander.Transparency = v / 100 end)

        Tab:Section("SOFT AIM")
        Tab:Toggle("Soft Aim", false, function(s)
            Settings.SoftAim.Enabled = s
            -- Force aimbot + hitbox expander while soft aim is on
            Settings.Aimbot.Enabled = s
            Settings.HitboxExpander.Enabled = s
            Settings.HitboxExpander.Transparency = 1
        end)
        Tab:Slider("Soft Aim Size", 1, 50, 8, function(v)
            Settings.SoftAim.Size = v
            Settings.HitboxExpander.Size = v
            Settings.HitboxExpander.Transparency = 1
        end)

        -- Input handling
        UserInputService.InputBegan:Connect(function(input, gpe)
            -- allow aim key even when gameProcessedEvent is true (tools/guns often set gpe)
            if input.UserInputType == Settings.Aimbot.Keybind then
                Holding = true
            end
        end)

        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Settings.Aimbot.Keybind then
                Holding = false
                CurrentTarget = nil
            end
        end)

        -- Main loop
        RunService.RenderStepped:Connect(function()
            local mouse = UserInputService:GetMouseLocation()

            local now = os.clock()
            if now - lastHitboxUpdate > 0.2 then
                lastHitboxUpdate = now
                ApplyHitboxExpander()
            end

            if DrawingAvailable then
                if Settings.FOVCircle.Enabled and FOVCircle then
                    FOVCircle.Position = mouse
                    FOVCircle.Radius = Settings.Aimbot.FOV
                    FOVCircle.Visible = true
                elseif FOVCircle then
                    FOVCircle.Visible = false
                end

                if Settings.Crosshair.Enabled then
                    local center = Camera.ViewportSize / 2
                    local size = Settings.Crosshair.Size
                    local gap = Settings.Crosshair.Gap

                    Crosshair[1].From = Vector2.new(center.X - gap - size, center.Y)
                    Crosshair[1].To = Vector2.new(center.X - gap, center.Y)
                    Crosshair[2].From = Vector2.new(center.X + gap, center.Y)
                    Crosshair[2].To = Vector2.new(center.X + gap + size, center.Y)
                    Crosshair[3].From = Vector2.new(center.X, center.Y - gap - size)
                    Crosshair[3].To = Vector2.new(center.X, center.Y - gap)
                    Crosshair[4].From = Vector2.new(center.X, center.Y + gap)
                    Crosshair[4].To = Vector2.new(center.X, center.Y + gap + size)

                    for _, line in pairs(Crosshair) do
                        line.Visible = true
                        line.Color = Settings.Crosshair.Color
                    end
                else
                    for _, line in pairs(Crosshair) do
                        if line then line.Visible = false end
                    end
                end
            end

            if Settings.Aimbot.Enabled and Holding then
                if not CurrentTarget or Settings.Aimbot.AimLock == false then
                    CurrentTarget = GetClosestPlayer()
                end

                if CurrentTarget and CurrentTarget.Character then
                    local targetPart = CurrentTarget.Character:FindFirstChild(Settings.Aimbot.Hitbox) or CurrentTarget.Character:FindFirstChild("HumanoidRootPart")
                    if targetPart then
                        local predictedPos = targetPart.Position
                        if Settings.Aimbot.Prediction > 0 and targetPart:IsA("BasePart") then
                            predictedPos = predictedPos + (targetPart.Velocity * Settings.Aimbot.Prediction)
                        end

                        if predictedPos then
                            local aimCF = CFrame.new(Camera.CFrame.Position, predictedPos)
                            if Settings.Aimbot.Smoothness and Settings.Aimbot.Smoothness > 0 then
                                Camera.CFrame = Camera.CFrame:Lerp(aimCF, 1 - Settings.Aimbot.Smoothness)
                            else
                                Camera.CFrame = aimCF
                            end
                        end
                    end
                end
            end
        end)
    end

    return Aim
end)()

 local VisualsFeature = (function()
     local Players = game:GetService("Players")
     local LocalPlayer = Players.LocalPlayer
     local RunService = game:GetService("RunService")
     local CoreGui = game:GetService("CoreGui")
     local Camera = workspace.CurrentCamera
     local Lighting = game:GetService("Lighting")
     local UserInputService = game:GetService("UserInputService")
 
     local Visuals = {}
     local Highlights = Instance.new("Folder", CoreGui)
     Highlights.Name = "Titanium_Highlights"
     Highlights.Parent = CoreGui
 
     local Drawings = {}
 
     local DrawingAvailable = (type(Drawing) == "table" and type(Drawing.new) == "function")
 
     local Settings = {
         Master = false,
         Boxes = false,
         BoxType = "2D",
         Skeleton = false,
         Names = false,
         Distance = false,
         HealthBar = false,
         ArmorBar = false,
         Weapon = false,
         Tracers = false,
         TracerOrigin = "Bottom",
         Snaplines = false,
         Chams = false,
         OutViewArrows = false,
         HeadDot = false,
         LookTracers = false,
         Ammo = false,

         BoxThickness = 2,
         BoxTransparency = 1,
         CornerLength = 8,
         Outline = true,
         TextSize = 13,

         UseTeamColors = true,
         CustomColors = {
             Box = Color3.fromRGB(0, 255, 0),
             Tracer = Color3.fromRGB(255, 0, 0),
             Text = Color3.fromRGB(255, 255, 255),
             Skeleton = Color3.fromRGB(255, 255, 255)
         },

         Fullbright = false,
         Ambience = false,
         NoFog = false,
         XRay = false,
         ItemESP = false,
         BulletTracers = false,
         HitMarkers = false,
         DamageInd = false,
         ThirdPerson = false,
         ThirdPersonDist = 10,
         FOVChanger = false,
         FOVValue = 90,
         TimeOfDay = 14,
         RainbowSky = false,
         RainbowSkySpeed = 1,
         RainbowChams = false,
         RainbowChamsSpeed = 1,

         MaxDistance = 2000,
         RenderDist = 2000,
         Crosshair = false,

         Colors = {
             Enemy = Color3.fromRGB(255, 60, 60),
             Team = Color3.fromRGB(60, 255, 60),
             Skeleton = Color3.fromRGB(255, 255, 255),
             ChamsFill = Color3.fromRGB(255, 0, 0),
             ChamsOutline = Color3.fromRGB(255, 255, 255)
         },
         ColorsRGB = {
             Enemy = {R = 255, G = 60, B = 60},
             Team = {R = 60, G = 255, B = 60},
             Skeleton = {R = 255, G = 255, B = 255},
             ChamsFill = {R = 255, G = 0, B = 0},
             ChamsOutline = {R = 255, G = 255, B = 255}
         }
     }
 
     local skyHue = 0
     local chamsHue = 0
 
     local function NewDrawing(typeName)
         if not DrawingAvailable then
             return nil
         end
         local d = Drawing.new(typeName)
         d.Visible = false
         return d
     end

     local function HideAll(p)
         if not p then return end
         if p.Box2D then p.Box2D.Visible = false end
         if p.Box2DOutline then p.Box2DOutline.Visible = false end
         if p.Name then p.Name.Visible = false end
         if p.Dist then p.Dist.Visible = false end
         if p.Weapon then p.Weapon.Visible = false end
         if p.Tracer then p.Tracer.Visible = false end
         if p.Snapline then p.Snapline.Visible = false end
         if p.HeadDot then p.HeadDot.Visible = false end
         if p.HealthBarOutline then p.HealthBarOutline.Visible = false end
         if p.HealthBarFill then p.HealthBarFill.Visible = false end
         if p.ArmorBarOutline then p.ArmorBarOutline.Visible = false end
         if p.ArmorBarFill then p.ArmorBarFill.Visible = false end
         if p.Corners then
             for _, l in pairs(p.Corners) do
                 if l then l.Visible = false end
             end
         end
         if p.CornersOutline then
             for _, l in pairs(p.CornersOutline) do
                 if l then l.Visible = false end
             end
         end
         if p.Skeleton then
             for _, l in pairs(p.Skeleton) do
                 if l then l.Visible = false end
             end
         end
     end
 
     local function AddPlayerDrawings(plr)
         if not DrawingAvailable then return end
         local box2d = NewDrawing("Square")
         if box2d then box2d.Filled = false end
         local box2dOutline = NewDrawing("Square")
         if box2dOutline then
             box2dOutline.Filled = false
             box2dOutline.Color = Color3.new(0, 0, 0)
         end

         local function NewCornerSet()
             local t = {}
             for i = 1, 8 do
                 t[i] = NewDrawing("Line")
             end
             return t
         end

         local corners = NewCornerSet()
         local cornersOutline = NewCornerSet()
         for _, l in pairs(cornersOutline) do
             if l then l.Color = Color3.new(0, 0, 0) end
         end

         local skeletonLines = {}
         for i = 1, 12 do
             skeletonLines[i] = NewDrawing("Line")
         end

         local name = NewDrawing("Text")
         if name then
             name.Center = true
             name.Outline = true
             name.Color = Color3.new(1, 1, 1)
         end

         local dist = NewDrawing("Text")
         if dist then
             dist.Center = true
             dist.Outline = true
             dist.Color = Color3.new(1, 1, 1)
         end

         local weapon = NewDrawing("Text")
         if weapon then
             weapon.Center = true
             weapon.Outline = true
             weapon.Color = Color3.new(1, 1, 1)
         end

         local healthBarOutline = NewDrawing("Square")
         if healthBarOutline then
             healthBarOutline.Filled = true
             healthBarOutline.Color = Color3.new(0, 0, 0)
         end
         local healthBarFill = NewDrawing("Square")
         if healthBarFill then
             healthBarFill.Filled = true
             healthBarFill.Color = Color3.fromRGB(60, 255, 60)
         end

         local armorBarOutline = NewDrawing("Square")
         if armorBarOutline then
             armorBarOutline.Filled = true
             armorBarOutline.Color = Color3.new(0, 0, 0)
         end
         local armorBarFill = NewDrawing("Square")
         if armorBarFill then
             armorBarFill.Filled = true
             armorBarFill.Color = Color3.fromRGB(60, 170, 255)
         end

         local tracer = NewDrawing("Line")
         local snapline = NewDrawing("Line")
         local headDot = NewDrawing("Circle")
         if headDot then headDot.Filled = true end

         Drawings[plr] = {
             Box2D = box2d,
             Box2DOutline = box2dOutline,
             Corners = corners,
             CornersOutline = cornersOutline,
             Skeleton = skeletonLines,
             Name = name,
             Dist = dist,
             Weapon = weapon,
             Tracer = tracer,
             Snapline = snapline,
             HeadDot = headDot,
             HealthBarOutline = healthBarOutline,
             HealthBarFill = healthBarFill,
             ArmorBarOutline = armorBarOutline,
             ArmorBarFill = armorBarFill
         }

         HideAll(Drawings[plr])
     end

     local function RemovePlayerDrawings(plr)
         local dtable = Drawings[plr]
         if dtable then
             HideAll(dtable)
             for _, d in pairs(dtable) do
                 if type(d) == "table" then
                     for _, sd in pairs(d) do
                         if sd and type(sd) == "userdata" and sd.Remove then
                             pcall(function() sd:Remove() end)
                         end
                     end
                 elseif d and type(d) == "userdata" and d.Remove then
                     pcall(function() d:Remove() end)
                 end
             end
         end
         Drawings[plr] = nil
     end
 
     function Visuals.Init(Window)
         local Tab = Window:Tab("Visuals")
 
         Tab:Section("ESP Main")
         Tab:Toggle("Enable ESP", false, function(s)
             Settings.Master = s
             if not s then Highlights:ClearAllChildren() end
         end)
 
         Tab:Section("Player Visuals")
         Tab:Toggle("Box ESP", false, function(s) Settings.Boxes = s end)
         Tab:Toggle("Use Team Colors", true, function(s) Settings.UseTeamColors = s end)
         Tab:Button("Box Mode: 2D", function()
             if Settings.BoxType == "2D" then
                 Settings.BoxType = "Corner"
             else
                 Settings.BoxType = "2D"
             end
         end)
         Tab:Toggle("Box Outline", true, function(s) Settings.Outline = s end)
         Tab:Slider("Box Thickness", 1, 6, 2, function(v) Settings.BoxThickness = v end)
         Tab:Slider("Box Transparency", 0, 100, 100, function(v) Settings.BoxTransparency = v / 100 end)
         Tab:Slider("Corner Length", 4, 20, 8, function(v) Settings.CornerLength = v end)
         Tab:Slider("Text Size", 10, 18, 13, function(v) Settings.TextSize = v end)
         Tab:Toggle("Skeleton ESP", false, function(s) Settings.Skeleton = s end)
         Tab:Toggle("Chams (Glow)", false, function(s) Settings.Chams = s end)
         Tab:Toggle("Name Tags", false, function(s) Settings.Names = s end)
         Tab:Toggle("Health Bar", false, function(s) Settings.HealthBar = s end)
         Tab:Toggle("Armor Bar", false, function(s) Settings.ArmorBar = s end)
         Tab:Toggle("Weapon Text", false, function(s) Settings.Weapon = s end)
         Tab:Toggle("Distance", false, function(s) Settings.Distance = s end)

         Tab:Section("ESP Colors")
         Tab:Slider("Box Color R", 0, 255, 0, function(v) Settings.CustomColors.Box = Color3.fromRGB(v, math.floor(Settings.CustomColors.Box.G * 255 + 0.5), math.floor(Settings.CustomColors.Box.B * 255 + 0.5)) end)
         Tab:Slider("Box Color G", 0, 255, 255, function(v) Settings.CustomColors.Box = Color3.fromRGB(math.floor(Settings.CustomColors.Box.R * 255 + 0.5), v, math.floor(Settings.CustomColors.Box.B * 255 + 0.5)) end)
         Tab:Slider("Box Color B", 0, 255, 0, function(v) Settings.CustomColors.Box = Color3.fromRGB(math.floor(Settings.CustomColors.Box.R * 255 + 0.5), math.floor(Settings.CustomColors.Box.G * 255 + 0.5), v) end)

         Tab:Slider("Tracer Color R", 0, 255, 255, function(v) Settings.CustomColors.Tracer = Color3.fromRGB(v, math.floor(Settings.CustomColors.Tracer.G * 255 + 0.5), math.floor(Settings.CustomColors.Tracer.B * 255 + 0.5)) end)
         Tab:Slider("Tracer Color G", 0, 255, 0, function(v) Settings.CustomColors.Tracer = Color3.fromRGB(math.floor(Settings.CustomColors.Tracer.R * 255 + 0.5), v, math.floor(Settings.CustomColors.Tracer.B * 255 + 0.5)) end)
         Tab:Slider("Tracer Color B", 0, 255, 0, function(v) Settings.CustomColors.Tracer = Color3.fromRGB(math.floor(Settings.CustomColors.Tracer.R * 255 + 0.5), math.floor(Settings.CustomColors.Tracer.G * 255 + 0.5), v) end)

         Tab:Slider("Text Color R", 0, 255, 255, function(v) Settings.CustomColors.Text = Color3.fromRGB(v, math.floor(Settings.CustomColors.Text.G * 255 + 0.5), math.floor(Settings.CustomColors.Text.B * 255 + 0.5)) end)
         Tab:Slider("Text Color G", 0, 255, 255, function(v) Settings.CustomColors.Text = Color3.fromRGB(math.floor(Settings.CustomColors.Text.R * 255 + 0.5), v, math.floor(Settings.CustomColors.Text.B * 255 + 0.5)) end)
         Tab:Slider("Text Color B", 0, 255, 255, function(v) Settings.CustomColors.Text = Color3.fromRGB(math.floor(Settings.CustomColors.Text.R * 255 + 0.5), math.floor(Settings.CustomColors.Text.G * 255 + 0.5), v) end)

         Tab:Slider("Skeleton Color R", 0, 255, 255, function(v) Settings.CustomColors.Skeleton = Color3.fromRGB(v, math.floor(Settings.CustomColors.Skeleton.G * 255 + 0.5), math.floor(Settings.CustomColors.Skeleton.B * 255 + 0.5)) end)
         Tab:Slider("Skeleton Color G", 0, 255, 255, function(v) Settings.CustomColors.Skeleton = Color3.fromRGB(math.floor(Settings.CustomColors.Skeleton.R * 255 + 0.5), v, math.floor(Settings.CustomColors.Skeleton.B * 255 + 0.5)) end)
         Tab:Slider("Skeleton Color B", 0, 255, 255, function(v) Settings.CustomColors.Skeleton = Color3.fromRGB(math.floor(Settings.CustomColors.Skeleton.R * 255 + 0.5), math.floor(Settings.CustomColors.Skeleton.G * 255 + 0.5), v) end)
 
         Tab:Section("Tracers & Indicators")
         Tab:Toggle("Tracers", false, function(s) Settings.Tracers = s end)
         Tab:Toggle("Snaplines", false, function(s) Settings.Snaplines = s end)
         Tab:Toggle("Look Tracers", false, function(s) Settings.LookTracers = s end)
         Tab:Toggle("Head Dot", false, function(s) Settings.HeadDot = s end)
         Tab:Toggle("Offscreen Arrows", false, function(s) Settings.OutViewArrows = s end)
 
         Tab:Section("World Visuals")
         Tab:Toggle("Fullbright", false, function(s) Settings.Fullbright = s end)
         Tab:Toggle("No Fog", false, function(s) Settings.NoFog = s end)
         Tab:Slider("Time of Day", 0, 24, 14, function(v) Settings.TimeOfDay = v end)
         Tab:Toggle("Rainbow Sky", false, function(s) Settings.RainbowSky = s end)
         Tab:Slider("Rainbow Sky Speed", 1, 20, 5, function(v) Settings.RainbowSkySpeed = v end)
         Tab:Toggle("Rainbow Chams", false, function(s) Settings.RainbowChams = s end)
         Tab:Slider("Rainbow Chams Speed", 1, 20, 5, function(v) Settings.RainbowChamsSpeed = v end)
         Tab:Toggle("Crosshair", false, function(s) Settings.Crosshair = s end)
         Tab:Toggle("Third Person", false, function(s) Settings.ThirdPerson = s end)
         Tab:Slider("TP Dist", 5, 50, 10, function(v) Settings.ThirdPersonDist = v end)
         Tab:Toggle("FOV Changer", false, function(s) Settings.FOVChanger = s end)
         Tab:Slider("Field of View", 70, 120, 90, function(v) Settings.FOVValue = v end)
 
         if not DrawingAvailable then
             Tab:Section("ESP Status")
             Tab:Button("Drawing API not available", function() end)
         end
 
         RunService.RenderStepped:Connect(function(dt)
             if Settings.Fullbright then
                 Lighting.Brightness = 2
                 Lighting.ClockTime = 14
                 Lighting.GlobalShadows = false
                 Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
             end
 
             if Settings.NoFog then
                 Lighting.FogEnd = 100000
             end
 
             if Settings.RainbowSky then
                 skyHue = (skyHue + (dt or 0) * (Settings.RainbowSkySpeed / 10)) % 1
                 local col = Color3.fromHSV(skyHue, 0.6, 1)
                 Lighting.Ambient = col
                 Lighting.OutdoorAmbient = col
                 Lighting.ClockTime = (skyHue * 24) % 24
             else
                 Lighting.ClockTime = Settings.TimeOfDay
             end
 
             if Settings.FOVChanger then
                 Camera.FieldOfView = Settings.FOVValue
             end
         end)
 
         local function SetLine(line, from, to, color, thickness, transparency)
             if not line then return end
             line.Visible = true
             line.From = from
             line.To = to
             line.Color = color
             if thickness then line.Thickness = thickness end
             if transparency then line.Transparency = transparency end
         end

         local function DrawCornerBox(p, pos, size, color)
             if not p or not p.Corners then return end

             local x, y = pos.X, pos.Y
             local w, h = size.X, size.Y
             local l = math.clamp(Settings.CornerLength, 2, math.floor(math.min(w, h) / 2))
             local t = Settings.BoxThickness
             local tr = Settings.BoxTransparency

             local function render(set, c, thick)
                 -- top-left
                 SetLine(set[1], Vector2.new(x, y), Vector2.new(x + l, y), c, thick, tr)
                 SetLine(set[2], Vector2.new(x, y), Vector2.new(x, y + l), c, thick, tr)
                 -- top-right
                 SetLine(set[3], Vector2.new(x + w, y), Vector2.new(x + w - l, y), c, thick, tr)
                 SetLine(set[4], Vector2.new(x + w, y), Vector2.new(x + w, y + l), c, thick, tr)
                 -- bottom-left
                 SetLine(set[5], Vector2.new(x, y + h), Vector2.new(x + l, y + h), c, thick, tr)
                 SetLine(set[6], Vector2.new(x, y + h), Vector2.new(x, y + h - l), c, thick, tr)
                 -- bottom-right
                 SetLine(set[7], Vector2.new(x + w, y + h), Vector2.new(x + w - l, y + h), c, thick, tr)
                 SetLine(set[8], Vector2.new(x + w, y + h), Vector2.new(x + w, y + h - l), c, thick, tr)
             end

             if Settings.Outline and p.CornersOutline then
                 render(p.CornersOutline, Color3.new(0, 0, 0), t + 2)
             else
                 if p.CornersOutline then
                     for _, ln in pairs(p.CornersOutline) do
                         if ln then ln.Visible = false end
                     end
                 end
             end
             render(p.Corners, color, t)
         end

         local function GetCharacter2DBounds(char)
             if not char then return nil end
             local ok, cf, sz = pcall(function()
                 return char:GetBoundingBox()
             end)
             if not ok or not cf or not sz then return nil end

             local hx, hy, hz = sz.X / 2, sz.Y / 2, sz.Z / 2
             local corners = {
                 Vector3.new(-hx, -hy, -hz), Vector3.new(hx, -hy, -hz), Vector3.new(-hx, hy, -hz), Vector3.new(hx, hy, -hz),
                 Vector3.new(-hx, -hy, hz),  Vector3.new(hx, -hy, hz),  Vector3.new(-hx, hy, hz),  Vector3.new(hx, hy, hz)
             }

             local minX, minY = math.huge, math.huge
             local maxX, maxY = -math.huge, -math.huge
             local anyVisible = false
             local behind = 0

             for _, off in pairs(corners) do
                 local world = (cf * CFrame.new(off)).Position
                 local v, onscreen = Camera:WorldToViewportPoint(world)
                 if v.Z <= 0 then
                     behind += 1
                 end
                 if onscreen and v.Z > 0 then
                     anyVisible = true
                 end
                 minX = math.min(minX, v.X)
                 minY = math.min(minY, v.Y)
                 maxX = math.max(maxX, v.X)
                 maxY = math.max(maxY, v.Y)
             end

             if behind == #corners then
                 return nil
             end

             local w = maxX - minX
             local h = maxY - minY
             if w < 2 or h < 2 then
                 return nil
             end

             -- small padding + clamp to viewport to reduce jitter/snapping at edges
             local pad = 1
             minX -= pad
             minY -= pad
             maxX += pad
             maxY += pad
             minX = math.clamp(minX, 0, Camera.ViewportSize.X)
             maxX = math.clamp(maxX, 0, Camera.ViewportSize.X)
             minY = math.clamp(minY, 0, Camera.ViewportSize.Y)
             maxY = math.clamp(maxY, 0, Camera.ViewportSize.Y)

             w = maxX - minX
             h = maxY - minY
             if w < 2 or h < 2 then
                 return nil
             end

             local pos = Vector2.new(minX, minY)
             local size = Vector2.new(w, h)
             local center = Vector2.new((minX + maxX) / 2, (minY + maxY) / 2)
             return {
                 Pos = pos,
                 Size = size,
                 Center = center,
                 AnyVisible = anyVisible
             }
         end

         RunService.RenderStepped:Connect(function(dt)
             if not Settings.Master then
                 for plr, _ in pairs(Drawings) do
                     RemovePlayerDrawings(plr)
                 end
                 return
             end

             local players = Players:GetPlayers()
             local playerSet = {}
             for _, p in pairs(players) do
                 playerSet[p] = true
             end
             for plr, _ in pairs(Drawings) do
                 if plr ~= LocalPlayer and not playerSet[plr] then
                     RemovePlayerDrawings(plr)
                 end
             end
             for _, plr in pairs(players) do
                 if plr ~= LocalPlayer then
                     if not Drawings[plr] then AddPlayerDrawings(plr) end
                     local d = Drawings[plr]
                     if not d then
                         continue
                     end
 
                     if plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
                        local char = plr.Character
                        local hrp = char:FindFirstChild("HumanoidRootPart")
                        if not hrp then
                            HideAll(d)
                            continue
                        end

                        local hum = char:FindFirstChild("Humanoid")
                        local dist = (Camera.CFrame.Position - hrp.Position).Magnitude
 
                         local isEnemy = true
                         if plr.Team ~= nil and LocalPlayer.Team ~= nil then
                             isEnemy = (plr.Team ~= LocalPlayer.Team)
                         end
                         local mainColor = isEnemy and Settings.Colors.Enemy or Settings.Colors.Team
                         local boxColor = Settings.UseTeamColors and mainColor or Settings.CustomColors.Box
                         local tracerColor = Settings.UseTeamColors and mainColor or Settings.CustomColors.Tracer
                         local textColor = Settings.UseTeamColors and mainColor or Settings.CustomColors.Text
                         local skeletonColor = Settings.UseTeamColors and mainColor or Settings.CustomColors.Skeleton

                         local bounds = GetCharacter2DBounds(char)
                        if bounds and bounds.AnyVisible and dist <= Settings.RenderDist then
                            local pos = bounds.Pos
                            local size = bounds.Size
                            local width = size.X
                            local height = size.Y
                            local center = bounds.Center

                             if Settings.Chams then
                                 if not plr.Character:FindFirstChild("TitaniumHighlight") then
                                     local h = Instance.new("Highlight", plr.Character)
                                     h.Name = "TitaniumHighlight"
                                     h.FillColor = Settings.Colors.ChamsFill
                                     h.OutlineColor = Settings.Colors.ChamsOutline
                                 end
                                 local h = plr.Character:FindFirstChild("TitaniumHighlight")
                                 if h then
                                     if Settings.RainbowChams then
                                         chamsHue = (chamsHue + (dt or 0) * (Settings.RainbowChamsSpeed / 10)) % 1
                                         local col = Color3.fromHSV(chamsHue, 0.6, 1)
                                         h.FillColor = col
                                         h.OutlineColor = col
                                     else
                                         h.FillColor = Settings.Colors.ChamsFill
                                         h.OutlineColor = Settings.Colors.ChamsOutline
                                     end
                                 end
                             else
                                 if plr.Character:FindFirstChild("TitaniumHighlight") then
                                     plr.Character.TitaniumHighlight:Destroy()
                                 end
                             end

                             if Settings.Boxes then
                                if Settings.BoxType == "2D" then
                                    if d.Box2D then
                                        d.Box2D.Visible = true
                                        d.Box2D.Size = size
                                        d.Box2D.Position = pos
                                        d.Box2D.Color = boxColor
                                        d.Box2D.Thickness = Settings.BoxThickness
                                        d.Box2D.Transparency = Settings.BoxTransparency
                                    end
                                    if Settings.Outline and d.Box2DOutline then
                                        d.Box2DOutline.Visible = true
                                        d.Box2DOutline.Size = size
                                        d.Box2DOutline.Position = pos
                                        d.Box2DOutline.Thickness = Settings.BoxThickness + 2
                                        d.Box2DOutline.Transparency = Settings.BoxTransparency
                                    elseif d.Box2DOutline then
                                        d.Box2DOutline.Visible = false
                                    end
                                    if d.Corners then
                                        for _, ln in pairs(d.Corners) do if ln then ln.Visible = false end end
                                    end
                                    if d.CornersOutline then
                                        for _, ln in pairs(d.CornersOutline) do if ln then ln.Visible = false end end
                                    end
                                else
                                    if d.Box2D then d.Box2D.Visible = false end
                                    if d.Box2DOutline then d.Box2DOutline.Visible = false end
                                    DrawCornerBox(d, pos, size, boxColor)
                                end
                            else
                                if d.Box2D then d.Box2D.Visible = false end
                                if d.Box2DOutline then d.Box2DOutline.Visible = false end
                                if d.Corners then for _, ln in pairs(d.Corners) do if ln then ln.Visible = false end end end
                                if d.CornersOutline then for _, ln in pairs(d.CornersOutline) do if ln then ln.Visible = false end end end
                            end

                             if d.Name then
                                d.Name.Visible = Settings.Names
                                if Settings.Names then
                                    d.Name.Text = plr.Name
                                    d.Name.Position = Vector2.new(center.X, pos.Y - 15)
                                    d.Name.Size = Settings.TextSize
                                    d.Name.Color = textColor
                                end
                            end

                             if d.Weapon then
                                d.Weapon.Visible = Settings.Weapon
                                if Settings.Weapon then
                                    local tool = char:FindFirstChildOfClass("Tool")
                                    d.Weapon.Text = tool and tool.Name or ""
                                    d.Weapon.Position = Vector2.new(center.X, pos.Y + height + 14)
                                    d.Weapon.Size = Settings.TextSize - 1
                                    d.Weapon.Color = textColor
                                end
                            end

                             if d.Dist then
                                d.Dist.Visible = Settings.Distance
                                if Settings.Distance then
                                    d.Dist.Text = ("%dm"):format(math.floor(dist))
                                    d.Dist.Position = Vector2.new(center.X, pos.Y + height + 2)
                                    d.Dist.Size = Settings.TextSize - 1
                                    d.Dist.Color = textColor
                                end
                            end

                            if Settings.Skeleton and d.Skeleton then
                                local function w2v(part)
                                    if not part then return nil end
                                    local v, ok = Camera:WorldToViewportPoint(part.Position)
                                    if not ok then return nil end
                                    return Vector2.new(v.X, v.Y)
                                end

                                local headP = char:FindFirstChild("Head")
                                local hrpP = char:FindFirstChild("HumanoidRootPart")
                                local ut = char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso")
                                local lt = char:FindFirstChild("LowerTorso") or ut
                                local lua = char:FindFirstChild("LeftUpperArm")
                                local lla = char:FindFirstChild("LeftLowerArm")
                                local rua = char:FindFirstChild("RightUpperArm")
                                local rla = char:FindFirstChild("RightLowerArm")
                                local lul = char:FindFirstChild("LeftUpperLeg")
                                local lll = char:FindFirstChild("LeftLowerLeg")
                                local rul = char:FindFirstChild("RightUpperLeg")
                                local rll = char:FindFirstChild("RightLowerLeg")

                                local pairsToDraw = {
                                    {headP, ut},
                                    {ut, lt},
                                    {ut, lua},
                                    {lua, lla},
                                    {ut, rua},
                                    {rua, rla},
                                    {lt, lul},
                                    {lul, lll},
                                    {lt, rul},
                                    {rul, rll},
                                    {lt, hrpP}
                                }

                                local idx = 1
                                for _, pr in pairs(pairsToDraw) do
                                    local a = w2v(pr[1])
                                    local b = w2v(pr[2])
                                    local ln = d.Skeleton[idx]
                                    if ln and a and b then
                                        ln.Visible = true
                                        ln.From = a
                                        ln.To = b
                                        ln.Color = skeletonColor
                                        ln.Thickness = 1
                                        ln.Transparency = Settings.BoxTransparency
                                    elseif ln then
                                        ln.Visible = false
                                    end
                                    idx += 1
                                end
                                for i = idx, #d.Skeleton do
                                    if d.Skeleton[i] then d.Skeleton[i].Visible = false end
                                end
                            else
                                if d.Skeleton then
                                    for _, ln in pairs(d.Skeleton) do
                                        if ln then ln.Visible = false end
                                    end
                                end
                            end

                             if Settings.HealthBar and d.HealthBarOutline and d.HealthBarFill and hum then
                                 local barW = 4
                                 local pad = 2
                                 local barX = pos.X - barW - pad
                                 local barY = pos.Y
                                 local barH = height
                                 d.HealthBarOutline.Visible = true
                                 d.HealthBarOutline.Position = Vector2.new(barX, barY)
                                 d.HealthBarOutline.Size = Vector2.new(barW + 2, barH + 2)
                                 d.HealthBarOutline.Transparency = Settings.BoxTransparency

                                 local hp = math.clamp(hum.Health / math.max(1, hum.MaxHealth), 0, 1)
                                 local fillH = math.floor(barH * hp)
                                 d.HealthBarFill.Visible = true
                                 d.HealthBarFill.Position = Vector2.new(barX + 1, barY + (barH - fillH) + 1)
                                 d.HealthBarFill.Size = Vector2.new(barW, fillH)
                                 d.HealthBarFill.Transparency = Settings.BoxTransparency
                                 d.HealthBarFill.Color = Color3.fromRGB(255 - math.floor(195 * hp), 60 + math.floor(195 * hp), 60)
                             else
                                 if d.HealthBarOutline then d.HealthBarOutline.Visible = false end
                                 if d.HealthBarFill then d.HealthBarFill.Visible = false end
                             end

                             if Settings.ArmorBar and d.ArmorBarOutline and d.ArmorBarFill then
                                local armorValue
                                local armorMax
                                do
                                    local av = char:FindFirstChild("Armor") or plr:FindFirstChild("Armor")
                                    local am = char:FindFirstChild("MaxArmor") or plr:FindFirstChild("MaxArmor")
                                    if av and (av:IsA("NumberValue") or av:IsA("IntValue")) then
                                        armorValue = av.Value
                                    end
                                    if am and (am:IsA("NumberValue") or am:IsA("IntValue")) then
                                         armorMax = am.Value
                                     end
                                 end
                                 if armorValue and armorMax and armorMax > 0 then
                                     local pad = 2
                                     local barH = 3
                                     local barX = pos.X
                                     local barY = pos.Y + height + pad
                                     d.ArmorBarOutline.Visible = true
                                     d.ArmorBarOutline.Position = Vector2.new(barX - 1, barY - 1)
                                     d.ArmorBarOutline.Size = Vector2.new(width + 2, barH + 2)
                                     d.ArmorBarOutline.Transparency = Settings.BoxTransparency

                                     local ap = math.clamp(armorValue / armorMax, 0, 1)
                                     d.ArmorBarFill.Visible = true
                                     d.ArmorBarFill.Position = Vector2.new(barX, barY)
                                     d.ArmorBarFill.Size = Vector2.new(math.floor(width * ap), barH)
                                     d.ArmorBarFill.Transparency = Settings.BoxTransparency
                                 else
                                     d.ArmorBarOutline.Visible = false
                                     d.ArmorBarFill.Visible = false
                                 end
                             else
                                 if d.ArmorBarOutline then d.ArmorBarOutline.Visible = false end
                                 if d.ArmorBarFill then d.ArmorBarFill.Visible = false end
                             end

                             if d.Tracer then
                                d.Tracer.Visible = Settings.Tracers
                                if Settings.Tracers then
                                     local origin
                                     if Settings.TracerOrigin == "Mouse" then
                                         local m = UserInputService:GetMouseLocation()
                                         origin = Vector2.new(m.X, m.Y)
                                     elseif Settings.TracerOrigin == "Center" then
                                         origin = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                                     else
                                         origin = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                                     end
                                     d.Tracer.From = origin
                                    d.Tracer.To = center
                                    d.Tracer.Color = tracerColor
                                    d.Tracer.Thickness = Settings.BoxThickness
                                    d.Tracer.Transparency = Settings.BoxTransparency
                                end
                            end

                             if d.Snapline then
                                d.Snapline.Visible = Settings.Snaplines
                                if Settings.Snaplines then
                                    d.Snapline.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                                    d.Snapline.To = Vector2.new(center.X, pos.Y + height)
                                    d.Snapline.Color = tracerColor
                                    d.Snapline.Thickness = math.max(1, Settings.BoxThickness - 1)
                                    d.Snapline.Transparency = Settings.BoxTransparency
                                end
                            end

                             if d.HeadDot then
                                 d.HeadDot.Visible = Settings.HeadDot
                                 if Settings.HeadDot then
                                     d.HeadDot.Position = Vector2.new(center.X, pos.Y)
                                     d.HeadDot.Color = tracerColor
                                     d.HeadDot.Radius = 3
                                     d.HeadDot.Transparency = Settings.BoxTransparency
                                 end
                             end
                        else
                           HideAll(d)
                        end
                    else
                        HideAll(d)
                    end
                 end
             end
         end)

        Players.PlayerAdded:Connect(function(plr)
            if Settings.Master and DrawingAvailable and not Drawings[plr] then
                AddPlayerDrawings(plr)
            end
        end)

        Players.PlayerRemoving:Connect(RemovePlayerDrawings)
    end
 
     return Visuals
 end)()

 local PlayerFeature = (function()
     local Players = game:GetService("Players")
     local LocalPlayer = Players.LocalPlayer
     local RunService = game:GetService("RunService")
     local UserInputService = game:GetService("UserInputService")
     local Workspace = game:GetService("Workspace")

     local PlayerFeatures = {}

     local Settings = {
         WalkSpeed = { Enabled = false, Value = 100 },
         JumpPower = { Enabled = false, Value = 100 },
         Noclip = { Enabled = false },
         Fly = { Enabled = false, Speed = 100 },
         VehicleFly = { Enabled = false, Speed = 200 },
         InfJump = { Enabled = false },
         HighJump = { Enabled = false, Height = 100 },
         Spider = { Enabled = false },
         BunnyHop = { Enabled = false },
         SpinBot = { Enabled = false, Speed = 30 },
         AutoSprint = { Enabled = false },
         NoSlowdown = { Enabled = false },
         ClickTP = { Enabled = false },
         Phase = { Enabled = false },

         SafeMode = { Enabled = false },
         AntiRagdoll = { Enabled = false },
         NoFall = { Enabled = false },
         GodMode = { Enabled = false },
         Invisibility = { Enabled = false },
         AutoRespawn = { Enabled = false }
     }

     function PlayerFeatures.Init(Window)
         local Tab = Window:Tab("Player")

         Tab:Section("Movement")
         Tab:Toggle("Fly (CFrame)", false, function(s) Settings.Fly.Enabled = s end)
         Tab:Slider("Fly Speed", 10, 500, 100, function(v) Settings.Fly.Speed = v end)
         Tab:Toggle("Vehicle Fly", false, function(s) Settings.VehicleFly.Enabled = s end)

         Tab:Toggle("Noclip (Phase)", false, function(s) Settings.Noclip.Enabled = s end)
         Tab:Toggle("WalkSpeed", false, function(s) Settings.WalkSpeed.Enabled = s end)
         Tab:Slider("Speed Amount", 16, 500, 100, function(v) Settings.WalkSpeed.Value = v end)

         Tab:Toggle("JumpPower", false, function(s) Settings.JumpPower.Enabled = s end)
         Tab:Slider("Jump Amount", 50, 500, 100, function(v) Settings.JumpPower.Value = v end)

         Tab:Toggle("Infinite Jump", false, function(s) Settings.InfJump.Enabled = s end)
         Tab:Toggle("Bunny Hop", false, function(s) Settings.BunnyHop.Enabled = s end)
         Tab:Toggle("Spider / Climb", false, function(s) Settings.Spider.Enabled = s end)
         Tab:Toggle("SpinBot", false, function(s) Settings.SpinBot.Enabled = s end)
         Tab:Toggle("No Slowdown", false, function(s) Settings.NoSlowdown.Enabled = s end)

         Tab:Section("Utility")
         Tab:Toggle("Click TP (Ctrl+Click)", false, function(s) Settings.ClickTP.Enabled = s end)
         Tab:Toggle("Anti-Ragdoll", false, function(s) Settings.AntiRagdoll.Enabled = s end)
         Tab:Toggle("No Fall Damage", false, function(s) Settings.NoFall.Enabled = s end)
         Tab:Toggle("God Mode (Glitch)", false, function(s) Settings.GodMode.Enabled = s end)
         Tab:Toggle("Invisibility", false, function(s) Settings.Invisibility.Enabled = s end)
         Tab:Toggle("Auto Respawn", false, function(s) Settings.AutoRespawn.Enabled = s end)

         RunService.RenderStepped:Connect(function()
             if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                 if Settings.WalkSpeed.Enabled then
                     LocalPlayer.Character.Humanoid.WalkSpeed = Settings.WalkSpeed.Value
                 end
                 if Settings.JumpPower.Enabled then
                     LocalPlayer.Character.Humanoid.JumpPower = Settings.JumpPower.Value
                 end
                 if Settings.NoSlowdown.Enabled then
                     LocalPlayer.Character.Humanoid.WalkSpeed = math.max(LocalPlayer.Character.Humanoid.WalkSpeed, 16)
                 end
                 if Settings.Spider.Enabled and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                     local ray = Ray.new(LocalPlayer.Character.HumanoidRootPart.Position, LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 2)
                     local hit = workspace:FindPartOnRay(ray, LocalPlayer.Character)
                     if hit then
                         LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(LocalPlayer.Character.HumanoidRootPart.Velocity.X, 30, LocalPlayer.Character.HumanoidRootPart.Velocity.Z)
                     end
                 end
             end
         end)

         RunService.Stepped:Connect(function()
             if Settings.Noclip.Enabled and LocalPlayer.Character then
                 for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                     if part:IsA("BasePart") and part.CanCollide then
                         part.CanCollide = false
                     end
                 end
             end
         end)

         RunService.Heartbeat:Connect(function(dt)
             if Settings.Fly.Enabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                 local HRP = LocalPlayer.Character.HumanoidRootPart
                 local Cam = Workspace.CurrentCamera

                 HRP.Velocity = Vector3.new(0, 0, 0)

                 local moveDir = Vector3.new(0, 0, 0)
                 local CF = Cam.CFrame

                 if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + CF.LookVector end
                 if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - CF.LookVector end
                 if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - CF.RightVector end
                 if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + CF.RightVector end
                 if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0, 1, 0) end
                 if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then moveDir = moveDir - Vector3.new(0, 1, 0) end

                 HRP.CFrame = HRP.CFrame + (moveDir * Settings.Fly.Speed * dt)
             end
         end)

         RunService.RenderStepped:Connect(function()
             if Settings.SpinBot.Enabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                 LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(Settings.SpinBot.Speed), 0)
             end
         end)

         UserInputService.InputBegan:Connect(function(input, gpe)
             if not gpe and Settings.ClickTP.Enabled and input.UserInputType == Enum.UserInputType.MouseButton1 and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                 local mouse = LocalPlayer:GetMouse()
                 if mouse.Hit and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                     LocalPlayer.Character.HumanoidRootPart.CFrame = mouse.Hit + Vector3.new(0, 3, 0)
                 end
             end
         end)

         LocalPlayer.CharacterAdded:Connect(function(char)
             if Settings.AutoRespawn.Enabled then
                 local hum = char:WaitForChild("Humanoid", 10)
                 if hum then
                     hum.Died:Connect(function()
                         if Settings.AutoRespawn.Enabled then
                             print("Attempting Fast Respawn...")
                         end
                     end)
                 end
             end
         end)
     end

     return PlayerFeatures
 end)()

 local ServerFeature = (function()
     local Players = game:GetService("Players")
     local LocalPlayer = Players.LocalPlayer
     local TeleportService = game:GetService("TeleportService")
     local ReplicatedStorage = game:GetService("ReplicatedStorage")
     local RunService = game:GetService("RunService")

     local ServerFeatures = {}

     local Settings = {
         AntiAFK = true,
         StreamerMode = false,
         UnlockFPS = false,
         AutoFarm = false,
         RemoteSpy = false,
         AutoBuy = false,
         AntiVotekick = false,
         WalkOnWater = false,
         Gravity = 196.2,
         TimeScale = 1
     }

     function ServerFeatures.Init(Window)
         local Tab = Window:Tab("Server")

        local antiAfkConn = nil
        local function SetAntiAfk(enabled)
            Settings.AntiAFK = enabled
            if antiAfkConn ~= nil then
                antiAfkConn:Disconnect()
                antiAfkConn = nil
            end
            if enabled then
                local vu = game:GetService("VirtualUser")
                antiAfkConn = LocalPlayer.Idled:Connect(function()
                    vu:CaptureController()
                    vu:ClickButton2(Vector2.new())
                end)
            end
        end

         Tab:Section("Game")
         Tab:Button("Rejoin Server", function()
             TeleportService:Teleport(game.PlaceId, LocalPlayer)
         end)

         Tab:Button("Server Hop", function() end)
         Tab:Button("Low Server Hop", function() end)

         Tab:Section("Automation")
         Tab:Toggle("Anti-AFK", true, function(s) SetAntiAfk(s) end)
         Tab:Toggle("Auto Farm", false, function(s) Settings.AutoFarm = s end)
         Tab:Toggle("Auto Buy", false, function(s) Settings.AutoBuy = s end)
         Tab:Toggle("Chat Spammer", false, function(s)
             while s do
                 if ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents") then
                     ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("TITANIUM ON TOP", "All")
                 end
                 task.wait(2)
                 if not s then break end
             end
         end)

         Tab:Section("Modifiers")
         Tab:Toggle("Walk on Water", false, function(s)
             Settings.WalkOnWater = s
             local platform = workspace:FindFirstChild("TitaniumWaterPlatform")
             if s then
                 if not platform then
                     platform = Instance.new("Part", workspace)
                     platform.Name = "TitaniumWaterPlatform"
                     platform.Size = Vector3.new(10000, 1, 10000)
                     platform.Transparency = 1
                     platform.Anchored = true
                     platform.CanCollide = true
                     platform.Position = Vector3.new(0, -3, 0)
                 end
             else
                 if platform then platform:Destroy() end
             end
         end)

         Tab:Slider("Gravity", 0, 200, 196, function(v)
             game.Workspace.Gravity = v
         end)

         Tab:Slider("Time Scale", 0, 5, 1, function(v) end)

         Tab:Section("Misc")
         Tab:Toggle("Streamer Mode", false, function(s)
             Settings.StreamerMode = s
             if s then
                 LocalPlayer.PlayerGui:SetAttribute("StreamerMode", true)
             end
         end)

         Tab:Toggle("Unlock FPS", false, function(s)
             if setfpscap then setfpscap(999) end
         end)

         Tab:Button("Remote Spy", function() end)

         Tab:Button("Copy Job ID", function()
             if setclipboard then setclipboard(game.JobId) end
         end)

         Tab:Button("Copy Game ID", function()
             if setclipboard then setclipboard(tostring(game.PlaceId)) end
         end)

         Tab:Button("Crash Server", function() end)

         SetAntiAfk(Settings.AntiAFK)
     end

     return ServerFeatures
 end)()

 local ProfileFeature = (function()
     local Players = game:GetService("Players")
     local LocalPlayer = Players.LocalPlayer

     local ProfileFeatures = {}

     local antiAfkConn = nil
     function ProfileFeatures.Init(Window)
         local Tab = Window:Tab("Profile")

         local env = (getgenv and getgenv()) or _G
         if env.TITANIUM_MENU_KEY == nil then
             env.TITANIUM_MENU_KEY = Enum.KeyCode.RightShift
         end

         Tab:Section("Identity")
         Tab:Toggle("Anti-AFK (Bypass Idle Kick)", true, function(s)
             if antiAfkConn ~= nil then
                 antiAfkConn:Disconnect()
                 antiAfkConn = nil
             end
             if s then
                 local VirtualUser = game:GetService("VirtualUser")
                 antiAfkConn = LocalPlayer.Idled:Connect(function()
                     VirtualUser:CaptureController()
                     VirtualUser:ClickButton2(Vector2.new())
                 end)
             end
         end)

         Tab:Button("Spoof Username (Client Side)", function()
             LocalPlayer.Name = "TitaniumUser"
             LocalPlayer.DisplayName = "Admin"
             if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                 LocalPlayer.Character.Humanoid.DisplayName = "Admin"
             end
         end)

         Tab:Section("Interface")
         Tab:Keybind("Toggle Menu Key", env.TITANIUM_MENU_KEY, function(key)
             env.TITANIUM_MENU_KEY = key
         end)
     end

     return ProfileFeatures
 end)()

-- Continue with your other feature modules (Visuals, PlayerFeature, etc.)
-- They remain the same but will use the new premium UI

-- ============================================
-- MAIN EXECUTION
-- ============================================

 -- Show loading screen first
 LoadingScreen.Show(function()
     -- Then show authentication
     Auth.Run(function()
         -- Initialize main interface
         local Titanium = UI.new()
         local Window = Titanium:Window("TITANIUM")

         do
             local RunService = game:GetService("RunService")
             local parentGui = Titanium.ScreenGui

             local existing = parentGui:FindFirstChild("Titanium_Watermark")
             if existing then
                 existing:Destroy()
             end

             local Watermark = Instance.new("Frame")
             Watermark.Name = "Titanium_Watermark"
             Watermark.Size = UDim2.new(0, 220, 0, 34)
             Watermark.AnchorPoint = Vector2.new(0.5, 0)
             Watermark.Position = UDim2.new(0.5, 0, 0, 12)
             Watermark.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
             Watermark.BackgroundTransparency = 0.15
             Watermark.BorderSizePixel = 0
             Watermark.Parent = parentGui

             local corner = Instance.new("UICorner")
             corner.CornerRadius = UDim.new(0, 10)
             corner.Parent = Watermark

             local stroke = Instance.new("UIStroke")
             stroke.Color = Color3.fromRGB(0, 170, 255)
             stroke.Thickness = 1
             stroke.Transparency = 0.35
             stroke.Parent = Watermark

             local Glow = Instance.new("ImageLabel")
             Glow.Name = "Glow"
             Glow.Size = UDim2.new(1, 60, 1, 60)
             Glow.Position = UDim2.new(0.5, 0, 0.5, 0)
             Glow.AnchorPoint = Vector2.new(0.5, 0.5)
             Glow.BackgroundTransparency = 1
             Glow.Image = "rbxassetid://5028857084"
             Glow.ImageColor3 = Color3.fromRGB(0, 200, 255)
             Glow.ImageTransparency = 0.82
             Glow.ScaleType = Enum.ScaleType.Slice
             Glow.SliceCenter = Rect.new(24, 24, 276, 276)
             Glow.ZIndex = -1
             Glow.Parent = Watermark

             local Title = Instance.new("TextLabel")
             Title.Name = "Title"
             Title.BackgroundTransparency = 1
             Title.Position = UDim2.new(0, 10, 0, 0)
             Title.Size = UDim2.new(1, -20, 1, 0)
             Title.Font = Enum.Font.GothamBold
             Title.TextSize = 13
             Title.TextXAlignment = Enum.TextXAlignment.Left
             Title.TextColor3 = Color3.fromRGB(245, 245, 250)
             Title.Text = "TITANIUM PREMIUM | FPS: ..."
             Title.Parent = Watermark

             local fpsFrames = 0
             local fpsTime = 0
             RunService.RenderStepped:Connect(function(dt)
                 fpsFrames += 1
                 fpsTime += dt
                 if fpsTime >= 1 then
                     local fps = math.floor(fpsFrames / fpsTime)
                     Title.Text = ("TITANIUM PREMIUM | FPS: %d"):format(fps)
                     fpsFrames = 0
                     fpsTime = 0
                 end
             end)
         end

         local Players = game:GetService("Players")
         local LocalPlayer = Players.LocalPlayer
         local UserInputService = game:GetService("UserInputService")
         local env = (getgenv and getgenv()) or _G
         if env.TITANIUM_MENU_KEY == nil then
             env.TITANIUM_MENU_KEY = Enum.KeyCode.RightShift
         end
         if env.TITANIUM_MENU_BIND ~= nil and typeof(env.TITANIUM_MENU_BIND) == "RBXScriptConnection" then
             env.TITANIUM_MENU_BIND:Disconnect()
         end
         env.TITANIUM_MENU_BIND = UserInputService.InputBegan:Connect(function(input, gpe)
             if gpe then return end
             if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
             if input.KeyCode == env.TITANIUM_MENU_KEY then
                 if Titanium.MainFrame and Titanium.MainFrame.Parent then
                     Titanium.MainFrame.Parent.Visible = not Titanium.MainFrame.Parent.Visible
                 end
             end
         end)
 
         -- Initialize all feature tabs
        AimFeature.Init(Window)
        VisualsFeature.Init(Window)
        PlayerFeature.Init(Window)
        ServerFeature.Init(Window)
        ProfileFeature.Init(Window)
        -- Settings Tab
        local SettingsTab = Window:Tab("Settings", "⚙")
        SettingsTab:Section("INTERFACE")
        SettingsTab:Toggle("Show Notifications", true, function(s) end)
        SettingsTab:Slider("UI Scale", 80, 120, 100, function(v) end)
        SettingsTab:Section("KEYBINDS")
        SettingsTab:Keybind("Toggle Menu", Enum.KeyCode.RightShift, function(key)
            env.TITANIUM_MENU_KEY = key
        end)
         SettingsTab:Keybind("Toggle Menu", Enum.KeyCode.RightShift, function(key)
             env.TITANIUM_MENU_KEY = key
         end)

        SettingsTab:Section("MISC")
        SettingsTab:Button("Rejoin Server", function()
            Titanium:Notify("Rejoin", "Teleporting to server...", 2, "info")
            task.wait(1)
            game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
        end)
        
        SettingsTab:Button("Copy Discord", function()
            if setclipboard then
                setclipboard("discord.gg/titanium")
                Titanium:Notify("Copied!", "Discord link copied to clipboard", 2, "success")
            end
        end)

        -- Welcome notification
        Titanium:Notify("Welcome!", "Titanium Premium loaded successfully", 3, "success")
    end)
end)

local CollisionProfiles = (function()
    local RunService = game:GetService("RunService")
    local Workspace = game:GetService("Workspace")

    local System = {}
    System.__index = System

    local function GetEnv()
        local ok, g = pcall(function()
            return (getgenv and getgenv()) or _G
        end)
        if ok and g then return g end
        return _G
    end

    local function cfPointToWorld(cf, v)
        return (cf * CFrame.new(v)).Position
    end

    local function raySphere(origin, dir, center, radius)
        local oc = origin - center
        local a = dir:Dot(dir)
        local b = 2 * oc:Dot(dir)
        local c = oc:Dot(oc) - radius * radius
        local disc = b * b - 4 * a * c
        if disc < 0 then return nil end
        local sqrtDisc = math.sqrt(disc)
        local t1 = (-b - sqrtDisc) / (2 * a)
        local t2 = (-b + sqrtDisc) / (2 * a)
        local t
        if t1 >= 0 and t2 >= 0 then
            t = math.min(t1, t2)
        elseif t1 >= 0 then
            t = t1
        elseif t2 >= 0 then
            t = t2
        end
        return t
    end

    local function rayOBB(origin, dir, boxCF, half)
        local inv = boxCF:Inverse()
        local o = inv:PointToObjectSpace(origin)
        local d = inv:VectorToObjectSpace(dir)

        local tmin = -math.huge
        local tmax = math.huge

        local function slab(oaxis, daxis, minv, maxv)
            if math.abs(daxis) < 1e-8 then
                if oaxis < minv or oaxis > maxv then
                    return false
                end
                return true
            end
            local t1 = (minv - oaxis) / daxis
            local t2 = (maxv - oaxis) / daxis
            if t1 > t2 then t1, t2 = t2, t1 end
            if t1 > tmin then tmin = t1 end
            if t2 < tmax then tmax = t2 end
            if tmin > tmax then
                return false
            end
            return true
        end

        if not slab(o.X, d.X, -half.X, half.X) then return nil end
        if not slab(o.Y, d.Y, -half.Y, half.Y) then return nil end
        if not slab(o.Z, d.Z, -half.Z, half.Z) then return nil end

        local t = tmin
        if t < 0 then t = tmax end
        if t < 0 then return nil end
        return t
    end

    local function clamp(x, a, b)
        return math.max(a, math.min(b, x))
    end

    local function closestPointOnOBB(point, boxCF, half)
        local inv = boxCF:Inverse()
        local p = inv:PointToObjectSpace(point)
        local cx = clamp(p.X, -half.X, half.X)
        local cy = clamp(p.Y, -half.Y, half.Y)
        local cz = clamp(p.Z, -half.Z, half.Z)
        return boxCF:PointToWorldSpace(Vector3.new(cx, cy, cz))
    end

    local function defaultAdapter()
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local Adapter = {}

        function Adapter:GetEntities()
            return Players:GetPlayers()
        end

        function Adapter:GetLocalEntity()
            return LocalPlayer
        end

        function Adapter:GetEntityId(ent)
            if typeof(ent) == "Instance" then
                return ent:GetDebugId()
            end
            return tostring(ent)
        end

        function Adapter:GetModel(ent)
            if ent == nil then return nil end
            if typeof(ent) == "Instance" then
                if ent:IsA("Player") then return ent.Character end
                if ent:IsA("Model") then return ent end
            elseif type(ent) == "table" then
                local m = ent.Model or ent.model or ent.Character or ent.character or ent.Avatar or ent.avatar
                if typeof(m) == "Instance" and m:IsA("Model") then return m end
            end
            return nil
        end

        function Adapter:GetRootCFrame(ent)
            local m = self:GetModel(ent)
            if not m then return nil end
            local hrp = m:FindFirstChild("HumanoidRootPart") or m:FindFirstChild("Torso") or m:FindFirstChild("UpperTorso")
            if hrp and hrp:IsA("BasePart") then
                return hrp.CFrame
            end
            local ok, cf = pcall(function()
                return m:GetPivot()
            end)
            if ok then return cf end
            return nil
        end

        function Adapter:GetAnchorCFrame(ent, anchor)
            if not anchor or anchor == "Root" then
                return self:GetRootCFrame(ent)
            end
            local m = self:GetModel(ent)
            if not m then return nil end
            if type(anchor) == "string" and anchor:sub(1, 5) == "Part:" then
                local partName = anchor:sub(6)
                local p = m:FindFirstChild(partName)
                if p and p:IsA("BasePart") then
                    return p.CFrame
                end
            end
            return self:GetRootCFrame(ent)
        end

        return Adapter
    end

    function System.new(opts)
        local self = setmetatable({}, System)
        local env = GetEnv()
        self.Adapter = (opts and opts.Adapter) or env.TITANIUM_COLLISION_ADAPTER or defaultAdapter()
        self.Profiles = {}
        self.ActiveProfile = nil
        self.Debug = {
            Enabled = false,
            Color = Color3.fromRGB(0, 200, 255),
            Transparency = 0.75,
            Thickness = 0.06,
            OnlyNonLocal = true
        }
        self._debugFolder = nil
        self._debugConn = nil
        self._debugItems = {}
        return self
    end

    function System:RegisterProfile(name, volumes)
        if type(name) ~= "string" or type(volumes) ~= "table" then return end
        self.Profiles[name] = volumes
        if not self.ActiveProfile then
            self.ActiveProfile = name
        end
    end

    function System:SetActiveProfile(name)
        if self.Profiles[name] then
            self.ActiveProfile = name
        end
    end

    function System:GetActiveProfile()
        return self.ActiveProfile
    end

    function System:_getProfileVolumes()
        if not self.ActiveProfile then return nil end
        return self.Profiles[self.ActiveProfile]
    end

    function System:GetWorldVolumes(ent)
        local vols = self:_getProfileVolumes()
        if not vols then return nil end

        local out = {}
        for i, v in ipairs(vols) do
            if type(v) == "table" and type(v.Type) == "string" then
                local anchor = v.Anchor or "Root"
                local anchorCF = self.Adapter:GetAnchorCFrame(ent, anchor)
                if anchorCF then
                    local localCF = v.CFrame or CFrame.new()
                    local worldCF = anchorCF * localCF
                    out[#out + 1] = {
                        Type = v.Type,
                        Tag = v.Tag or ("V" .. tostring(i)),
                        CFrame = worldCF,
                        Half = v.Half,
                        Radius = v.Radius,
                        Anchor = anchor
                    }
                end
            end
        end
        return out
    end

    function System:Raycast(origin, direction, opts)
        opts = opts or {}
        local maxDist = opts.MaxDistance or direction.Magnitude
        local dir = direction
        if dir.Magnitude > 0 then
            dir = dir.Unit
        end

        local best = nil
        for _, ent in ipairs(self.Adapter:GetEntities() or {}) do
            if opts.Filter and type(opts.Filter) == "function" and not opts.Filter(ent) then
                continue
            end
            if self.Debug.OnlyNonLocal then
                local le = self.Adapter.GetLocalEntity and self.Adapter:GetLocalEntity()
                if le and ent == le then
                    continue
                end
            end

            local wvols = self:GetWorldVolumes(ent)
            if wvols then
                for _, vol in ipairs(wvols) do
                    local t
                    if vol.Type == "Sphere" and vol.Radius then
                        t = raySphere(origin, dir, vol.CFrame.Position, vol.Radius)
                    elseif vol.Type == "Box" and vol.Half then
                        t = rayOBB(origin, dir, vol.CFrame, vol.Half)
                    end
                    if t and t >= 0 and t <= maxDist then
                        if not best or t < best.Distance then
                            best = {
                                Entity = ent,
                                Tag = vol.Tag,
                                Distance = t,
                                Position = origin + dir * t,
                                Volume = vol
                            }
                        end
                    end
                end
            end
        end
        return best
    end

    function System:OverlapSphere(center, radius, opts)
        opts = opts or {}
        local hits = {}
        for _, ent in ipairs(self.Adapter:GetEntities() or {}) do
            if opts.Filter and type(opts.Filter) == "function" and not opts.Filter(ent) then
                continue
            end
            local wvols = self:GetWorldVolumes(ent)
            if wvols then
                for _, vol in ipairs(wvols) do
                    local ok = false
                    if vol.Type == "Sphere" and vol.Radius then
                        ok = (center - vol.CFrame.Position).Magnitude <= (radius + vol.Radius)
                    elseif vol.Type == "Box" and vol.Half then
                        local cp = closestPointOnOBB(center, vol.CFrame, vol.Half)
                        ok = (center - cp).Magnitude <= radius
                    end
                    if ok then
                        hits[#hits + 1] = { Entity = ent, Tag = vol.Tag, Volume = vol }
                        break
                    end
                end
            end
        end
        return hits
    end

    function System:SweepSphere(p0, p1, radius, opts)
        opts = opts or {}
        local delta = p1 - p0
        local dist = delta.Magnitude
        if dist <= 0 then
            return self:OverlapSphere(p0, radius, opts)[1]
        end
        local dir = delta.Unit

        local best = nil
        for _, ent in ipairs(self.Adapter:GetEntities() or {}) do
            if opts.Filter and type(opts.Filter) == "function" and not opts.Filter(ent) then
                continue
            end

            local wvols = self:GetWorldVolumes(ent)
            if wvols then
                for _, vol in ipairs(wvols) do
                    local t
                    if vol.Type == "Sphere" and vol.Radius then
                        t = raySphere(p0, dir, vol.CFrame.Position, radius + vol.Radius)
                    elseif vol.Type == "Box" and vol.Half then
                        local inflated = Vector3.new(vol.Half.X + radius, vol.Half.Y + radius, vol.Half.Z + radius)
                        t = rayOBB(p0, dir, vol.CFrame, inflated)
                    end
                    if t and t >= 0 and t <= dist then
                        if not best or t < best.Distance then
                            best = {
                                Entity = ent,
                                Tag = vol.Tag,
                                Distance = t,
                                Position = p0 + dir * t,
                                Volume = vol
                            }
                        end
                    end
                end
            end
        end
        return best
    end

    function System:SetDebug(enabled)
        self.Debug.Enabled = enabled and true or false
        if self.Debug.Enabled then
            if not self._debugFolder then
                local f = Instance.new("Folder")
                f.Name = "Titanium_CollisionDebug"
                f.Parent = Workspace
                self._debugFolder = f
            end
            if not self._debugConn then
                self._debugConn = RunService.RenderStepped:Connect(function()
                    self:DebugRender()
                end)
            end
        else
            if self._debugConn then
                self._debugConn:Disconnect()
                self._debugConn = nil
            end
            self:DebugClear()
        end
    end

    function System:DebugClear()
        for _, t in pairs(self._debugItems) do
            if t and t.Parent then
                t:Destroy()
            end
        end
        self._debugItems = {}
        if self._debugFolder then
            self._debugFolder:ClearAllChildren()
        end
    end

    function System:DebugRender()
        if not self.Debug.Enabled then return end
        if not self._debugFolder then return end

        local env = GetEnv()
        local profile = self.ActiveProfile or ""
        local color = self.Debug.Color
        local transparency = self.Debug.Transparency

        local alive = {}

        local entities = self.Adapter:GetEntities() or {}
        local localEnt = self.Adapter.GetLocalEntity and self.Adapter:GetLocalEntity() or nil

        for _, ent in ipairs(entities) do
            if self.Debug.OnlyNonLocal and localEnt and ent == localEnt then
                continue
            end
            local id = self.Adapter:GetEntityId(ent)
            local wvols = self:GetWorldVolumes(ent)
            if wvols then
                for _, vol in ipairs(wvols) do
                    local key = tostring(id) .. "|" .. tostring(profile) .. "|" .. tostring(vol.Tag)
                    alive[key] = true
                    local adorn = self._debugItems[key]
                    if not adorn then
                        if vol.Type == "Sphere" then
                            local a = Instance.new("SphereHandleAdornment")
                            a.Name = key
                            a.AlwaysOnTop = true
                            a.ZIndex = 5
                            a.Color3 = color
                            a.Transparency = transparency
                            a.Radius = vol.Radius or 1
                            a.Parent = self._debugFolder
                            adorn = a
                        elseif vol.Type == "Box" then
                            local a = Instance.new("BoxHandleAdornment")
                            a.Name = key
                            a.AlwaysOnTop = true
                            a.ZIndex = 5
                            a.Color3 = color
                            a.Transparency = transparency
                            a.Size = (vol.Half or Vector3.new(1, 1, 1)) * 2
                            a.Parent = self._debugFolder
                            adorn = a
                        end
                        self._debugItems[key] = adorn
                    end
                    if adorn then
                        if adorn:IsA("SphereHandleAdornment") then
                            adorn.Radius = vol.Radius or adorn.Radius
                        elseif adorn:IsA("BoxHandleAdornment") then
                            adorn.Size = (vol.Half or (adorn.Size / 2)) * 2
                        end
                        adorn.CFrame = vol.CFrame
                        adorn.Color3 = env.TITANIUM_COLLISION_DEBUG_COLOR or color
                        adorn.Transparency = env.TITANIUM_COLLISION_DEBUG_TRANSPARENCY or transparency
                    end
                end
            end
        end

        for key, adorn in pairs(self._debugItems) do
            if not alive[key] then
                if adorn and adorn.Parent then
                    adorn:Destroy()
                end
                self._debugItems[key] = nil
            end
        end
    end

    local API = {}
    function API.Create(opts)
        return System.new(opts)
    end

    return API
end)()

do
    local env = (getgenv and getgenv()) or _G
    if env and env.TITANIUM_COLLISION_SYSTEM == nil then
        env.TITANIUM_COLLISION_SYSTEM = CollisionProfiles.Create()
        env.TITANIUM_COLLISION_SYSTEM:RegisterProfile("Default", {
            { Type = "Box", Tag = "Body", Anchor = "Root", CFrame = CFrame.new(), Half = Vector3.new(2, 3, 1) },
            { Type = "Sphere", Tag = "Head", Anchor = "Part:Head", CFrame = CFrame.new(), Radius = 1 }
        })
        env.TITANIUM_COLLISION_SYSTEM:SetActiveProfile("Default")
    end
end
