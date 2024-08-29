//
//  SwiftUIView.swift
//  CarApp
//
//  Created by Pedro Delmondes  on 26/08/2024.
//

import SwiftUI

struct CustomSearchBar: View {
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            HStack(spacing: 2) {
                Image(systemName: "magnifyingglass")
                    .padding()
                    .foregroundStyle(.black)
                Text("Search for a car...")
                    .font(.footnote)
                    .foregroundStyle(.black)
                
                Spacer()
            }
            .frame(width: 340, height: 70)
            .overlay {
                Capsule()
                    .stroke(lineWidth: 0.5)
                    .foregroundStyle(Color(.gray))
                    .shadow(color: .black.opacity(0.5), radius: 10)
            }
            .padding(.horizontal)
        })
    }
}

#Preview {
    CustomSearchBar()
}
