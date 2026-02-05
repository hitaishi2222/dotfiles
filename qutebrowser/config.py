from colors import *

config.load_autoconfig()

c.aliases["dark"] = "config-cycle colors.webpage.darkmode.enabled"
c.aliases["doi"] = "hint links userscipts scihub"
c.aliases["mpv"] = "spawn -u mpv-view"

# BINDS
config.bind("cr", "config-source;; message-info 'Config Reloaded...' ")
config.bind("yl", "hint links yank")

c.auto_save.session = True
c.fonts.default_family = "JetBrainsMono Nerd Font Propo"
c.fonts.default_size = "11pt"
c.colors.completion.even.bg = background
c.colors.completion.odd.bg = background
c.colors.completion.item.selected.fg = foreground
c.colors.completion.item.selected.bg = color0
c.colors.completion.item.selected.border.bottom = foreground
c.colors.completion.item.selected.border.top = foreground
c.colors.completion.category.bg = color1
c.colors.statusbar.command.bg = color0
c.colors.statusbar.command.fg = foreground
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
c.colors.webpage.darkmode.policy.images = "never"
c.colors.webpage.preferred_color_scheme = "dark"
c.content.blocking.method = "both"
c.content.plugins = True
c.content.pdfjs = True
c.content.autoplay = False
c.downloads.position = "bottom"
c.url.auto_search = "dns"
c.url.default_page = "https://search.hitaishiv.com"
# c.tabs.show = "switching"
c.statusbar.show = "in-mode"
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
    "g": "https://google.com/search?q={}",
    "y": "https://www.youtube.com/results?search_query={}",
    "s": "https://scholar.google.com/scholar?q={}",
    "G": "https://github.com/search?q={}",
    "ar": "https://arxivxplorer.com/?q={}",
    "d": "https://duckduckgo.com/?q={}",
    "DEFAULT": "https://search.hitaishiv.com/search?q={}",
}
c.tabs.padding = {"top": 3, "bottom": 3, "left": 10, "right": 5}
c.statusbar.padding = {"top": 3, "bottom": 3, "left": 5, "right": 10}
config.set("colors.webpage.darkmode.enabled", False, "http://127.0.0.1/*")
