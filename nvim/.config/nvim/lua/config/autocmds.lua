-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function tinker_provider()
  vim.filetype.add({ extension = { tinker = "php" } })

  local group = vim.api.nvim_create_augroup("tinker", {})

  -- Requiere el plugin nui.nvim para crear la ventana dividida
  local Split = require("nui.split")

  -- Crear el split para mostrar la salida de Tinker
  local split = Split({
    enter = false,
    relative = "editor",
    position = "right",
    size = "40%",
    buf_options = {},
    win_options = {
      number = false,
      relativenumber = false,
    },
  })

  vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = "*.tinker",
    group = group,
    callback = function(ev)
      local bufnr = ev.buf

      if vim.api.nvim_get_option_value("filetype", { buf = bufnr }) ~= "php" then
        return
      end

      local lines = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)

      if lines[1] ~= "<?php" then
        vim.api.nvim_buf_set_lines(bufnr, 0, 0, false, { "<?php" })
      end
    end,
  })

  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = "*.tinker",
    group = group,
    callback = function(ev)
      local bufnr = ev.buf

      local lines = vim.api.nvim_buf_get_lines(bufnr, 1, -1, false)

      -- Filtrar líneas vacías y comentarios
      lines = vim.tbl_filter(function(raw_line)
        local line = raw_line:gsub("^%s*(.-)%s*$", "%1")
        return line ~= ""
          and line:sub(1, 2) ~= "//"
          and line:sub(1, 2) ~= "/*"
          and line:sub(1, 2) ~= "*/"
          and line:sub(1, 1) ~= "*"
          and line:sub(1, 1) ~= "#"
      end, lines)

      if #lines == 0 then
        return
      end

      if not split.mounted then
        split:mount()
      end

      -- Concatenar el código
      local code = table.concat(lines, "\n")
      code = code:gsub("[$]", "\\$")
      code = code:gsub([["]], [[\"]])

      -- Comando ajustado para evitar el error TTY
      local cmd = string.format('echo "%s" | docker compose exec -it app php artisan tinker', code)

      -- Limpiar y mostrar la salida en el split
      local channel_id = vim.api.nvim_open_term(split.bufnr, {})
      vim.fn.jobstart(cmd, {
        -- stdout_buffered = true,
        on_stdout = function(_, data)
          data = vim.tbl_map(function(line)
            if line:find("vendor/psy/psysh/src") then
              local sub = line:gsub("vendor/psy/psysh/src.*$", "")
              return sub:sub(1, -14)
            end
            return line
          end, data)

          vim.fn.chansend(channel_id, data)
        end,
        on_exit = function()
          if split then
            vim.api.nvim_win_set_cursor(split.winid, { 1, 1 })
          end
        end,
      })
    end,
  })
end

tinker_provider()

-- Disable autoformat for php files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "php", "javascript", "blade" },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- disable spell in markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.wrap = false
    vim.opt_local.spell = false
  end,
})
