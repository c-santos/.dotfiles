local color = { fg = '8', bg = 'default' }

local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed
        }
    end
end

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local custom_fname = require('lualine.components.filename'):extend()
        local highlight = require('lualine.highlight')
        local default_status_colors = {
            saved = color.fg,
            modified = color.bg,
        }

        function custom_fname:init(options)
            custom_fname.super.init(self, options)
            self.status_colors = {
                saved = highlight.create_component_highlight_group(
                    { fg = default_status_colors.saved },
                    'filename_status_saved',
                    self.options
                ),
                modified = highlight.create_component_highlight_group(
                    { fg = default_status_colors.modified },
                    'filename_status_modified',
                    self.options
                ),
            }
            if self.options.color == nil then
                self.options.color = ''
            end
        end

        function custom_fname:update_status()
            local data = custom_fname.super.update_status(self)
            data = highlight.component_format_highlight(
                vim.bo.modified and
                self.status_colors.modified or
                self.status_colors.saved
            ) .. data
            return data
        end

        require('lualine').setup({
            options = {
                theme = 'auto',
                component_separators = '',
                section_separators = ''
            },
            sections = {
                lualine_a = { { 'mode', color = { fg = color.fg, bg = color.bg } } },
                lualine_b = {
                    {
                        'b:gitsigns_head',
                        icon = '',
                        color = color,
                    }
                },
                lualine_c = {
                    {
                        custom_fname
                    },
                    {
                        'diff',
                        source = diff_source
                    }
                },
                lualine_x = {
                    {
                        'diagnostics'
                    },
                    {
                        'location',
                        color = color
                    }
                },
                lualine_y = {},
                lualine_z = {},
            }
        })
    end
}
