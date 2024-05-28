/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view that summarizes a profile.
*/

import SwiftUI

struct ProfileSummary: View {
    @Environment(ModelData.self) var modelData
    var profile: Profile

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(Image(systemName: "person.crop.circle"))
                    .font(.system(size: 75))
                    + Text("  ") + Text(profile.username)
                    .bold()
                    .font(.title)
                Text("@helloworld")
                    .font(.footnote)
                Text("Joined September 2023")
                    .font(.headline)
                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)

                Divider()

            }
            .padding()
        }
    }
}

#Preview {
    ProfileSummary(profile: Profile.default)
        .environment(ModelData())
}
