//
//  LazyNavigationView.swift
//  CryptoHub
//
//  Created by Can Kanbur on 6.06.2023.
//

import SwiftUI

struct LazyNavigationView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }

    var body: Content {
        build()
    }
}
