//
//  SwiftUIView.swift
//  
//
//  Created by Jeffrey Sweeney on 9/15/24.
//

import SwiftUI

public struct StarWarsScrollerView: View {
    @State private var showingIntro = true
    
    public var body: some View {
        Group {
            if showingIntro {
                ALongTimeAgoView()
            } else {
                EpisodeView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .onAppear {
            if showingIntro {
                Task { await transitionViews() }
            }
        }
    }
    
    @MainActor
    private func transitionViews() async {
        try? await Task.sleep(nanoseconds: 6_000_000_000)
        showingIntro = false
    }
}

#Preview {
    StarWarsScrollerView()
}
