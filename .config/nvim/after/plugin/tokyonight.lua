-- Tokyo Night Color Configuration
require("tokyonight").setup({
    style = "night", -- Choose: "storm", "moon", "night", "day"
    transparent = true,
    terminal_colors = true,
    
    styles = {
        -- Style for syntax groups
        comments = { italic = true },
        keywords = { italic = true, bold = true },
        functions = { bold = true },
        variables = {},
        -- Background styles
        sidebars = "transparent",
        floats = "transparent",
    },
    
    -- Brighter and more vibrant colors
    on_colors = function(colors)
        -- Make colors more vibrant
        colors.blue = "#7aa2f7"
        colors.cyan = "#7dcfff"
        colors.green = "#9ece6a"
        colors.magenta = "#bb9af7"
        colors.orange = "#ff9e64"
        colors.yellow = "#e0af68"
        colors.red = "#f7768e"
        colors.purple = "#9d7cd8"
        
        -- Make comments more visible
        colors.comment = "#636da6"
        
        -- Brighten up git colors
        colors.git.add = "#449dab"
        colors.git.change = "#6183bb"
        colors.git.delete = "#914c54"
    end,
    
    on_highlights = function(hl, c)
        -- Make certain elements pop more
        hl.Function = { fg = c.blue, bold = true }
        hl.String = { fg = c.green }
        hl.Keyword = { fg = c.purple, bold = true, italic = true }
        hl.Type = { fg = c.cyan, bold = true }
        hl.Constant = { fg = c.orange, bold = true }
        hl.Number = { fg = c.orange }
        hl.Boolean = { fg = c.orange, bold = true }
        hl.Operator = { fg = c.cyan }
        
        -- C++ specific highlights
        hl["@keyword.cpp"] = { fg = c.purple, bold = true }
        hl["@type.cpp"] = { fg = c.cyan, bold = true }
        hl["@namespace.cpp"] = { fg = c.yellow }
        hl["@function.cpp"] = { fg = c.blue, bold = true }
        hl["@method.cpp"] = { fg = c.blue, bold = true }
        hl["@parameter.cpp"] = { fg = c.red }
        hl["@variable.cpp"] = { fg = c.fg }
        hl["@constant.cpp"] = { fg = c.orange, bold = true }
        hl["@string.cpp"] = { fg = c.green }
        hl["@number.cpp"] = { fg = c.orange }
        hl["@boolean.cpp"] = { fg = c.orange, bold = true }
        hl["@operator.cpp"] = { fg = c.cyan }
        hl["@punctuation.bracket.cpp"] = { fg = c.fg_dark }
        hl["@punctuation.delimiter.cpp"] = { fg = c.fg_dark }
        hl["@include.cpp"] = { fg = c.purple, bold = true }
        hl["@macro.cpp"] = { fg = c.red }
        hl["@comment.cpp"] = { fg = c.comment, italic = true }
        
        -- Make line numbers more visible
        hl.LineNr = { fg = "#565f89" }
        hl.CursorLineNr = { fg = c.orange, bold = true }
        
        -- Transparent backgrounds
        hl.Normal = { bg = "NONE", ctermbg = "NONE" }
        hl.NormalNC = { bg = "NONE", ctermbg = "NONE" }
        hl.NormalFloat = { bg = "NONE", ctermbg = "NONE" }
        hl.FloatBorder = { bg = "NONE", ctermbg = "NONE" }
        hl.TelescopeNormal = { bg = "NONE", ctermbg = "NONE" }
        hl.TelescopeBorder = { bg = "NONE", ctermbg = "NONE" }
        hl.NvimTreeNormal = { bg = "NONE", ctermbg = "NONE" }
        hl.EndOfBuffer = { bg = "NONE", ctermbg = "NONE" }
        
        -- Make diagnostics more visible
        hl.DiagnosticError = { fg = c.error, bold = true }
        hl.DiagnosticWarn = { fg = c.warning, bold = true }
        hl.DiagnosticInfo = { fg = c.info, bold = true }
        hl.DiagnosticHint = { fg = c.hint, bold = true }
    end,
    
    -- Improve sidebar detection
    sidebars = { "qf", "vista_kind", "terminal", "packer", "help", "NvimTree" },
    
    -- Don't dim inactive windows
    dim_inactive = false,
    
    -- Use bold for important elements
    lualine_bold = true,
})

-- Apply the colorscheme
vim.cmd.colorscheme "tokyonight"

-- Additional transparency settings
vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
