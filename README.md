# retro-anki-sync-server-archbuild

Build files for installing [retro-anki-sync-server](https://github.com/peterclifton/retro-anki-sync-server) on arch linux

As the purpose of [retro-anki-sync-server](https://github.com/peterclifton/retro-anki-sync-server) is just for me to try things out: I strongly recommend that you do **not**, under any circumstances, attempt to use this as 
your anki-sync-server.  If you are looking for an anki-sync-server to use please 
be aware that Anki now includes a 
[build in sync-server](https://docs.ankiweb.net/sync-server.html)

## Install

Bear in mind that I recommend that you do **not** install this (see note above for reason).

- `$ mkdir buildfolder`
- `$ cd buildfolder`
- `$ git clone https://github.com/peterclifton/retro-anki-sync-server-archbuild.git`
- Review **PKGBUILD** and all other files in *buildfolder* to make sure you understand and are happy with what they are going to do! (If not modify them until you are happy with them!)
- `$sudo pacman -S --needed base-devel` (install base-devel if not already installed)
- `$ makepkg -src`
- `$ sudo pacman -U retro-anki-sync-server-<version>.pkg.tat.zst`

## Usage

- Launch the server: `$ retro-anki-sync-server`
- Add a user:        `$ retro-anki-sync-server --adduser <username>`
- Delete a user:     `$ retro-anki-sync-server --deluser <username>`

--- 
## Client device setup

No guidance is provided here, but I note that I found the **README** at [ankicommunity/ankicommunity-sync-server](https://github.com/ankicommunity/ankicommunity-sync-server) to be helpful.
