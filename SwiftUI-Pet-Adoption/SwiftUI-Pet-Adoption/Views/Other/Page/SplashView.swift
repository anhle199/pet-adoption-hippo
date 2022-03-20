//
//  SplashView.swift
//  SwiftUI-Pet-Adoption
//
//  Created by Le Hoang Anh on 20/03/2022.
//

import SwiftUI

struct SplashView: View {
    
    let model: SplashPage
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Image(model.image)
                .frame(maxWidth: .infinity)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(model.title)
                    .font(.system(size: 30, weight: .medium))
                
                Text(model.description)
                    .font(.system(size: 18, weight: .regular))
            }
            .foregroundColor(.white)
            .padding(.horizontal)
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(model: SplashPage.dummies[0])
    }
}
