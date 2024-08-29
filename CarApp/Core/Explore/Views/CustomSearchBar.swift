//
//  SwiftUIView.swift
//  CarApp
//
//  Created by Pedro Delmondes  on 26/08/2024.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    Color(.systemCyan)
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    SwiftUIView()
}
