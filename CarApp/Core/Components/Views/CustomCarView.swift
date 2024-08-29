//
//  CustomCarView.swift
//  CarApp
//
//  Created by Pedro Delmondes  on 27/08/2024.
//

import SwiftUI

struct CustomCarView: View {
    @StateObject private var viewModel: ExploreViewModel
    private var index: Int
    @State private var  isFavorite: Bool
        
    init(viewModel: ExploreViewModel, index: Int) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.index = index
        self.isFavorite = viewModel.cars[index].isFavorite
    }
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 22)
                .fill(.white)
                .frame(height: 120)
                .overlay {
                    HStack(spacing: 12) {
                        Image(viewModel.cars[index].mainImageName)
                            .resizable()
                            .frame(width: 80, height: 50)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(viewModel.cars[index].carName)
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.black)
                            
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundStyle(.orange)
                                    .font(.caption)
                                
                                Text(String(format: "%.1f", viewModel.cars[index].rating))
                                    .font(.subheadline)
                                    .foregroundStyle(.black)
                            }
                            Text("By \(viewModel.cars[index].hostName)")
                                .font(.subheadline)
                                .foregroundStyle(Color(.systemGray2))
                        }
                        Button(action: {
                            isFavorite.toggle()
                        }, label: {
                            Image(systemName: isFavorite ? "heart.fill" : "heart")
                                .foregroundStyle(.red)
                        })
                    }
                    .padding(.horizontal, 4)
                }
                .padding()
            Spacer()
        }
    }
}

#Preview {
    CustomCarView(viewModel: ExploreViewModel(), index: 0)
}
