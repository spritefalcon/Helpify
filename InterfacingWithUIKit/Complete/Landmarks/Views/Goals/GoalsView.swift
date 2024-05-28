import SwiftUI

struct GoalsView: View {
    var completionPercentage: Double
    var barWidth: CGFloat = 295
    var barHeight: CGFloat = 20
    var cornerRadius: CGFloat = 10

    var body: some View {
        NavigationSplitView {
            Text("Weekly Goal")
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .frame(width: barWidth, height: barHeight)
                        .opacity(0.3)
                        .foregroundColor(Color.gray)
                    
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .frame(width: min(CGFloat(self.completionPercentage) * barWidth, barWidth), height: barHeight)
                        .foregroundColor(Color.green)
                }
            }
            .frame(width: 300, height: 25)
            Text("50%")
                .font(.title2)
            Text("You have completed 5 hours of your goal!")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            Spacer()
                .frame(height: 100)
            
            Text("Monthly Goal")
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .frame(width: barWidth, height: barHeight)
                        .opacity(0.3)
                        .foregroundColor(Color.gray)

                    RoundedRectangle(cornerRadius: cornerRadius)
                        .frame(width: min(CGFloat(self.completionPercentage) * barWidth, barWidth), height: barHeight)
                        .foregroundColor(Color.green)
                }
            }
            .frame(width: 300, height: 25)
            Text("50%")
                .font(.title2)
            Text("You have completed 20 hours of your goal!")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
                .navigationTitle("Goals")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

struct ProgressBarView: View {
    @State private var completion: Double = 0.6

    var body: some View {
        VStack {
            Text("Progress: \(Int(completion * 100))%")
            GoalsView(completionPercentage: completion, barWidth: 200, barHeight: 20, cornerRadius: 10)
                .padding()
            Button("Increase Progress") {
                withAnimation {
                    completion += 0.1
                }
            }
        }
    }
}

