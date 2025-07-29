import SwiftUI

struct ProfileStatsView: View {
    // the user model containing progress information
    let user: User
    
    var body: some View {
        VStack(spacing: 0) {
            //Title
            Text("Progress")
                .font(.titleSmall)
                .foregroundColor(.textPrimaryApp)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16)
                .padding(.top, 16)
                .padding(.bottom, 8)
            
            //Placeholder for stats cards to be implemented in next issue
            Text("Stats cards will go here")
                .padding(.vertical, 30)
                .frame(maxWidth: .infinity)
            
            //Placeholder for progress bar to be implemented in future issue
            Text("Progress bar will go here")
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
        }
        .background(Color.cardBackgroundApp)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity (0.03), radius: 3, x: 0, y: 1)
        .padding(.horizontal, 16)
        }
    }


#Preview {
    ProfileStatsView(user: MockData.currentUser)
}
