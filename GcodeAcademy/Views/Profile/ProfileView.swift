

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("Profile")
                .font(.title)
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .padding()
            
            Text("Gcode Student")
                .font(.headline)
            
            Text("Lessons Completed: 0")
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
