//
//  SweeneyCloneWarsIntro.swift
//  
//
//  Created by Jeffrey Sweeney on 9/15/24.
//

import SwiftUI

public struct SweeneyCloneWarsIntro: View {
    @Binding var showingIntro: Bool
    @State private var showingALongTimeAgo = true
    
    let episodeNumber: UInt8
    let appName: String
    
    public var body: some View {
        ZStack {
            CWStarryBackgroundView()
            
            VStack {
                Spacer()
                Button(action: { showingIntro = false }, label: {
                    Text("SKIP")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 250)
                        .background(Color.gray.opacity(0.25))
                        .clipShape(Capsule())
                })
            }
            .padding(48)
            
            if showingALongTimeAgo {
                ALongTimeAgoView(showingView: $showingALongTimeAgo)
            } else {
                EpisodeView(showingView: $showingIntro, episodeNumber: episodeNumber, appName: appName)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}

#Preview {
    SweeneyCloneWarsIntro(showingIntro: .constant(true),episodeNumber: 2, appName: "AccuWeather Lite")
}
