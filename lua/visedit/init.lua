local fn = require("visedit.functions")

local M = {}

function M.setup(opts)
    opts = opts or {}

    -- keybindings
    vim.keymap.set("v", "H", "h")
    vim.keymap.set("v", "J", "gj")
    vim.keymap.set("v", "K", "gk")
    vim.keymap.set("v", "L", "l")

    vim.keymap.set("n", "H", "vh")
    vim.keymap.set("n", "J", "vgj")
    vim.keymap.set("n", "K", "vgk")
    vim.keymap.set("n", "L", "vl")

    vim.keymap.set("v", "h", "<Esc>h")
    vim.keymap.set("v", "j", "<Esc>gj")
    vim.keymap.set("v", "k", "<Esc>gk")
    vim.keymap.set("v", "l", "<Esc>l")

    vim.keymap.set("n", "w", function () fn.next_word(vim.v.count1) end)
    vim.keymap.set("v", "w", function () fn.next_word(vim.v.count1) end)
    vim.keymap.set("v", "W", "w")
    vim.keymap.set("n", "W", "vw")

    vim.keymap.set("n", "b", function () fn.prev_word(vim.v.count1) end)
    vim.keymap.set("v", "b", function () fn.prev_word(vim.v.count1) end)
    vim.keymap.set("v", "B", "b")
    vim.keymap.set("n", "B", "vb")

    vim.keymap.set("n", "e", "viw")
    vim.keymap.set("v", "e", "<Esc>viw")
    vim.keymap.set("n", "E", "viw")
    vim.keymap.set("v", "E", "iw")

    vim.keymap.set("n", "V", function () fn.select_line(vim.v.count1) end)
    vim.keymap.set("v", "V", function () fn.select_line(vim.v.count1) end)
    -- keybinds to improve parity between visual and normal modes
    vim.keymap.set("v", "i", "<Esc>`<i")
    vim.keymap.set("v", "a", "<Esc>`>a")

    vim.keymap.set("v", "n", "<Esc>nviw")
    vim.keymap.set("v", "N", "<Esc>nviw")

    vim.keymap.set("n", "n", function () fn.search_and_select() end)
    vim.keymap.set("n", "N", function () fn.search_and_select() end)

    vim.keymap.set("n", "*", function () fn.search_and_select() end)
    vim.keymap.set("v", "*", function () fn.search_and_select() end)
end

return M
