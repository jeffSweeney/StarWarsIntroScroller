//
//  EpisodeView.swift
//
//
//  Created by Jeffrey Sweeney on 9/15/24.
//

import SwiftUI

internal struct EpisodeView: View {
    var body: some View {
        Text("Clone Wars!")
            .font(.largeTitle)
            .bold()
            .foregroundStyle(Color.CWScrollerColor)
    }
}

#Preview {
    EpisodeView()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
}
