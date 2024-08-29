//
//  NavigationStackModifier.swift
//  CarApp
//
//  Created by Pedro Delmondes  on 26/08/2024.
//

import SwiftUI

struct NavigationStackModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(.systemGray4))
            .ignoresSafeArea()
            .navigationTitle("Find a car")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Circle()
                        .fill(.white.opacity(0.5))
                        .frame(width: 45, height: 45)
                        .overlay {
                            Image(systemName: "bell.badge")
                        }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Circle()
                        .fill(.white.opacity(0.5))
                        .frame(width: 45, height: 45)
                        .overlay {
                            Image("Image")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 45, height: 45)
                                .clipShape(Circle())
                        }
                }
            }
    }
}

extension View {
    func navigationStackModifier() -> some View {
        modifier(NavigationStackModifier())
    }
}
