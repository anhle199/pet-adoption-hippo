//
//  PetGridView.swift
//  SwiftUI-Pet-Adoption
//
//  Created by Le Hoang Anh on 20/03/2022.
//

import SwiftUI

struct PetGridView: View {
    
    @Binding var petType: Pet.PetType
    
    var body: some View {
        if petType.pets.isEmpty {
            Text("No Data")
                .font(.system(size: 20, weight: .regular))
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .center
                )
        } else {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(
                    columns: [
                        GridItem(.flexible(), spacing: 20),
                        GridItem(.flexible(), spacing: 20),
                    ],
                    spacing: 20
                ) {
                    ForEach(petType.pets) { pet in
                        PetView(pet: pet)
                    }
                }
            }
        }
    }
    
}

fileprivate extension Pet.PetType {
    var pets: [Pet] {
        switch self {
        case .dogs:
            return Pet.dogs
        case .cats:
            return Pet.cats
        default:
            return []
        }
    }
}

struct PetGridView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
