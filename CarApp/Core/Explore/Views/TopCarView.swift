//
//  TopCarView.swift
//  CarApp
//
//  Created by Pedro Delmondes  on 27/08/2024.
//

import SwiftUI

struct TopCarView: View {
    @StateObject private var viewModel: ExploreViewModel
    init(viewModel: ExploreViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        VStack {
            HStack {
                Text("Top Cars 🔥")
                    .font(.headline)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding()
            
            ForEach (viewModel.cars) { car in
                let index = viewModel.cars.firstIndex(where: {$0 == car}) ?? 0
                NavigationLink {
                    DetailView(viewModel: viewModel, index: index)
                        .navigationBarBackButtonHidden()
                } label: {
                    CustomCarView(viewModel: viewModel, index: index)
                }
            }
        }
    }
}

#Preview {
    TopCarView(viewModel: ExploreViewModel())
}
