---
layout: post
title: Steam Deck recommendations
---
*Last updated 2024-12-07 @ 9:53AM EST* 

This is my personal, curated list of software/tools/etc for the Steam Deck.

## General
* [Decky](https://decky.xyz) (Used in Game Mode): For various helpful plugins. Note that if you decide to rely on Decky, you should not blindly update SteamOS.

## Non-Steam games
### Other stores/launchers
* Decky Plugin: Junk-Store (Used in Game Mode): For accessing other game store libraries from within Game Mode. Currently supports Epic, with GOG support in progress.
* [Heroic Games Launcher](https://heroicgameslauncher.com) (Desktop Mode): For access to Amazon, Epic, & GOG game libraries. Use in conjunction with SRM.

### Emulation
* [EmuDeck](https://www.emudeck.com) (Configured in Desktop Mode, used in Game Mode): For everything emulation. Includes pre-configured SRM which should be used as a baseline, as it is significantly more work to add the emulators to an existing SRM config than it is to add other game launchers.
* Decky Plugin: EmuDecky: Check EmuDeck's hotkeys, manage EmuDeck Quick Settings, update your emulators and more.
* [Pegasus](https://pegasus-frontend.org): If you would prefer for emulated games to not individually appear in Game Mode, this is a good library GUI to launch from.


### Game Streaming
* [chiaki-ng](https://streetpea.github.io/chiaki-ng/): local-network PS5 console streaming

## Tools
* CoreKeyboard (Desktop Mode): Install from Discover and pin to the taskbar to have an on-screen keyboard available when Steam is closed (i.e. working on SRM).
* Decky Plugin: Decky Cloud Save: If you wish to backup saves for non-Steam games.
* Decky Plugin: Storage Cleaner: Cleanup compat data for non-Steam games.
* Filelight: (Desktop Mode): Useful if you need to visualise disk space usage.
* [Shortix](https://github.com/Jannomag/shortix) (Configured in Desktop Mode): Use in conjunction with Decky Cloud Save to locate and backup game saves.
* [Steam ROM Manager](https://steamgriddb.github.io/steam-rom-manager/) (Desktop Mode): aka SRM. Used to manage non-Steam game entries in Game Mode. Pre-configured and bundled with EmuDeck.