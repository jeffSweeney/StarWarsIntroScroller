//
//  ALongTimeAgoView.swift
//  
//
//  Created by Jeffrey Sweeney on 9/15/24.
//

import SwiftUI

internal struct ALongTimeAgoView: View {
    @Binding var showingView: Bool
    @State private var showingFirstText = false
    @State private var showingSecondText = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("A long time ago in a galaxy far, far away ...")
                .modifier(CWIntroEaseInModifier(introMessage: .firstText, showingContent: $showingFirstText))
            
            Text("Or probably just sometime recently from my home in Maryland ...")
                .modifier(CWIntroEaseInModifier(introMessage: .secondText, showingContent: $showingSecondText))
        }
        .font(.title)
        .foregroundStyle(Color.SCWFarFarAwayColor)
        .fontWeight(.semibold)
        .padding(.horizontal)
        .onChange(of: showingSecondText, { Task { await completeView() } })
    }
    
    @MainActor
    private func completeView() async {
        guard showingFirstText, showingSecondText else { return }
        
        try? await Task.sleep(nanoseconds: 4_000_000_000) // Leave pause before completion
        showingView = false
    }
}

#Preview {
    ALongTimeAgoView(showingView: .constant(true))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
}
