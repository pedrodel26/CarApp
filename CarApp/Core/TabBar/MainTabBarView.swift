//
//  MainTabBarView.swift
//  CarApp
//
//  Created by Pedro Delmondes  on 22/08/2024.
//

import SwiftUI

struct MainTabBarView: View {
    
    @State private var selectedTab: Int = 0
    @State private var viewModel = ExploreViewModel()
    
    var body: some View {
        TabView {
            ExploreView(viewModel: viewModel)
                .tabItem {
                    VStack{
                        Image(systemName: "square.and.arrow.up.circle.fill")
                            .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                        Text("Client")
                    }
                }
                .onAppear {
                    selectedTab = 0
                }
            
            FavoriteView(viewModel: viewModel, index: 0)
                .font(.title)
                .tabItem {
                    VStack{
                        Image(systemName: "square.and.arrow.up.circle.fill")
                            .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
                        Text("Favorite")
                    }
                }
                .onAppear {
                    selectedTab = 1
                }
            
            Text("Oie")
                .tabItem {
                    VStack{
                        Image(systemName: "square.and.arrow.up.circle.fill")
                        Text("Home")
                    }
                }
                .onAppear {
                    selectedTab = 2
                }
            
            Text("Oie")
                .tabItem {
                    VStack{
                        Image(systemName: "square.and.arrow.up.circle.fill")
                            .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                        Text("Client")
                    }
                }
                .onAppear {
                    selectedTab = 3
                }
            
            Text("Oie")
                .tabItem {
                    VStack{
                        Image(systemName: "square.and.arrow.up.circle.fill")
                            .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                        Text("Client")
                    }
                }
                .onAppear {
                    selectedTab = 4
                }
        }
    }
}

#Preview {
    MainTabBarView()
}
