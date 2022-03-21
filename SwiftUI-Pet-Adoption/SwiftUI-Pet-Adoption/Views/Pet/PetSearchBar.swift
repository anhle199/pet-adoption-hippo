//
//  PetSearchBar.swift
//  SwiftUI-Pet-Adoption
//
//  Created by Le Hoang Anh on 20/03/2022.
//

import SwiftUI

struct PetSearchBar: View {
    
    @State private var searchText = ""
    
    var body: some View {
        HStack {
            TextField("Search", text: $searchText)
                .foregroundColor(.gray)
                .font(.system(size: 16, weight: .regular))
                .padding(.leading)
            
            Spacer()
            
            Button(action: {}) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
                    .background(Color.primaryDark)
                    .cornerRadius(10)
            }
        }
        .frame(height: 40)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.lightGrey, lineWidth: 1)
        )
    }
    
}

struct PetSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        PetSearchBar()
    }
}
