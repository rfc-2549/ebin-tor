#!/bin/bash

[ -d ~/.local/share/ebin-tor/ ] || mkdir -p ~/.local/share/ebin-tor

cd ~/.local/share/ebin-tor

[ -f ~/.local/share/ebin-tor/browser.tar.xz ] || wget -v https://www.torproject.org/dist/torbrowser/10.0/tor-browser-linux64-10.0_en-US.tar.xz -O browser.tar.xz

[ -f ~/.local/share/ebin-tor/browser.tar.xz.asc ] || wget -v https://www.torproject.org/dist/torbrowser/10.0/tor-browser-linux64-10.0_en-US.tar.xz.asc -O browser.tar.xz.asc

if [ -f verified ]; then
    echo "Nothing to do."
else
    gpg --verify browser.tar.xz.asc && echo "Verified" && touch "verified" || echo "Error"; exit;
fi

[ -d ~/.local/share/ebin-tor/tor-browser_en-US ] || tar --get -f ~/.local/share/ebin-tor/browser.tar.xz
cd tor-browser_en-US
./start-tor-browser.desktop

