# Dotfiles personal config

This repo contains the configuration files for:

- neovim
- zshrc
- TODO...


## Installation

For installation and configuration:

    ./setup.sh

You should have this rule on udev to allow polybar capture hyperx headset battery
cat /etc/udev/rules.d/polybar-hud.rules
ACTION=="add", KERNEL=="hidraw[0-9]*", ATTRS{idProduct}=="16c4", ATTRS{idVendor}=="0951", MODE="0666"

# TODO

There is a lot of work to do here :3


# Dependencies

- https://github.com/EliverLara/candy-icons (candy icons for drun)

# Based dotfiles

- https://github.com/k-vernooy/dotfiles (drun menu, picom base config)
- https://github.com/PrayagS/polybar-spotify (base for Apple Music controller)
- https://github.com/ntcarlson/dotfiles (center polybar)
