local methods = vim.lsp.protocol.Methods

local inlay_hint_handler = vim.lsp.handlers[methods.textDocument_inlayHint]
local simplify_inlay_hint_handler = function(err, result, ctx, config)
  local client = vim.lsp.get_client_by_id(ctx.client_id)
  if client then
    if result == nil then return end
    ---@diagnostic disable-next-line: undefined-field

    result = vim
      .iter(result)
      :map(function(hint)
        local label = hint.label
        if not (label ~= nil and #label < 10) then hint.label = {} end
        return hint
      end)
      :filter(function(hint) return #hint.label > 0 end)
      :totable()
  end
  inlay_hint_handler(err, result, ctx, config)
end

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      -- Configuration table of features provided by AstroLSP
      autoformat = true, -- enable or disable auto formatting on start
      inlay_hints = true, -- nvim >= 0.10
      -- WARN: This conflit with noice.nvim's signature help, see plugins/noice.lua
      signature_help = false,
    },
    -- Configuration options for controlling formatting with language servers
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        -- enable or disable format on save globally
        enabled = false,
        -- enable format on save for specified filetypes only
        allow_filetypes = {},
        -- disable format on save for specified filetypes
        ignore_filetypes = {},
      }, -- disable formatting capabilities for specific language servers
      disabled = {
        -- TODO: After clangd supports specify formatting options, remove it from this list
        "clangd",
        -- INFO: Don't use lsp for formatting, but use null-ls with flexible
        -- configurations
        "neocmake",
      },
      -- default format timeout
      timeout_ms = 20000,
    },
    lsp_handlers = {
      [methods.textDocument_inlayHint] = simplify_inlay_hint_handler,
    },
  },
}
