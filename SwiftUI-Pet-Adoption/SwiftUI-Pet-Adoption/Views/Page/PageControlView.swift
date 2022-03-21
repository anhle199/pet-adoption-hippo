//
//  PageControlView.swift
//  SwiftUI-Pet-Adoption
//
//  Created by Le Hoang Anh on 20/03/2022.
//

import SwiftUI

struct PageControlView: View {
    
    @Binding var selectedIndex: Int
    private let maxIndex: Int
    
    init(selectedIndex: Binding<Int>, numberOfPages: Int) {
        self._selectedIndex = selectedIndex
        self.maxIndex = numberOfPages - 1
    }
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0...maxIndex, id: \.self) { index in
                if selectedIndex == index {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(.white)
                        .frame(width: 20, height: 8)
                } else {
                    Circle()
                        .stroke(.white, lineWidth: 1)
                        .frame(width: 8, height: 8)
                }
            }
        }
    }
    
}

struct PageControlView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
