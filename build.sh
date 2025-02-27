#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# Cleanup
dnf5 -y remove \
    firefox \
    firefox-langpacks


# Install Apps
dnf -y install gnome-tweaks gnome-extensions-app

# Install Gnome Extensions
dnf -y install gnome-shell-extension-appindicator \
              gnome-shell-extension-blur-my-shell \
              gnome-shell-extension-caffeine \
              gnome-shell-extension-dash-to-panel \
              gnome-shell-extension-just-perfection \

# Install codecs
dnf -y swap ffmpeg-free ffmpeg --allowerasing

# Setup flatpak apps
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-modify --no-filter --enable flathub
flatpak remote-delete fedora
flatpak install -y com.mojang.Minecraft \
                  org.mozilla.firefox \
                  com.valvesoftware.Steam \
                  com.vscodium.codium \
                  io.github.shiftey.Desktop \
                  org.filezillaproject.Filezilla \ # Any alternative would be awesome!
                  org.sqlitebrowser.sqlitebrowser \
                  com.github.tchx84.Flatseal \
                  org.gnome.Calculator \
                  org.gnome.Loupe \
                  org.gnome.TextEditor \
                  org.gnome.Totem

