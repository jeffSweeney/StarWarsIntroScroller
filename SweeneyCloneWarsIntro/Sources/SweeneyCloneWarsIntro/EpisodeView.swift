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
    
    let episodeNumber: UInt8
    let appName: String
    
    var body: some View {
        Group {
            if showingCloneWars {
                CWHollowText(text: "Clone Wars!",
                           fontSize: 84,
                           strokeWidth: 0.75,
                           foregroundColor: .black,
                           strokeColor: Color.CWScrollerColor)
                .task { await cycleViews() }
            } else {
                VStack(alignment: .center, spacing: 24) {
                    Text("Episode \(episodeNumber)")
                    Text(appName)
                        .multilineTextAlignment(.center)
                        .minimumScaleFactor(0.85)
                }
                .font(.largeTitle)
                .bold()
                .foregroundStyle(Color.CWScrollerColor)
                .task { await cycleViews() }
            }
        }
        .padding(.horizontal)
        .opacity(shouldStartDisappearing ? 0 : 1)
        .scaleEffect(shouldStartDisappearing ? 0.5 : 1)
        .animation(.easeOut(duration: 5), value: shouldStartDisappearing)
    }
    
    @MainActor
    private func cycleViews() async {
        try? await Task.sleep(nanoseconds: 1_000_000_000) // Allow moment before fading
        shouldStartDisappearing = true
        try? await Task.sleep(nanoseconds: 5_000_000_000) // Allow full fadeout
        
        if showingCloneWars {
            showingCloneWars = false
            shouldStartDisappearing = false
        }
    }
}

#Preview {
    EpisodeView(episodeNumber: 1, appName: "iPhone Calculator")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
}
