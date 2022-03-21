//
//  HomeView.swift
//  SwiftUI-Pet-Adoption
//
//  Created by Le Hoang Anh on 20/03/2022.
//

import SwiftUI

struct HomeView: View {
    
    @State private var locationSearchText = "New York, USA"
    @State private var selectedPetType: Pet.PetType = .dogs
    
    var body: some View {
        VStack(spacing: 0) {
            PetSearchBar()
                .padding(.vertical)
                .padding(.horizontal, 20)
            
            PetTypeSegmentedView(selection: $selectedPetType)
                .padding(.bottom)
                .padding(.leading, 20)

            PetGridView(petType: $selectedPetType)
                .padding(.top)
                .padding(.horizontal, 20)
        }
        .background(.white)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                LocationSearchBar()
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                ProfileImage()
            }
        }
    }
    
    @ViewBuilder
    private func ProfileImage() -> some View {
        Image("profile")
            .resizable()
            .scaledToFill()
            .frame(width: 36, height: 36)
            .clipShape(Circle())
    }
    
    @ViewBuilder
    private func LocationSearchBar() -> some View {
        HStack(spacing: 12) {
            Image("location")
                .foregroundColor(.primaryColor)
            
            TextField("Search for location", text: $locationSearchText)
                .font(.system(size: 14))
                .foregroundColor(.darkText)
            
            Spacer()
            
            Image(systemName: "xmark")
                .scaleEffect(0.6)
                .foregroundColor(.primaryDark)
        }
        .padding(.horizontal, 12)
        .frame(width: 290, height: 36)
        .background(Color.primaryLight)
        .cornerRadius(20)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
        .navigationViewStyle(.stack)
    }
}
