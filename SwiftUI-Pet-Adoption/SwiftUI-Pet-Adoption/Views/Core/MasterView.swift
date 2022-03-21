//
//  MasterView.swift
//  SwiftUI-Pet-Adoption
//
//  Created by Le Hoang Anh on 20/03/2022.
//

import SwiftUI

struct MasterView: View {
    
    @State private var selectedType: TabBarView.TabBarType = .home
    
    init() {
        UINavigationBar.appearance().backgroundColor = .white
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    switch selectedType {
                    case .home:
                        HomeView()
                            .padding(
                                .bottom,
                                geometry.safeAreaInsets.bottom > 0 ? 50 : 70
                            )
                    default:
                        Color.white
                    }
                    
                    TabBarView(selectedType: $selectedType)
                }
            }
        }
        .navigationViewStyle(.stack)
    }
    
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView()
    }
}
