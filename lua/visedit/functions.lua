M = {}

function M.is_keyword_char(character)
    if not character then
        vim.print("false :3")
        return false
    end

    local re = vim.regex([[\k]])
    return re:match_str(character)
    -- char = tostring(char)
    -- vim.print(tostring(char))
    -- if type(char) ~= "string" or #char == 0 then
    --     return false
    -- end
    -- return vim.fn.match(char, [[^\k$]]) ~= -1
end

function M.prev_word(amount)
    local i = amount
    local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
    while i > 0 do
        local mode = vim.api.nvim_get_mode().mode
        local col = vim.fn.col(".")
        local line = vim.fn.getline(".")
        local char = line:sub(col, col)
        local next_char = line:sub(col-1, col-1)

        if mode == "v" or mode == "V" or mode == "\22" then
            vim.cmd.normal({esc, bang = true})
        end

        if not M.is_keyword_char(char) or not M.is_keyword_char(next_char) then
            vim.cmd.normal({"bviwo", bang = true})
        else
            vim.cmd.normal({"vb", bang = true})
        end
        i = i - 1
    end
end

function M.next_word(amount)
    local i = amount
    local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
    while i > 0 do
        local mode = vim.api.nvim_get_mode().mode
        local col = vim.fn.col(".")
        local line = vim.fn.getline(".")
        local char = line:sub(col, col)
        local next_char = line:sub(col+1, col+1)

        if mode == "v" or mode == "V" or mode == "\22" then
            vim.cmd.normal({esc, bang = true})
        end

        if not M.is_keyword_char(char) or not M.is_keyword_char(next_char) then
            vim.cmd.normal({"wviw", bang = true})
        else
            vim.cmd.normal({"ve", bang = true})
        end
        i = i - 1
    end
end

function M.search_and_select()
    local mode = vim.api.nvim_get_mode().mode
    local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)

    if mode == "v" or mode == "V" or mode == "\22" then
        vim.cmd.normal({esc, bang = true})
    end

    vim.cmd.normal({"*viw", bang = true})
end

function M.select_line(amount)
    local i = amount
    local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)

    while i > 0 do
        local mode = vim.api.nvim_get_mode().mode
        if mode == "V" then
            vim.cmd.normal({"j", bang = true})
        else
            vim.cmd.normal({esc, bang = true})
            vim.cmd.normal({"V", bang = true})
        end
        i = i - 1
    end
end
return M
