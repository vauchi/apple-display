// SPDX-FileCopyrightText: 2026 Mattia Egloff <mattia.egloff@pm.me>
// SPDX-License-Identifier: GPL-3.0-or-later

import SwiftUI

/// Draws a resolved icon using the surrounding foreground style and font.
/// Host-bundled pictograms scale with Dynamic Type relative to their text style.
public struct NavigationIconImage: View {
    private let icon: NavigationIcon
    @ScaledMetric private var side: CGFloat

    public init(
        _ icon: NavigationIcon,
        pointSize: CGFloat = 20,
        relativeTo textStyle: Font.TextStyle = .body
    ) {
        self.icon = icon
        _side = ScaledMetric(wrappedValue: pointSize, relativeTo: textStyle)
    }

    public var body: some View {
        switch icon {
        case let .symbol(name):
            Image(systemName: name)
        case let .asset(name):
            Image(name)
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: side, height: side)
        }
    }
}
