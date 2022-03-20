//
//  WelcomeView.swift
//  SwiftUI-Pet-Adoption
//
//  Created by Le Hoang Anh on 20/03/2022.
//

import SwiftUI

struct WelcomeView: View {
    
    let pageData = SplashPage.dummies
    @State private var selectedIndex = 0
    private var numberOfPages: Int { pageData.count }
    
    var body: some View {
        ZStack {
            Color.primaryColor
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 20) {
                PagingView(
                    selectedIndex: $selectedIndex,
                    numberOfPages: numberOfPages
                ) {
                    ForEach(pageData, id: \.self) { page in
                        SplashView(model: page)
                    }
                }
                
                PageControlView(
                    selectedIndex: $selectedIndex,
                    numberOfPages: numberOfPages
                )
                
                PageNavigationButtonsView(
                    selectedIndex: $selectedIndex,
                    numberOfPages: numberOfPages
                )
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
