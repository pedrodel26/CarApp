//
//  ImageViewPager.swift
//  CarApp
//
//  Created by Pedro Delmondes  on 28/08/2024.
//

import SwiftUI

struct ImageViewPager: View {
    @StateObject private var viewModel: ExploreViewModel
    @Environment(\.dismiss) var dismiss
    let heightTabView: CGFloat = UIScreen.main.bounds.height / 3
    @State private var isFavorite: Bool
    let index: Int
    init(viewModel: ExploreViewModel, index: Int) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.index = index
        self._isFavorite = State(initialValue: viewModel.cars[index].isFavorite)
    }
    
    var body: some View {
        TabView {
            ForEach(viewModel.cars[index].imageNames, id: \.self) { imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
            }
        }
//        .padding(.top, 40)
        .tabViewStyle(.page)
        .frame(height: heightTabView)
        .overlay {
            VStack {
                HStack {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "chevron.backward.circle")
                            .frame(width: 40, height: 40)
                            .font(.title)
                            .fontWeight(.bold)
                        
                    })
                    Spacer()
                    
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.accent)
                        .frame(width: 40, height: 40)
                        .overlay {
                            Button(action: {
                                isFavorite.toggle()
                            }, label: {
                                Image(systemName: "heart")
                                    .foregroundStyle(.white)
                            })
                        }
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 44)
            
        }
    }
}

#Preview {
    ImageViewPager(viewModel: ExploreViewModel(), index: 0)
}
