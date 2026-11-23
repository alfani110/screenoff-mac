<div align="center">

<img src="docs/icon.png" width="128" alt="ScreenOff app icon">

# ScreenOff

**Turn off your Mac's screen from the menu bar with one click.**
Your Mac keeps running: downloads, music and builds carry on while the display sleeps.

[**Download ScreenOff for macOS**](https://github.com/codeclawd/screenoff-mac/releases/latest/download/ScreenOff.dmg)

Free and open source · macOS 14 or later · Apple silicon and Intel · under 1 MB

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/panel-dark.png">
  <img src="docs/panel-light.png" width="320" alt="The ScreenOff panel under its menu bar icon, with a Sleep Display button">
</picture>

</div>

## Install

1. Download [ScreenOff.dmg](https://github.com/codeclawd/screenoff-mac/releases/latest/download/ScreenOff.dmg) and open it.
2. Drag **ScreenOff** into **Applications**.
3. Open ScreenOff from Applications. A power icon appears in your menu bar.

ScreenOff isn't notarized by Apple, so macOS blocks it the first time you open it. Close that message, go to **System Settings → Privacy & Security**, scroll down and click **Open Anyway**. You only do this once.

If you prefer Terminal, this does the same thing:

```sh
xattr -dr com.apple.quarantine /Applications/ScreenOff.app
```

## Use it

Click the power icon, then **Sleep Display**. Move the mouse or press a key to wake the screen.

Tick **Open at Login** in the panel to start ScreenOff with your Mac. Press Esc or click elsewhere to close the panel.

## Why it doesn't wake right back up

Putting a display to sleep with a click is harder than it sounds, because any input wakes it again. ScreenOff handles the two cases that trip up a plain `pmset displaysleepnow`:

- It waits until your hand leaves the mouse and keyboard before it sleeps the screen.
- A finger resting on a Magic Mouse sends touch events that wake the display without moving the pointer. ScreenOff watches for a few seconds after sleeping and puts the screen back to sleep if nothing you did on purpose woke it.

## FAQ

**How do I turn off my Mac's display without putting the Mac to sleep?**
Click **Sleep Display** in ScreenOff. It runs Apple's `pmset displaysleepnow`, which sleeps only the screen. You can also type that command in Terminal.

**Does it need admin rights or special permissions?**
No. Any user can run `pmset displaysleepnow`. ScreenOff asks for no permissions.

**Will my Mac lock when the screen turns off?**
That follows your setting in **System Settings → Lock Screen → Require password after screen saver begins or display is turned off**. ScreenOff doesn't change it.

**My menu bar manager hides the icon.**
Drag the icon into the visible section of Bartender, Ice or Thaw. With the icon hidden, the panel opens at the top right of the screen.

## Build from source

You need the Xcode command line tools (`xcode-select --install`).

```sh
git clone https://github.com/codeclawd/screenoff-mac.git
cd screenoff-mac
./build.sh       # build/ScreenOff.app
./make-dmg.sh    # build/ScreenOff.dmg
```

The app is about 250 lines of Swift and SwiftUI with no dependencies. `Sources/main.swift` runs the menu bar item and the sleep logic. `Sources/PanelView.swift` draws the panel.

## License

MIT. See [LICENSE](LICENSE).
