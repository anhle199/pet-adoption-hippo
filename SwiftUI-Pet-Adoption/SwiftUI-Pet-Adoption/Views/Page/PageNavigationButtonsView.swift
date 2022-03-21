//
//  PageNavigationButtonsView.swift
//  SwiftUI-Pet-Adoption
//
//  Created by Le Hoang Anh on 20/03/2022.
//

import SwiftUI

struct PageNavigationButtonsView: View {
    
    @Binding var selectedIndex: Int
    private let maxIndex: Int
    
    @State private var showHomeView = false
    
    init(selectedIndex: Binding<Int>, numberOfPages: Int) {
        self._selectedIndex = selectedIndex
        self.maxIndex = numberOfPages - 1
    }
    
    var isFirstPage: Bool { selectedIndex == 0 }
    var isLastPage: Bool { selectedIndex == maxIndex }
    
    var body: some View {
        HStack {
            Button {
                withAnimation(.easeOut) {
                    selectedIndex -= 1
                }
            } label: {
                Text("Back")
                    .foregroundColor(
                        Color.white
                            .opacity(isFirstPage ? 0.5 : 1)
                    )
                    .font(.system(size: 20, weight: .semibold))
            }
            .frame(width: 120, height: 60)
            .background(
                Color.primaryDark
                    .opacity(isFirstPage ? 0.5 : 1)
            )
            .cornerRadius(30, corners: [.topRight, .bottomRight])
            .disabled(isFirstPage)
            
            Spacer()
            
            Button {
                withAnimation(.easeOut) {
                    if !isLastPage {
                        selectedIndex += 1
                    } else {
                        showHomeView.toggle()
                    }
                }
            } label: {
                Text(isLastPage ? "Start" : "Next")
                    .foregroundColor(.primaryColor)
                    .font(.system(size: 20, weight: .semibold))
            }
            .frame(width: 120, height: 60)
            .background(Color.white)
            .cornerRadius(30, corners: [.topLeft, .bottomLeft])
            .fullScreenCover(isPresented: $showHomeView) {
                MasterView()
            }
        }
    }
    
}

struct PageNavigationButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
