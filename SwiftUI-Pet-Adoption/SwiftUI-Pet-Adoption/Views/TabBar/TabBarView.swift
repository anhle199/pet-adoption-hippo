//
//  TabBarView.swift
//  SwiftUI-Pet-Adoption
//
//  Created by Le Hoang Anh on 21/03/2022.
//

import SwiftUI

struct TabBarView: View {
    
    @Binding var selectedType: TabBarType
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                HStack {
                    Spacer()

                    ForEach(TabBarType.allCases) { type in
                        TabBarItem(
                            type: type,
                            isActive: .constant(selectedType == type)
                        )
                        .onTapGesture {
                            withAnimation {
                                selectedType = type
                            }
                        }

                        Spacer()
                    }
                }
                .padding(.vertical, 12)
                .padding(.bottom, geometry.safeAreaInsets.bottom > 0 ? 12 : 0)
                .background(.white)
                .overlay(alignment: .top) {
                    Divider()
                }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
    
    enum TabBarType: String, Identifiable, CaseIterable {
        case home, message, favorite, profile
        
        var image: String {
            switch self {
            case .home:
                return "house"
            case .message:
                return "envelope"
            case .favorite:
                return "heart"
            case .profile:
                return "person"
            }
        }
        
        var id: String { rawValue.capitalized }
    }
    
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selectedType: .constant(.home))
    }
}
