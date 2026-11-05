// SPDX-FileCopyrightText: 2026 Mattia Egloff <mattia.egloff@pm.me>
// SPDX-License-Identifier: GPL-3.0-or-later

/// A native adapter's resolved symbol or host-bundled pictogram.
public enum NavigationIcon: Equatable {
    case symbol(String)
    case asset(String)
}
