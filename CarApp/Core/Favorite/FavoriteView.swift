//
//  FavoriteView.swift
//  CarApp
//
//  Created by Pedro Delmondes  on 27/08/2024.
//

import SwiftUI

struct FavoriteView: View {
    @StateObject var viewModel: ExploreViewModel
    let index: Int
    
    var body: some View {
        ScrollView {
            Image(viewModel.cars[index].hostImageName)
                .resizable()
            .scaledToFit()
        }
    }
}

#Preview {
    FavoriteView(viewModel: ExploreViewModel(), index: 0)
}
