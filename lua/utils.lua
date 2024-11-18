local M = {}

function M.find_replace()
  local pattern = vim.fn.input "Pattern: "
  local replace = vim.fn.input "Replace with: "
  vim.cmd(":keeppatterns %s/" .. pattern .. "/" .. replace .. "/gc")
end

local function is_jsx_or_tsx()
  local current_file = vim.fn.expand "%:t"
  local file_extension = vim.fn.fnamemodify(current_file, ":e")
  return file_extension == "jsx" or file_extension == "tsx"
end

function M.comment_lines()
  local line_start = vim.fn.line "v"
  local line_end = vim.fn.line "."
  local lines = vim.fn.getline(line_start, line_end)

  if is_jsx_or_tsx() then
    -- Comment with JSX/TSX-style comments (/* ... */)
    for i, line in ipairs(lines) do
      local commented_line = "/* " .. line .. " */"
      vim.fn.setline(line_start + i - 1, commented_line)
    end
  else
    -- Comment with // for other file types
    for i, line in ipairs(lines) do
      local commented_line = "// " .. line
      vim.fn.setline(line_start + i - 1, commented_line)
    end
  end
end

return M
