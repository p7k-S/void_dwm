require('kanagawa').setup({
    commentStyle = { italic = true },
    keywordStyle = { italic = false},
})

local function set_colors(color)
    -- color = color or "kanagawa"
    color = color or "kanagawa-dragon"
    vim.cmd.colorscheme(color)

    -- vim.api.nvim_set_hl(0, "Normal", { bg = "#1a1b1c" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1a1b1c" })

    -- trancparancy
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

set_colors()
