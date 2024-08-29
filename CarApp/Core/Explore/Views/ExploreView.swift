//
//  ExploreView.swift
//  CarApp
//
//  Created by Pedro Delmondes  on 22/08/2024.
//

import SwiftUI

struct ExploreView: View {
    @StateObject var viewModel: ExploreViewModel
    init(viewModel: ExploreViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                ZStack {
                    GradientBackgroundColor()
                    VStack {
                        Spacer().frame(height: 150)
                        CustomSearchBar()
                        Spacer().frame(height: 60)
                        PopularBrandsView(viewModel: viewModel)
                        TopCarView(viewModel: viewModel)
                    }
                }
            }
            .navigationStackModifier()
        }
    }
}

#Preview {
    ExploreView(viewModel: ExploreViewModel())
}

struct GradientBackgroundColor: View {
    var body: some View {
        VStack {
            LinearGradient(colors: [.accentColor, .blue], startPoint: .top, endPoint: .bottom)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2 )
        }
    }
}


