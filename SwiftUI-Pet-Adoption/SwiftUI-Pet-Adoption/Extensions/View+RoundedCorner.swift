//
//  View+RoundedCorner.swift
//  SwiftUI-Pet-Adoption
//
//  Created by Le Hoang Anh on 20/03/2022.
//

import SwiftUI

struct RoundedCorner: Shape {
    
    var radius: CGFloat = 0
    var corners = UIRectCorner.allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: .init(width: radius, height: radius)
        )
        
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
