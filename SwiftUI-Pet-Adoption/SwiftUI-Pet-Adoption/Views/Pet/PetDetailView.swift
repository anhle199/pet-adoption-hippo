//
//  PetDetailView.swift
//  SwiftUI-Pet-Adoption
//
//  Created by Le Hoang Anh on 21/03/2022.
//

import SwiftUI

struct PetDetailView: View {
    
    let pet: Pet
    @Binding var isFavorite: Bool
    @State private var currentImageIndex = 0
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ScrollView(.vertical, showsIndicators: true) {
                    // List of pet images
                    ZStack(alignment: .bottom) {
                        PagingView(
                            selectedIndex: $currentImageIndex,
                            numberOfPages: pet.images.count
                        ) {
                            ForEach(pet.images, id: \.self ) { image in
                                Image(image)
                                    .resizable()
                                    .cornerRadius(32, corners: [.bottomLeft, .bottomRight])
                            }
                        }
                        .frame(height: 355)
                        
                        ImageControlView()
                            .padding(.bottom, 10)
                    }
                    
                    HStack {
                        BoxDetailView(
                            title: "Age",
                            description: "\(pet.age) \(pet.age > 1 ? "months" : "month")"
                        )
                        
                        Spacer()
                        
                        BoxDetailView(
                            title: "Weight",
                            description: "\(pet.weight) kg"
                        )
                        
                        Spacer()
                        
                        BoxDetailView(
                            title: "Sex",
                            description: pet.gender.rawValue.capitalized
                        )
                    }
                    .padding(.top, 10)
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text(pet.name)
                                .font(.system(size: 18, weight: .medium))
                            
                            Spacer()
                            
                            Text(pet.breed.description)
                                .font(.system(size: 18, weight: .regular))
                        }
                        
                        HStack(spacing: 12) {
                            Image("location")
                            
                            
                            Text("110 N 3th St, Brooklyn, NY, USA")
                                .font(.system(size: 14, weight: .regular))
                                .foregroundColor(.darkText)
                            
                            Spacer()
                        }
                        .padding(.bottom, 10)
                        
                        Text("About")
                            .font(.system(size: 18, weight: .medium))
                        
                        Text(pet.description)
                            .font(.system(size: 16, weight: .regular))
                            .lineSpacing(3)
                            .foregroundColor(
                                Color(uiColor: .label)
                                    .opacity(0.8)
                            )
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .safeAreaInset(edge: .bottom) {
                    HStack(spacing: 16) {
                        Button(action: {}) {
                            HStack {
                                Image("paw")
                                Text("Adopt")
                                    .font(.system(size: 18, weight: .medium))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(Color.primaryDark)
                            .cornerRadius(16)
                        }
                        
                        Button(action: {}) {
                            Image(systemName: "phone.fill")
                                .font(.system(size: 24))
                                .foregroundColor(.primaryColor.opacity(0.7))
                                .padding()
                                .background(Color.primaryDark.opacity(0.5))
                                .cornerRadius(16)
                        }
                    }
                    .padding(
                        geometry.safeAreaInsets.bottom > 0
                        ? [.top, .horizontal]
                        : .all
                    )
                    .background(Color.white.ignoresSafeArea())
                }
            }
            .edgesIgnoringSafeArea(.top)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    BackButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    HeartButton()
                }
        }
        }
    }
    
    @ViewBuilder
    private func BackButton() -> some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.5), radius: 1, x: 0, y: 0)
        }
    }
    
    @ViewBuilder
    private func HeartButton() -> some View {
        Button {
            isFavorite.toggle()
        } label: {
            Image(systemName: isFavorite ? "heart.fill" : "heart")
                .foregroundColor(.primaryDark)
                .frame(width: 36, height: 36)
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.3), radius: 1, x: 0, y: 0)
                .padding(10)
        }
    }
    
    @ViewBuilder
    private func ImageControlView() -> some View {
        HStack(spacing: 8) {
            ForEach(0..<pet.images.count, id: \.self) { index in
                Circle()
                    .fill(
                        currentImageIndex == index
                        ? Color.primaryColor
                        : Color.primaryDark
                    )
                    .frame(width: 8, height: 8)
                    .scaleEffect(currentImageIndex == index ? 1.5 : 1)
            }
        }
    }
    
}

struct PetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PetDetailView(pet: Pet.dogs[0], isFavorite: .constant(false))
        }
        .navigationViewStyle(.stack)
    }
}
