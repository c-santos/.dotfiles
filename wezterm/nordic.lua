-- nordic
local palette = {

	none = "NONE",

	-- Blacks. Not in base Nord.
	black0 = "#191D24",
	black1 = "#1E222A",
	-- Slightly darker than bg.  Very useful for certain popups
	black2 = "#222630",

	-- Grays
	-- This color is used on their website's dark theme.
	gray0 = "#242933", -- bg
	-- Polar Night.
	gray1 = "#2E3440",
	gray2 = "#3B4252",
	gray3 = "#434C5E",
	gray4 = "#4C566A",

	-- A light blue/gray.
	-- From @nightfox.nvim.
	gray5 = "#60728A",

	-- Dim white.
	-- default fg, has a blue tint.
	white0_normal = "#BBC3D4",
	-- less blue tint
	white0_reduce_blue = "#C0C8D8",

	-- Snow storm.
	white1 = "#D8DEE9",
	white2 = "#E5E9F0",
	white3 = "#ECEFF4",

	-- Frost.
	blue0 = "#5E81AC",
	blue1 = "#81A1C1",
	blue2 = "#88C0D0",

	cyan = {
		base = "#8FBCBB",
		bright = "#9FC6C5",
		dim = "#80B3B2",
	},
}

return {
	foreground = "#D8DEE9",
	background = "#1E222A",

	cursor_bg = "#D8DEE9",
	cursor_border = "#D8DEE9",
	cursor_fg = "#242933",

	selection_fg = "#D8DEE9",
	selection_bg = "#2E3440",

	ansi = {
		"#191C24",
		"#BF616A",
		"#A3BE8C",
		"#EBCB8B",
		"#81A1C1",
		"#B48EAD",
		"#8FBCBB",
		"#D8DEE9",
	},

	brights = {
		"#3B4252",
		"#D06F79",
		"#B1D196",
		"#F0D399",
		"#88C0D0",
		"#C895BF",
		"#93CCDC",
		"#E5E9F0",
	},
}
