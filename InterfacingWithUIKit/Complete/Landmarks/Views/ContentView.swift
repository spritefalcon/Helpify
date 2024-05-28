/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view showing featured landmarks above a list of all of the landmarks.
*/

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured

    enum Tab {
        case statistics
        case featured
        case list
        case goals
    }

    var body: some View {
        TabView(selection: $selection) {
            SView()
                .tabItem {
                    Label("Statistics", systemImage: "chart.bar.fill")
                }
                .tag(Tab.statistics)
            
            CategoryHome()
                .tabItem {
                    Label("Volunteer", systemImage: "star")
                }
                .tag(Tab.featured)

            LandmarkList()
                .tabItem {
                    Label("Directory", systemImage: "list.bullet")
                }
                .tag(Tab.list)
            
            GoalsView(completionPercentage: 0.5)
                .tabItem {
                    Label("Goals", systemImage: "target")
                }
                .tag(Tab.goals)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
