from colors import *

config.load_autoconfig()

c.aliases["cr"] = "config-source"
c.aliases["dark"] = "config-cycle colors.webpage.darkmode.enabled"

c.fonts.default_family = "JetBrainsMono Nerd Font Propo"
c.fonts.default_size = "11pt"
c.colors.completion.even.bg = background
c.colors.completion.odd.bg = background
c.colors.completion.item.selected.fg = foreground
c.colors.completion.item.selected.bg = color0
c.colors.completion.item.selected.border.bottom = foreground
c.colors.completion.item.selected.border.top = foreground
c.colors.completion.category.bg = color1
c.colors.statusbar.command.fg = color2
c.colors.statusbar.insert.bg = "#2e8b57"
c.colors.statusbar.normal.bg = background
c.colors.statusbar.url.success.http.fg = color6
c.colors.statusbar.url.success.https.fg = color14
c.colors.tabs.bar.bg = color15
c.colors.tabs.odd.fg = foreground
c.colors.tabs.even.fg = foreground
c.colors.tabs.odd.bg = background
c.colors.tabs.even.bg = background
c.colors.tabs.selected.even.bg = color1
c.colors.tabs.selected.odd.bg = color1
c.colors.tabs.selected.even.fg = background
c.colors.tabs.selected.odd.fg = background
c.colors.webpage.bg = color6
c.colors.webpage.darkmode.enabled = True
c.content.plugins = False
c.downloads.position = "bottom"
c.editor.command = [
    "ghostty",
    "-e",
    "nvim",
    "--remote",
    "{file}",
    "+{line}",
    "{column}",
]
c.tabs.favicons.show = "never"
# c.fileselect.handler = "external"
# c. fileselect.folder.command = []
c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "g": "https://google.com/search?q={}",
    "y": "https://www.youtube.com/results?search_query={}",
    "s": "https://scholar.google.com/scholar?q={}",
    "G": "https://github.com/search?q={}",
}
