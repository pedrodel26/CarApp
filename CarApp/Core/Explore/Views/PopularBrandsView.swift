//
//  PopularBrandsView.swift
//  CarApp
//
//  Created by Pedro Delmondes  on 26/08/2024.
//

import SwiftUI

struct PopularBrandsView: View {
    @StateObject private var viewModel: ExploreViewModel
    init(viewModel: ExploreViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Popular Brands")
                        .font(.headline)
                        .fontWeight(.semibold)
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("See All")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    })
                }
                .foregroundStyle(.white)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.brands) { brand in
                            RoundedRectangle(cornerRadius: 28)
                                .fill(.white)
                            .frame(width: 140, height: 220)
                            .overlay {
                                VStack {
                                    Image(brand.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 120 , height: 120)
                                    Text(brand.brandName)
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                }
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
            .padding(.horizontal)
            Spacer()
        }
//        .background(.orange)
    }
}

#Preview {
    PopularBrandsView(viewModel: ExploreViewModel())
}
