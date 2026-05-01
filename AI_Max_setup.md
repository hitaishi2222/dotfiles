This is the step-by-step procedure documentation of setup my new Computer _Asus Tuf A14 (2026)_ with Ryzen AI Max+.
Because it is a latest chip installing anylinux is not possible. It require bleading-edge kernals and firmwares to functinon properly.

...

Installed `Archlinux` btw. using `archinstall` script. It went well.

- Selected `Hyprland` as Display window manager (DW).
- Sadly went with default `sddm` greater, thinking that i will rice it. But I think i like minimal greeters better like `greetd`.
- `Linux-zen` is must kernal to install for newer hardware to get better and latest support.

# Basic Packages

```sh
sudo pacman -S git neovim ghostty rofi-wayland waybar tmux fzf fish which hyprpaper libnotify nautilus alsa-utils pavucontrol brightnessctl swayosd mpd
```

## Greeter

```sh
sudo pacman -S greetd-tuigreet
sudo systemctl enable greetd
```

Installing basic nerd font:

```sh
sudo pacman -S ttf-jetbrains-mono ttf-jetbrains-mono-nerd-font
```

Downloading my dotfiles from github to update all my configs:

```sh
git clone https://github.com/hitaishi2222/dotfiles.git
```

Installing some dependencies for my shells and fish to work properly according to my settings:

```sh
sudo pacman -S eza zoxide acpi rsync reflector
```

for tree use `eza -T --icons`

Populating XDG-User Dirs: Documents, Downloads, ... etc

```sh
sudo pacman -S xdg-user-dirs
xdg-user-dirs-update
```

Paru install: (You can instlal Yay also). I like paru better bcz its written in Rust :)

```sh
sudo pacman -S --needed base-devel rustup cava
rustup default stable
cargo install cargo-binstall du-dust pastel bluetui aim numbat-cli
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

## I need my kanata settings

Otherwise i always have the habit of pressing `CAPS` to switch between hyprland windows.

```sh
paru -S kanata
cd ~/Hiti/dotfiles/kanata
sudo kanata.kbd /etc/kanata.kbd

```

## Tmux-TPM Install

```sh
sudo pacman -S entr
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

# Setup Neovim

We need to install some LSP, code-formatters and some dependencies

```sh
sudo pacman -S nodejs npm bun lazygit stylua harper
cargo install fd-find
sudo npm install -g tree-sitter-cli

```

Latex:

```sh
curl -L -o install-tl-unx.tar.gz https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
tar -xvzf install-tl-unx.tar.gz
cd install-tl-2*
./install-tl
cargo install tex-fmt
```

then use `tlmgr` to install and search packages:

```sh
tlmgr info package.sty
tlmgr install package
```

HTML, CSS, TS

```sh
npm i -g vscode-langservers-extracted emmet-ls prettier
```

Python:

```sh
sudo pacman -S pyenv
pyenv install 3.13.12
pyenv global 3.13.12
pip install uv setuptools
uv pip install --system numpy scipy pandas matplotlib marimo femwell gdsfactory[full] ruff ty pyrefly black colorthief flask kiteconnect python-dotenv pydantic pytz python-lsp-server ruff-lsp
```

Typst & Rust:

```sh
sudo pacman -S tinymist
cargo binstall typstyle
rustup component add rust-analyzer
rustup component add rustfmt
```

Finally copy all config to .config

```sh
# inside dotfiles directory
cd ~/Hiti/dotfiles
cp -r nvim ~/.config/
```

# Laptop Specific Packages

Asusctl
`supergfxctl` and `auto-cpufreq` are breaking in installation,

```sh
sudo pacman -S mesa vulkan-radeon libva-mesa-driver fwupd mesa-utils vulkan-tools hipblas vulkan-extra-tools
paru -S asusctl
systemctl start asusd
```

upgrade firmware using:

```sh
fwupdmgr refresh
fwupdmgr get-updates
fwupdmgr update

```

more iGPU related

```sh
sudo pacman -S rocm-hip-runtime rocm-opencl-runtime clinfo radeontop
```

Unified Memory Allocation

1. The Kernel Command Line (The "Allocation" Step)

Since your laptop uses Unified Memory, the "allocation" happens by telling the amdgpu driver how much of the system RAM it's allowed to address as its own.

- Open your GRUB config:
  `sudo nano /etc/default/grub`
- Edit the `GRUB_CMDLINE_LINUX_DEFAULT` line. Add these two parameters inside the quotes:
  - amdgpu.gttsize=24576 (This sets the "VRAM" limit to 24GB).
  - amdgpu.sg_display=0 (This helps with memory stability on high-end APUs).
- Apply the changes:
  `sudo grub-mkconfig -o /boot/grub/grub.cfg`
  -Reboot your laptop.

Note: final GRUB_CMDLINE looks like this:
`GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet iommu=pt nvme_core.default_ps_max_latency_us=0 amdgpu.gttsize=24576 amdgpu.sg_display=0"`

# Wallpaper and Display setup

```sh
sudo pacman -S chafa bc wtype xdg-desktop-portal-wlr xdg-desktop-portal-gtk openslide
caro install wallust
```

# Fonts

```sh
sudo pacman -S ttf-dejavu ttf-liberation noto-fonts ttf-hack adobe-source-code-pro-fonts ttf-font-awesome papirus-icon-theme breeze-icons gnome-tweaks xorg-fonts-misc terminus-font noto-fonts-cjk noto-fonts-emoji
paru -S ttf-ms-fonts
sudo nvim /etc/vconsole.conf
```

change the font to `FONT=ter-v24b`

