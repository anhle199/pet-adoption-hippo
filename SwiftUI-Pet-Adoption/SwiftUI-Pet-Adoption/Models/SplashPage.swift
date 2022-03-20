//
//  SplashPage.swift
//  SwiftUI-Pet-Adoption
//
//  Created by Le Hoang Anh on 20/03/2022.
//

import Foundation

struct SplashPage: Hashable {
    let image: String
    let title: String
    let description: String
    
    static let dummies = [
        SplashPage(
            image: "splash.image.1",
            title: "Make new Friends",
            description: "Here you can meet vour dream friend and joy with them."
        ),
        SplashPage(
            image: "splash.image.2",
            title: "Don't Shop! Adopt",
            description: "Most adoptable pets come from loving homes that simply cannot care for them anymore."
        ),
        SplashPage(
            image: "splash.image.3",
            title: "Adopt a new friend",
            description: "There's a saying. If you want someone to love you forever, adopt a new friend, feed it and keep it around."
        ),
    ]
}
