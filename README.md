<!-- SPDX-FileCopyrightText: 2026 Mattia Egloff <mattia.egloff@pm.me> -->
<!-- SPDX-License-Identifier: GPL-3.0-or-later -->

# apple-display

Shared SwiftUI rendering library for Vauchi's iOS and macOS apps, with
explicit platform adapters for native presentation and input behavior.

## Bootstrap status

This repository contains the library package skeleton. It has no renderer
API, copied presentation schema, Core dependency or hardware executor.
Existing apps do not consume it yet. The renderer will use the generated
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
These compile checks do not certify UI behavior or app integration.

## License

GPL-3.0-or-later. See [LICENSES/GPL-3.0-or-later.txt](LICENSES/GPL-3.0-or-later.txt).
