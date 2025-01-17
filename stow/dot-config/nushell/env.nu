# env.nu
#
# Installed by:
# version = "0.101.0"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.
$env.config.show_banner = false
$env.config.buffer_editor = "nvim"
$env.EDITOR = "/usr/bin/nvim"
$env.TERMINAL = "/usr/bin/kitty"
$env.RUSTC_WRAPPER = "/usr/bin/sccache"
$env.path ++= ["~/.cargo/bin/"]
$env.GOPATH = "~/.local/share/go"
$env.config.edit_mode = 'vi'

zoxide init nushell | save -f ~/.config/nushell/zoxide.nu
