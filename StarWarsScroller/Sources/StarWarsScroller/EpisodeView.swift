//
//  EpisodeView.swift
//
//
//  Created by Jeffrey Sweeney on 9/15/24.
//

import SwiftUI

internal struct EpisodeView: View {
    @State private var shouldStartDisappearing = false
    @State private var showingCloneWars = true
    
    var body: some View {
        Group {
            if showingCloneWars {
                Text("Clone Wars!")
                    .task { await showEpisode() }
            } else {
                VStack(alignment: .center, spacing: 24) {
                    Text("Episode I")
                    Text("iPhone Calculator")
                }
                .task { await completeIntro() }
            }
        }
        .font(.largeTitle)
        .bold()
        .foregroundStyle(Color.CWScrollerColor)
        .opacity(shouldStartDisappearing ? 0 : 1)
        .scaleEffect(shouldStartDisappearing ? 0.5 : 1)
        .animation(.easeInOut(duration: 5), value: shouldStartDisappearing)
    }
    
    @MainActor
    private func showEpisode() async {
        shouldStartDisappearing = true
        try? await Task.sleep(nanoseconds: 5_000_000_000)
        showingCloneWars = false
        shouldStartDisappearing = false
    }
    
    @MainActor
    private func completeIntro() async {
        try? await Task.sleep(nanoseconds: 1_000_000_000) // Allow moment before fading
        shouldStartDisappearing = true
        try? await Task.sleep(nanoseconds: 5_000_000_000) // Allow full fadeout
        // TODO: Close intro flow
    }
}

#Preview {
    EpisodeView()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
}
