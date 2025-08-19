-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Function to get all jpg images from directory
local function get_wallpapers(dir)
  local wallpapers = {}
  local handle = io.popen('ls "' .. dir .. '"/*.jpg 2>/dev/null')
  if handle then
    for file in handle:lines() do
      table.insert(wallpapers, file)
    end
    handle:close()
  end
  return wallpapers
end

local wallpaper_dir = "/home/mittal/.config/backgrounds"
local wallpapers = get_wallpapers(wallpaper_dir)

if #wallpapers > 0 then
  math.randomseed(os.time())
  local random_wallpaper = wallpapers[math.random(#wallpapers)]
  
  config.background = {
    {
      source = { File = random_wallpaper },
      opacity = 1.0,
      hsb = {
        brightness = 0.02,
      },
    }
  }
end

-- Key binds
config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
    {
        key = '|',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
    },
    {
        key = '-',
        mods = 'LEADER',
        action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
    },
    {
        mods = "LEADER",
        key = "x",
        action = wezterm.action.CloseCurrentPane { confirm = true }
    },
    {
        mods = "LEADER",
        key = "n",
        action = wezterm.action.SpawnTab "CurrentPaneDomain",
    },
    {
        mods = "LEADER",
        key = "h",
        action = wezterm.action.ActivatePaneDirection "Left"
    },
    {
        mods = "LEADER",
        key = "j",
        action = wezterm.action.ActivatePaneDirection "Down"
    },
    {
        mods = "LEADER",
        key = "k",
        action = wezterm.action.ActivatePaneDirection "Up"
    },
    {
        mods = "LEADER",
        key = "l",
        action = wezterm.action.ActivatePaneDirection "Right"
    },
    {
        mods = "LEADER",
        key = "LeftArrow",
        action = wezterm.action.AdjustPaneSize { "Left", 5 }
    },
    {
        mods = "LEADER",
        key = "RightArrow",
        action = wezterm.action.AdjustPaneSize { "Right", 5 }
    },
    {
        mods = "LEADER",
        key = "DownArrow",
        action = wezterm.action.AdjustPaneSize { "Down", 5 }
    },
    {
        mods = "LEADER",
        key = "UpArrow",
        action = wezterm.action.AdjustPaneSize { "Up", 5 }
    },
}

-- Tab releated
for i = 1, 9 do
    -- leader + number to activate that tab
    table.insert(config.keys, {
        key = tostring(i),
        mods = "ALT",
        action = wezterm.action.ActivateTab(i-1),
    })
end
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false
-- Enable wayland for fullscreen terminal
config.enable_wayland = false

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- The font size and color scheme.
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14
config.line_height = 1.2
config.font = wezterm.font_with_fallback {
    'JetBrainsMono Nerd Font',
    'Fira Code',
    'DengXian'  -- for Asian characters
}

-- Visual appearance
config.color_scheme = "Catppuccin Macchiato"
config.window_background_opacity = 0.9
config.colors = {
    cursor_bg = "white",
    cursor_border = "white",
}
config.adjust_window_size_when_changing_font_size = true
config.window_decorations = "RESIZE"
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}


-- Finally, return the configuration to wezterm:
return config
