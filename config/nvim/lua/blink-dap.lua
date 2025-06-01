local api = vim.api
local dap_repl = require("dap.repl")
local dap = require("dap")
local types = require("blink.cmp.types")

-- Map DAP completion types to blink.cmp CompletionItemKind
local kind_map = {
  method = types.CompletionItemKind.Method,
  ["function"] = types.CompletionItemKind.Function,
  constructor = types.CompletionItemKind.Constructor,
  field = types.CompletionItemKind.Field,
  variable = types.CompletionItemKind.Variable,
  class = types.CompletionItemKind.Class,
  interface = types.CompletionItemKind.Interface,
  module = types.CompletionItemKind.Module,
  property = types.CompletionItemKind.Property,
  unit = types.CompletionItemKind.Unit,
  value = types.CompletionItemKind.Value,
  enum = types.CompletionItemKind.Enum,
  keyword = types.CompletionItemKind.Keyword,
  snippet = types.CompletionItemKind.Snippet,
  text = types.CompletionItemKind.Text,
  color = types.CompletionItemKind.Color,
  file = types.CompletionItemKind.File,
  reference = types.CompletionItemKind.Reference,
  customcolor = types.CompletionItemKind.Color,
}

local source = {}

function source.new()
  return setmetatable({}, { __index = source })
end

--- Source name for debugging and display
function source.name()
  return "dap"
end

--- Check if the source is available in the current context
function source:is_available()
  local session = dap.session()
  if not session then
    return false
  end

  local supportsCompletionsRequest = (session.capabilities or {}).supportsCompletionsRequest
  if not supportsCompletionsRequest then
    return false
  end

  local bufnr = api.nvim_get_current_buf()
  local filetype = api.nvim_buf_get_option(bufnr, "filetype")
  return vim.startswith(filetype, "dapui_") or filetype == "dap-repl"
end

--- Provide completions for the current context
function source:complete(context, callback)
  local session = dap.session()
  if not session then
    callback({})
    return
  end

  local col = api.nvim_win_get_cursor(0)[2]
  local line = api.nvim_get_current_line()

  -- Adjust for 'dap> ' prompt in REPL
  local offset = vim.startswith(line, "dap> ") and 5 or 0
  local typed = line:sub(offset + 1, col)

  ---@type table[]
  local completions = {}

  -- Helper to add completion items
  local function add_completion(val, kind)
    table.insert(completions, {
      label = val,
      insert_text = val,
      kind = kind or types.CompletionItemKind.Keyword,
    })
  end

  -- REPL Commands (including custom commands)
  if vim.startswith(typed, ".") then
    for _, values in pairs(dap_repl.commands) do
      for _, directive in pairs(values) do
        if type(directive) == "string" and vim.startswith(directive, typed) then
          add_completion(directive, types.CompletionItemKind.Keyword)
        end
      end
    end
    for command, _ in pairs(dap_repl.commands.custom_commands or {}) do
      if vim.startswith(command, typed) then
        add_completion(command, types.CompletionItemKind.Keyword)
      end
    end
  end

  -- Request completions from DAP session
  session:request("completions", {
    frameId = (session.current_frame or {}).id,
    text = typed,
    column = col + 1 - offset,
  }, function(err, response)
    if err then
      callback(completions)
      return
    end

    for _, item in pairs(response.targets or {}) do
      local completion_item = {
        label = item.label,
        insert_text = item.text or item.label,
        kind = item.type and kind_map[item.type] or types.CompletionItemKind.Text,
      }
      table.insert(completions, completion_item)
    end

    callback(completions)
  end)
end

--- Resolve completion item (optional)
function source:resolve(completion_item, callback)
  callback(completion_item)
end

return source
