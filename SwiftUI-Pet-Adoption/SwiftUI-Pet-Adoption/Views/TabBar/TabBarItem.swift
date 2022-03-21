//
//  TabBarItem.swift
//  SwiftUI-Pet-Adoption
//
//  Created by Le Hoang Anh on 21/03/2022.
//

import SwiftUI

struct TabBarItem: View {
    
    let type: TabBarView.TabBarType
    @Binding var isActive: Bool
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: type.image)
                .scaleEffect(1.2)
            
            if isActive {
                Text(type.id)
                    .font(.system(size: 15, weight: .medium))
                    .lineLimit(1)
            }
        }
        .foregroundColor(isActive ? .white : .accent)
        .padding(.vertical, 10)
        .padding(.horizontal, 14)
        .background(isActive ? Color.primaryDark : Color.clear)
        .cornerRadius(isActive ? 30 : 0)
    }
    
}

struct TabBarItem_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TabBarItem(type: .home, isActive: .constant(false))
            TabBarItem(type: .message, isActive: .constant(false))
            TabBarItem(type: .favorite, isActive: .constant(false))
            TabBarItem(type: .profile, isActive: .constant(false))
            TabBarItem(type: .home, isActive: .constant(true))
            TabBarItem(type: .message, isActive: .constant(true))
            TabBarItem(type: .favorite, isActive: .constant(true))
            TabBarItem(type: .profile, isActive: .constant(true))
        }
    }
}
