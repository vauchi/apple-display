// SPDX-FileCopyrightText: 2026 Mattia Egloff <mattia.egloff@pm.me>
// SPDX-License-Identifier: GPL-3.0-or-later

import AppleDisplay
import SwiftUI
import XCTest

final class NavigationIconImageTests: XCTestCase {
    func testResolvedSymbolRendersLikeNativeSymbol() async throws {
        try await MainActor.run {
            for name in ["checkmark", "person.crop.rectangle.fill"] {
                let actual = try pixels(NavigationIconImage(.symbol(name)))
                let expected = try pixels(Image(systemName: name))
                XCTAssertEqual(actual, expected, name)
                XCTAssertGreaterThan(Set(actual).count, 1, "Reference must contain a visible glyph")
            }
        }
    }

    @MainActor
    private func pixels(_ view: some View) throws -> [UInt8] {
        let renderer = ImageRenderer(content: view
            .font(.system(size: 24))
            .foregroundStyle(.black)
            .frame(width: 40, height: 40)
            .background(.white))
        let image = try XCTUnwrap(renderer.cgImage)
        XCTAssertEqual(image.width, 40)
        XCTAssertEqual(image.height, 40)
        let data = try XCTUnwrap(image.dataProvider?.data) as Data
        return Array(data)
    }
}
