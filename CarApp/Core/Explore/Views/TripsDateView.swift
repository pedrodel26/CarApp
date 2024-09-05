//
//  TripsDateView.swift
//  CarApp
//
//  Created by Pedro Delmondes  on 02/09/2024.
//

import SwiftUI

struct TripDatesView: View {
    func formattedDate(addedDay: Int) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE d MMM"
        
        return dateFormatter.string(from: Calendar.current.date(byAdding: .day, value: addedDay, to: Date()) ?? Date())
    }
    @State private var datePickerPresented: Bool = false
    @State private var selectedDates: Set<DateComponents>
    @State private var hourPickup: CGFloat = 10
    @State private var hourReturn: CGFloat = 10
    private var pickupYear = Calendar.current.component(.year, from: Date())
    private var pickupMonth = Calendar.current.component(.month, from: Date())
    private var pickupDay = Calendar.current.component(.day, from: Date())
    private var returnDay = Calendar.current.component(.day, from: Calendar.current.date(byAdding: .day, value: 2, to: Date()) ?? Date())
    private var returnMonth = Calendar.current.component(.month, from: Calendar.current.date(byAdding: .day, value: 2, to: Date()) ?? Date())
    private var returnYear = Calendar.current.component(.year, from: Calendar.current.date(byAdding: .day, value: 2, to: Date()) ?? Date())
    init() {
        self.selectedDates = [.init(timeZone: .gmt, year: pickupYear, month: pickupMonth, day: pickupDay),
            .init(timeZone: .gmt, year: returnYear, month: returnMonth, day: returnDay)
        ]
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Trips Dates")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(Color(.darkGray))
        }
        .padding(.horizontal, 12)
        
        HStack(spacing: 4) {
            Image(systemName: "calendar.circle")
                .resizable()
                .frame(width: 35, height: 35)
            
            VStack {
                Text("\(formattedDate(addedDay: 0)), 10:00")
                Text("\(formattedDate(addedDay: 2)), 10:00")
            }
            Spacer()
            
            Button(action: {
                datePickerPresented.toggle()
            }, label: {
                Text("Change")
                    .font(.headline)
                    .fontWeight(.bold)
            })
            .padding(.bottom)
            .padding(.horizontal)
        }
        .padding()
        .popover(isPresented: $datePickerPresented, arrowEdge: .top) {
            ScrollView {
                VStack(spacing: 18) {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width:70, height: 5)
                        .foregroundStyle(Color(.systemGray2))
                        .padding(.vertical)
                    
                    HStack {
                        VStack {
                            Text(Date(), style: .date)
                                .bold()
                            Text("10:00")
                        }
                        .font(.footnote)
                        Spacer()
                        
                        Image(systemName: "arrowshape.right.fill")
                        Spacer()
                        
                        VStack {
                            Text(Calendar.current.date(byAdding: .day, value: 2, to: Date()) ?? Date(), style: .date)
                                .bold()
                            Text("10:00")
                        }
                        .font(.footnote)
                    }
                    .padding(.horizontal)
                    Divider()
                    
                    MultiDatePicker(selection: $selectedDates, in: Date()...) {
                        
                    }
                    .padding(.horizontal)
                    .frame(height: 320)
                    Divider()
                    
                    HStack {
                        Text("Start: 10")
                            .foregroundStyle(.gray)
                        Slider(value: $hourPickup, in: 0...24)
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text("End: 10")
                            .foregroundStyle(.gray)
                        Slider(value: $hourReturn, in: 0...24)
                    }
                    .padding(.horizontal)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Save")
                            .frame(width: UIScreen.main.bounds.width - 45, height: 45)
                            .foregroundStyle(.white)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    })
                }
            }
            .scrollIndicators(.automatic)
        }
    }
}
