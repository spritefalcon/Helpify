import SwiftUI

struct StatisticsView: View {
    var hike: Hike
    
    var body: some View {
        NavigationSplitView {
            HikeGraph(hike: hike, path: \.elevation)
                .frame(width: 300, height: 150)
            
                .navigationTitle("Statistics")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    StatisticsView(hike: ModelData().hikes[0])
        .environment(ModelData())
}
