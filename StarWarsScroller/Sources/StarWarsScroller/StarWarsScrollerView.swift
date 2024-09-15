//
//  SwiftUIView.swift
//  
//
//  Created by Jeffrey Sweeney on 9/15/24.
//

import SwiftUI

public struct StarWarsScrollerView: View {
    @State private var showingALongTimeAgo = true
    
    public var body: some View {
        ZStack {
            StarryBackgroundView()
            
            if showingALongTimeAgo {
                ALongTimeAgoView()
            } else {
                EpisodeView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .onAppear {
            if showingALongTimeAgo {
                Task { await transitionViews() }
            }
        }
    }
    
    @MainActor
    private func transitionViews() async {
        try? await Task.sleep(nanoseconds: 6_000_000_000)
        showingALongTimeAgo = false
    }
}

#Preview {
    StarWarsScrollerView()
}
