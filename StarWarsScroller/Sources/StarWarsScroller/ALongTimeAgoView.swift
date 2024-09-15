//
//  ALongTimeAgoView.swift
//  
//
//  Created by Jeffrey Sweeney on 9/15/24.
//

import SwiftUI

internal struct ALongTimeAgoView: View {
    @State private var showingFirstText = false
    @State private var showingSecondText = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("A long time ago in a galaxy far, far away ....")
                .modifier(CWIntroEaseInModifier(introMessage: .firstText, showingContent: $showingFirstText))
            
            Text("Or probably just sometime recently from my home in Maryland ...")
                .modifier(CWIntroEaseInModifier(introMessage: .secondText, showingContent: $showingSecondText))
        }
        .font(.title)
        .foregroundStyle(Color.CWFarFarAwayColor)
        .fontWeight(.semibold)
        .padding(.horizontal)
    }
}

#Preview {
    ALongTimeAgoView()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
}
