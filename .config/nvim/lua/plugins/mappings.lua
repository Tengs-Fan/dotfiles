return {
  "AstroNvim/astrocore",
  opts = function(_, opts)
    local maps = opts.mappings
    maps.n["<M-1>"] = { "<Cmd>ToggleTerm size=10 direction=horizontal<CR>", desc = "ToggleTerm horizontal split" }
    maps.t["<M-1>"] = { "<Cmd>ToggleTerm size=10 direction=horizontal<CR>", desc = "ToggleTerm horizontal split" }
    maps.i["<M-1>"] = { "<Esc><Cmd>ToggleTerm size=10 direction=horizontal<CR>", desc = "ToggleTerm horizontal split" }
    maps.n["<M-2>"] = { "<Cmd>ToggleTerm size=80 direction=vertical<CR>", desc = "ToggleTerm vertical split" }
    maps.t["<M-2>"] = { "<Cmd>ToggleTerm size=80 direction=vertical<CR>", desc = "ToggleTerm vertical split" }
    maps.i["<M-2>"] = { "<Esc><Cmd>ToggleTerm size=80 direction=vertical<CR>", desc = "ToggleTerm vertical split" }
    maps.n["<M-3>"] = { '<Cmd>execute v:count . "ToggleTerm direction=float"<CR>', desc = "Toggle terminal" } -- requires terminal that supports binding <C-'>
    maps.t["<M-3>"] = { "<Cmd>ToggleTerm direction=float<CR>", desc = "ToggleTerm float" }
    maps.i["<M-3>"] = { "<Esc><Cmd>ToggleTerm direction=float<CR>", desc = "ToggleTerm float" }
  end,
}
