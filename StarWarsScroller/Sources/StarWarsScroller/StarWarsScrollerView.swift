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
                ALongTimeAgoView(showingView: $showingALongTimeAgo)
            } else {
                EpisodeView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}

#Preview {
    StarWarsScrollerView()
}
