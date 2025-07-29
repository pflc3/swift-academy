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
/* helper function to create consistent stat cards
 * This function takes parameters to customize each card:
 -value: the numerical value to display ('2" or "28%")
 -label: The description of the value ("Lessons" of Complete")
 -icon: SF Symbol name to use as the icon
 -color: The theme color to use for the icon and background
 */
private func statCard(value: String, label: String, icon: String, color: Color) -> some View {
    HStack {
        // Left Icon
        Image(systemName: icon)
            .font(.system(size: 22))
            .foregroundColor(color)
            .frame(width: 32, height: 32)
        
        // Value and Label
        VStack(alignment: .leading, spacing: 2) {
            Text(value)
                .font(.titleMedium)
                .foregroundColor(.textPrimaryApp)
            
            Text(label)
                .font(.caption)
                .foregroundColor(.textSecondaryApp)
        }
        
        Spacer()
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
        RoundedRectangle(cornerRadius: 12)
            .fill(color.opacity(0.1))
    )
}
        

#Preview {
    ProfileStatsView(user: MockData.currentUser)
}
