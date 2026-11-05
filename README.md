<!-- SPDX-FileCopyrightText: 2026 Mattia Egloff <mattia.egloff@pm.me> -->
<!-- SPDX-License-Identifier: GPL-3.0-or-later -->

# apple-display

Shared SwiftUI rendering library for Vauchi's iOS and macOS apps, with
explicit platform adapters for native presentation and input behavior.

## Rendering API

`NavigationIcon` represents a resolved SF Symbol or a pictogram from the
host application's asset catalog. `NavigationIconImage` draws it with the
surrounding foreground style and font; pictograms scale with Dynamic Type.
Native adapters own token resolution and platform symbol availability.

The package has no copied presentation schema, Core dependency or hardware
executor. The remaining renderer will use the generated
[Command/Event contract](https://gitlab.com/vauchi/contract); platform
adapters will preserve native navigation, focus, accessibility and styling.

App targets own assembly and signing. Hardware capture, notification
execution and wakeup timers belong to
[apple-hw](https://gitlab.com/vauchi/apple-hw).

## Build

Requirements: Swift 5.9 or later and Xcode with macOS and iOS SDKs.
From the Vauchi workspace root:

```sh
just exec-in-repo apple-display 'swift build --scratch-path .build/macos'
```

CI compiles the library for macOS 14 and the iOS 15 simulator target.
Rendering tests run in a macOS guest and compare symbol output with native
SwiftUI. These checks do not certify the assembled apps or device flows.

## License

GPL-3.0-or-later. See [LICENSES/GPL-3.0-or-later.txt](LICENSES/GPL-3.0-or-later.txt).
