//
//  DetailView.swift
//  CarApp
//
//  Created by Pedro Delmondes  on 28/08/2024.
//

import SwiftUI

struct DetailView: View {
        let index: Int
        @StateObject private var viewModel: ExploreViewModel
        
        init(viewModel: ExploreViewModel,index: Int) {
            self._viewModel = StateObject(wrappedValue: viewModel)
            self.index = index
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 2) {
                ImageViewPager(viewModel: viewModel, index: index)
                CarInfosView(viewModel: viewModel, index: index)
                
                HStack {
                    Text(String(format: "%.1f", viewModel.cars[index].rating))
                        .fontWeight(.semibold)
                    
                    Image(systemName: "star.fill")
                        .foregroundStyle(.orange)
                }
                .padding()
                
            }
            
        }
        .ignoresSafeArea()
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    DetailView(viewModel: ExploreViewModel(), index: 0)
}

struct CarInfosView: View {
    @StateObject private var viewModel: ExploreViewModel
    let index: Int
    init(viewModel: ExploreViewModel, index: Int) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.index = index
    }
    
    var body: some View {
        VStack(spacing: 2) {
            Text(viewModel.cars[index].carName)
                .font(.title2)
                .fontWeight(.semibold)
        }
        .padding()
    }
}
