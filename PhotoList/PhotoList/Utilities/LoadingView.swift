//
//  LoadingView.swift
//  PhotoList
//
//  Created by Neelesh RAI on 04/05/22.
//

import SwiftUI

struct LoadingView: View {
    let isFailed: Bool
    var body: some View {
        Text(isFailed ? "Failed, Tap to retry." : "Loading...")
            .foregroundColor(isFailed ? .red : .gray)
            .padding()
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isFailed: false)
    }
}
