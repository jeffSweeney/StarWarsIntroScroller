//
//  CWHollowText.swift
//
//
//  Created by Jeffrey Sweeney on 9/16/24.
//

import SwiftUI

internal struct CWHollowText: View {
    let text: String
    let fontSize: CGFloat
    let strokeWidth: CGFloat
    let foregroundColor: Color
    let strokeColor: Color
    
    var body: some View {
        ZStack {
            ZStack {
                Text(text).offset(x:  strokeWidth, y:  strokeWidth)
                Text(text).offset(x: -strokeWidth, y: -strokeWidth)
                Text(text).offset(x: -strokeWidth, y:  strokeWidth)
                Text(text).offset(x:  strokeWidth, y: -strokeWidth)
            }
            .foregroundColor(strokeColor)
            
            Text(text).foregroundColor(foregroundColor)
        }
        .font(.system(size: fontSize, weight: .bold))
    }
}

#Preview {
    CWHollowText(text: "Clone Wars!",
                 fontSize: 72,
                 strokeWidth: 2,
                 foregroundColor: .black,
                 strokeColor: .red)
}
