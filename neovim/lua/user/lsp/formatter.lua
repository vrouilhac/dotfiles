local M = {}

local start_ok, formatter = pcall(require, "formatter")

if not start_ok then
  vim.notify("formatter not installed")
  return
end

local lua_format_opts = {
  exe = "luafmt",
  args = {
    "--indent-count",
    2,
    "--stdin"
  },
  stdin = true
}

formatter.setup(
  {
    -- Checkout this: https://github.com/mhartington/formatter.nvim/tree/master/lua/formatter/filetypes
    filetype = {
      typescriptreact = {
        require("formatter.filetypes.typescriptreact").eslint_d
      },
      typescript = {
        require("formatter.filetypes.typescript").eslint_d
      },
      javascript = {
        require("formatter.filetypes.javascript").eslint_d
      },
      css = {
        require("formatter.filetypes.css").stylefmt
      },
      go = {
        require("formatter.filetypes.go").gofmt
      },
      python = {
        require("formatter.filetypes.python").black
      },
      rust = {
        require("formatter.filetypes.rust").rustfmt
      },
      json = {
        require("formatter.filetypes.json").prettierd
      },
      lua = {
        function()
          return lua_format_opts
        end
      },
      -- yaml = {
      --   require("formatter.filetypes.yaml").yamlfmt
      -- },
      ocaml = {
        require("formatter.filetypes.ocaml").ocamlformat
      },
      terraform = {
        require("formatter.filetypes.terraform").terraformfmt
      }
      -- html = {
      --   require("formatter.filetypes.html").prettierd
      -- }
    }
  }
)

M.setup = function()
  vim.cmd [[
	 augroup FormatAutogroup
		 autocmd!
		 autocmd BufWritePost * FormatWrite
	 augroup END
	]]
end

return M