# Other

```sh
sudo pacman -S rmpc ffmpeg ueberzugpp cava imagemagick jdk-openjdk hdf5 fastfetch okular vlc mov ristretto yazi tldr mandoc less ripgrep bat python-adblock qutebrowser nwg-look qtwebengine 7zip speech-dispatcher obs-studio obsidian speedtest-cli clipcat mpd mpc timidity++ freecad cpufetch libreoffice-fresh
paru -S zen-browser-bin zotero-bin
uv pip install --system yt-dlp mutagen openslide-bin
sudo makewhatis /usr/share/man
```

Qute browser is not supporting newer versions of pdf.js so we need to install and downgrade it to V(5.0).

```sh
sudo pacman -S pdfjs
paru -S downgrade
```

caffine-arch -> [Caffine](caffine -> https://github.com/thatbeautifuldream/caffeine-arch)

```sh
systemctl stop systemd-resolved
systemctl disable systemd-resolved
systemctl enable sshd
systemctl start sshd
systemctl enable avahi-daemon
systemctl start avahi-daemon
```

## GTK Theming

```sh
sudo pacman -S orchis-theme
paru -S orchis-dracula-theme-git kvantum-theme-orchis-git
```

## Hyprland Tools

```sh
sudo pacman -S hyprpicker hypridle xdg-desktop-portal-hyprland hyprpolkitagent hyprpwcenter
```

## Development Setup: Some AI and Docker Stuff

```sh
sudo pacman -S github-cli vulkan-devel
paru -S opencode btop nvtop vulkan-tools llvm vulkan-headers shaderc
```

### OLLAMA

Install ollama using link in their website. Pulled these for now:

```
ollama pull qwen3:14b
ollama pull qwen2.5-coder:14b
ollama pull deepseek-r1:14b
```

Ollama couldn't able to run these models due to memory allocation with my laptop. It doesn't have the capability to address memory allocation for shared memory.

### LLAMA.cpp

There was a debate on using llama.cpp with Vulkan or with ROCM.
Had Horrible expperience with ROCM, even 4B parameter models taking all my memory and crashing laptop completly.
So, For this laptop or for me personally. Vulkan worked for even bigger models of 16B parameter smoothly.

So trying `llama.cpp` [Vulkan Build](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md#vulkan)

```
cmake -B build -DGGML_VULKAN=ON
cmake --build build --config Release
```

## Configuring sound

```sh
sudo pacman -S pipewire-pulse pipewire alsa-firmware
```

### Update mirrorlists

`sudo reflector --country India --latest 10 --sort rate --save /etc/pacman.d/mirrorlist `

# Docker

```sh
sudo pacman -S docker docker-compose
sudo usermod -uG docker $USER
systemctl enable docker
systemctl enable containerd
```

## Whisper

- Wisper Overlay [GitHub](https://github.com/oddlama/whisper-overlay) This have issues with my Laptop

```sh
uv pip install --system faster-whisper
paru -S hyprvoice-bin wtype
```

can't able to install `whisper.cpp` via paru because of overlapping conflicts between `llama.cpp`.
So, building it from scratch:

```sh
cd ~/Downloads/Installers/
git clone https://github.com/ggml-org/whisper.cpp.git
cd whisper.cpp
cmake -B build
sudo ln -s /home/hiti/Downloads/Installers/whisper.cpp/build/bin/whisper-cli /usr/bin/whisper-cli
```

## Gaming on linux

```sh
sudo pacman -S steam gamescope gamemode lib32-gamemode
```

Next follow steps from [Arch-Wiki steam](https://wiki.archlinux.org/title/Steam)

As of now whisper is working but my audio system is not.

# Docker

Containers Created:

1. Bento Pdf
2. Arcane

Containers need:

1. VPN

### MEEP

```sh
pip install meep
sudo pacman -S fftw-openmpi hdf5-openmpi gcc-fortan openblas
paru -S libctl

#MPB
git clone https://github.com/NanoComp/mpb.git
./configure --enable-shared

#MEEP
sudo pacman -S swig
alias egrep="/usr/bin/grep -E"

git clone https://github.com/NanoComp/harminv.git
paru -S libgdsii-git
cd harminv
./configure --with-cxx --enable-shared

https://github.com/NanoComp/meep.git
cd meep
./autogen.sh --with-mpi --enable-shared
sudo make
sudo make install
cp -r python/meep ~/.pyenv/versions/3.13.12/versions/3.13.12/lib/python3.13/site-packages/
uv pip install --system mpi4py
```

### COMSOL MULTIPHYSICS

```sh
7z x comsol.tar.gz
cd comsol
sudo umount -o loop comsol.iso /mnt
cd /mnt
./setup.sh
```

Still It doesn't look good on Archlinux with fractional scaling. So add this to your `hyprland.conf`

```
xwayland {
  force_zero_scaling = true
}
```

### OCR Setup with screen capture

```
sudo pacman -S tesseract tesseract-data-eng

grim -g "$(slurp)" - | tesseract stdin stdout | wl-copy
```

Pending Setups:

- Configure Snapshots
- PYNLO/laserfun
- Language Tool (optional)
- Hyprlock rice
- Check Other required/missing softwares on [[sotwares_list.md]]

sqlit-tui & termdbms -> sqlite query and lookup

# NIRI Setup

```sh
sudo pacman -Syu niri xwayland-satellite cliphist wlsunset power-profiles-daemon
```

## Kannada language input setup on Archlinux

```sh
sudo pacman -S fcitx5 fcitx5-m17n fcitx5-configtool fcitx5-gtk fcitx5-qt
```
