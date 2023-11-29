return {

	{
		"craftzdog/solarized-osaka.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			-- Configure the solarized-osaka theme
			local theme = require("solarized-osaka")
			theme.setup({
				transparent = false, -- non-transparent background
				on_highlights = function(hl, c)
					-- Customize the TroubleNormal highlight group
					hl.TroubleNormal = {
						bg = c.bg, -- Assuming 'c' is the color table provided by the theme
						fg = c.fg,
					}
				end,
			})
		end,
	},
}
