//
//  StarryBackgroundView.swift
//
//
//  Created by Jeffrey Sweeney on 9/15/24.
//

import SwiftUI

struct StarryBackgroundView: View {
    let starCount = 100  // Number of stars
    let starColor = Color.white  // Star color

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)  // Black background for the space
            
            ForEach(0..<starCount, id: \.self) { _ in
                Circle()
                    .fill(starColor)
                    .frame(width: randomSize(), height: randomSize())  // Random star size
                    .position(randomPosition())  // Random position
                    .opacity(Double.random(in: 0.5...1))  // Random opacity for variation
            }
        }
    }
    
    // Random size for stars
    func randomSize() -> CGFloat {
        return CGFloat.random(in: 2...4)
    }
    
    // Random position for stars
    func randomPosition() -> CGPoint {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        return CGPoint(x: CGFloat.random(in: 0...screenWidth),
                       y: CGFloat.random(in: 0...screenHeight))
    }
}

#Preview {
    StarryBackgroundView()
}
