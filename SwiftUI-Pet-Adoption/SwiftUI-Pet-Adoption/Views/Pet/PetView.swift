//
//  PetView.swift
//  SwiftUI-Pet-Adoption
//
//  Created by Le Hoang Anh on 20/03/2022.
//

import SwiftUI

struct PetView: View {
    
    let pet: Pet
    @State private var isFavorite = true
    
    var isMale: Bool { pet.gender == .male }
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .topTrailing) {
                Image(pet.images.first ?? "photo")
                    .resizable()
                    .frame(height: 160)
                    .cornerRadius(16, corners: [.topLeft, .topRight])
                
                Button {
                    isFavorite.toggle()
                } label: {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(.primaryDark)
                        .frame(width: 32, height: 32)
                        .background(.white)
                        .clipShape(Circle())
                        .shadow(color: .black.opacity(0.3), radius: 1, x: 0, y: 0)
                        .padding(10)
                }
            }
            
            HStack {
                Text(pet.displayType)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(isMale ? .primaryYellow : .primaryColor)
                    .frame(width: 70, height: 22)
                    .background(
                        isMale ? Color.secondaryYellow : Color.primaryLight
                    )
                    .cornerRadius(11)
                
                Spacer()
                
                Image(pet.gender.rawValue)
            }
            .padding(10)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(pet.name)
                    .font(.system(size: 18, weight: .medium))
                
                Text(pet.breed.description)
                    .font(.system(size: 14, weight: .regular))
            }
            .foregroundColor(.darkText)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.horizontal, .bottom], 10)
        }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.lightGrey, lineWidth: 1)
        )
    }
    
}


struct PetView_Previews: PreviewProvider {
    static var previews: some View {
        PetView(pet: Pet.dogs[5])
    }
}
