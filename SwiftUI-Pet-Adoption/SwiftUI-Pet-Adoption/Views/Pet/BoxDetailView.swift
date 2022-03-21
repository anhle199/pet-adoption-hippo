//
//  BoxDetailView.swift
//  SwiftUI-Pet-Adoption
//
//  Created by Le Hoang Anh on 21/03/2022.
//

import SwiftUI

struct BoxDetailView: View {
    
    let title: String
    let description: String
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.darkText)
                .lineLimit(1)
            
            Text(description)
                .font(.system(size: 16, weight: .medium))
                .lineLimit(1)
        }
        .padding(10)
        .frame(minWidth: 100, minHeight: 65)
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.lightGrey, lineWidth: 1)
        }
    }
    
}

struct BoxDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BoxDetailView(title: "Age", description: "9 months")
    }
}
