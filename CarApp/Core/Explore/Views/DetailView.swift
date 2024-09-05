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
                Divider()
                TripDatesView()
                Divider()
                ExtractedView(viewModel: viewModel, index: index)
                Spacer()
                    .frame(height: 35)
                
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
        
        HStack {
            Text(String(format: "%.1f", viewModel.cars[index].rating))
                .fontWeight(.semibold)
            
            Image(systemName: "star.fill")
                .foregroundStyle(.orange)
        }
        .padding()
    }
}

struct ReusableCarView: View {
    var title: String
    var subtitle: String
    var imageName: String?
    var secondSubtitle: Date?
    var readButton: Bool?
    @State private var showInsuranceView: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack {
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(.darkGray))
            }
            
            HStack(spacing: 12) {
                if let imageName = imageName {
                    Image(systemName: imageName)
                        .resizable()
                        .frame(width: 24, height: 28)
                        .foregroundStyle(.red)
                }
                VStack(alignment: .leading, spacing: 4) {
                    Text(subtitle)
                    HStack {
                        if let secondSubtitle = secondSubtitle {
                            Text("Full refund before: ")
                                .font(.caption)
                            Text(secondSubtitle, style: .date)
                                .font(.footnote)
                                .fontWeight(.semibold)
                        }
                    }
                }
                Spacer()
                if readButton != nil {
                    Button(action: {
                        showInsuranceView.toggle()
                    }, label: {
                        Text("Read more")
                            .bold()
                    })
                }
            }
            
        }
        .padding(.horizontal)
        .sheet(isPresented: $showInsuranceView) {
            VStack(alignment: .center, spacing: 35) {
                RoundedRectangle(cornerRadius: 2)
                    .frame(width: 60, height: 5)
                    .foregroundStyle(Color(.systemGray))
                
                Image(systemName: "questionmark")
                    .resizable()
                    .frame(width: 25, height: 40)
                
                Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .padding()
            
        }
        
    }
}

struct ExtractedView: View {
    @StateObject private var viewModel: ExploreViewModel
    let index: Int
    init(viewModel: ExploreViewModel, index: Int) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.index = index
    }
    
    var body: some View {
        VStack {
            ReusableCarView(title: "Pickup & Return", subtitle: "San Francisco", imageName: "mappin.and.ellipse")
            Divider()
            ReusableCarView(title: "Cancellation policy", subtitle: "Free Cancellation", imageName: "hand.thumbsup", secondSubtitle: Date())
            Divider()
            ReusableCarView(title: "Distance included", subtitle: viewModel.cars[index].maxDistance == nil ? "Unlimited" : "\(String(describing: viewModel.cars[index].maxDistance))")
            Divider()
            ReusableCarView(title: "Insurance & Protection", subtitle: "Insurance via travelers",  readButton: true)
        }
    }
}
