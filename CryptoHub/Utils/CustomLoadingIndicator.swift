//
//  CustomLoadingIndicator.swift
//  CryptoHub
//
//  Created by Can Kanbur on 6.06.2023.
//

import SwiftUI

struct CustomLoadingIndicator: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .tint(.accentColor)
            .scaleEffect(x:2.5,y:2.5,anchor: .center)
            .frame(width: 140,height: 140,alignment: .center)
            .background(.gray.opacity(0.1))
            .cornerRadius(20)
    }
}

struct CustomLoadingIndicator_Previews: PreviewProvider {
    static var previews: some View {
        CustomLoadingIndicator()
    }
}
