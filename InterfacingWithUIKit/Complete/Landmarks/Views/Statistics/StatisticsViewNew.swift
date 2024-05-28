//
//  StatisticsViewNew.swift
//  Landmarks
//
//  Created by Landers Lin on 10/31/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation
import SwiftUI
import Charts

struct Hours: Identifiable {
    var type: String
    var count: Double
    var id = UUID()
}

var data: [Hours] = [
    .init(type: "10/15", count: 5),
    .init(type: "10/16", count: 1),
    .init(type: "10/17", count: 2),
    .init(type: "10/18", count: 5),
    .init(type: "10/19", count: 0),
    .init(type: "10/20", count: 3),
    .init(type: "10/21", count: 1)
]

var data2: [Hours] = [
    .init(type: "June", count: 14),
    .init(type: "July", count: 10),
    .init(type: "August", count: 9),
    .init(type: "September", count: 10),
    .init(type: "October", count: 9)
]

struct SView: View {
    var body: some View {
        HStack {
            Spacer() // Spacer to push the chart to the center horizontally
            StatisticsViewNew() // Your chart view
            Spacer() // Spacer to push the chart to the center horizontally
        }
    }
}

struct StatisticsViewNew: View {
    var body: some View {
        NavigationSplitView {
            Spacer()
            Text("Weekly")
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            GeometryReader { geometry in
                Chart {
                    ForEach(data) { shape in
                        BarMark(
                            x: .value("Shape Type", shape.type),
                            y: .value("Total Count", shape.count)
                        )
                    }
                }
                    .frame(width: geometry.size.width, height: 200, alignment: .center) // Adjust the height as needed
            }
            Spacer()
            Text("Monthly")
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            GeometryReader { geometry in
                Chart {
                    ForEach(data2) { shape in
                        BarMark(
                            x: .value("Shape Type", shape.type),
                            y: .value("Total Count", shape.count)
                        )
                    }
                }
                    .frame(width: geometry.size.width, height: 200, alignment: .center) // Adjust the height as needed
            }
            
                .navigationTitle("Statistics")
        } detail: {
            Text("Select a Landmark")
        }
    }
}



