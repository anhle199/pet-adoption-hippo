//
//  PagingView.swift
//  SwiftUI-Pet-Adoption
//
//  Created by Le Hoang Anh on 20/03/2022.
//

import SwiftUI

struct PagingView<Content>: View where Content: View {
    
    @Binding var selectedIndex: Int
    private let maxIndex: Int
    let content: () -> Content
    
    @State private var _offset: CGFloat = 0
    @State private var _isDragging = false
    
    init(
        selectedIndex: Binding<Int>,
        numberOfPages: Int,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._selectedIndex = selectedIndex
        self.maxIndex = numberOfPages - 1
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    self.content()
                        .frame(
                            width: geometry.size.width,
                            height: geometry.size.height
                        )
                        .clipped()
                }
            }
            .content.offset(x: offset(in: geometry), y: 0)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        _isDragging = true
                        _offset = -(CGFloat(selectedIndex) * geometry.size.width) + value.translation.width
                    }
                    .onEnded { value in
                        let predictedEndOffset = -(CGFloat(selectedIndex) * geometry.size.width) + value.predictedEndTranslation.width
                        let predictedIndex = Int(round(predictedEndOffset) / -geometry.size.width)
                        
                        self.selectedIndex = clamppedIndex(from: predictedIndex)
                        withAnimation(.easeOut) {
                            _isDragging = false
                        }
                    }
            )
        }
    }
    
    private func offset(in geometry: GeometryProxy) -> CGFloat {
        if _isDragging {
            return max(min(_offset, 0), -CGFloat(maxIndex) * geometry.size.width)
        }
        
        return -CGFloat(selectedIndex) * geometry.size.width
    }
    
    private func clamppedIndex(from predictedIndex: Int) -> Int {
        let newIndex = min(
            max(predictedIndex, selectedIndex - 1),
            selectedIndex + 1
        )
        
        guard newIndex >= 0 else { return 0 }
        guard newIndex <= maxIndex else { return maxIndex }
        
        return newIndex
    }
    
}

struct PagingView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
