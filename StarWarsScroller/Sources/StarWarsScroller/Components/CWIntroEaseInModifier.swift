//
//  CWIntroEaseInModifier.swift
//
//
//  Created by Jeffrey Sweeney on 9/15/24.
//

import SwiftUI

internal struct CWIntroEaseInModifier: ViewModifier {
    let introMessage: IntroMessage
    @Binding var showingContent: Bool
    
    func body(content: Content) -> some View {
        content
            .opacity(showingContent ? 1 : 0)
            .animation(.easeIn(duration: introMessage.duration), value: showingContent)
            .onAppear {
                if !showingContent {
                    Task { await addText() }
                }
            }
    }
    
    private func addText() async {
        try? await Task.sleep(nanoseconds: introMessage.delay)
        showingContent = true
    }
    
    enum IntroMessage {
        case firstText
        case secondText
        
        var duration: Double {
            switch self {
            case .firstText:
                1
            case .secondText:
                1.5
            }
        }
        
        var delay: UInt64 {
            switch self {
            case .firstText:
                return 500_000_000
            case .secondText:
                return 2_750_000_000
            }
        }
    }
}
