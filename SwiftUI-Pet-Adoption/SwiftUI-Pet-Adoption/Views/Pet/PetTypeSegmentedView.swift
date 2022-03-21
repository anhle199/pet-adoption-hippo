//
//  PetTypeSegmentedView.swift
//  SwiftUI-Pet-Adoption
//
//  Created by Le Hoang Anh on 20/03/2022.
//

import SwiftUI

struct PetTypeSegmentedView: View {
    
    private let petTypes = Pet.PetType.allCases
    @Binding var selectedPetType: Pet.PetType
    
    init(selection: Binding<Pet.PetType>) {
        self._selectedPetType = selection
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(petTypes) { petType in
                    let isSelected = selectedPetType == petType
                    
                    Button(action: { selectedPetType = petType }) {
                        VStack(alignment: .center) {
                            Image(petType.rawValue)
                                .frame(width: 64, height: 64)
                                .foregroundColor(
                                    isSelected ? .secondaryDark : .darkText
                                )
                                .background(
                                    isSelected ? Color.secondaryColor : Color.clear
                                )
                                .cornerRadius(16)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(
                                            Color.lightGrey,
                                            lineWidth: isSelected ? 0 : 1
                                        )
                                )
                                .padding(.top, 1)
                            
                            Text(petType.id)
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(
                                    .darkText.opacity(isSelected ? 1 : 0.5)
                                )
                        }
                    }
                }
            }
        }
    }
    
}

struct PetTypeSegmentedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
