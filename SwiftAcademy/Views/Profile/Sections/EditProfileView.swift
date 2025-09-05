import SwiftUI

struct EditProfileView: View {
    // Access user from environment
    @EnvironmentObject var user: User
    @EnvironmentObject var userManager: UserManager
    
    // Environment value to dismiss the sheet
    @Environment(\.dismiss) private var dismiss
    
    // Local editable copies of user fields
    @State private var name: String = ""
    @State private var bio: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                // Profile info section
                Section {
                    // Name
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Name")
                            .font(.caption)
                            .foregroundColor(.textSecondaryApp)
                        TextField("Enter your name", text: $name)
                            .padding(.vertical, 6)
                    }
                    
                    // Bio
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Bio")
                            .font(.caption)
                            .foregroundColor(.textSecondaryApp)
                        TextEditor(text: $bio)
                            .frame(minHeight: 100)
                            .padding(.vertical, 6)
                    }
                } header: {
                    Text("Profile Information")
                }
                .padding(.vertical, 8)
                
                // Account info section
                Section {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Email")
                            .font(.caption)
                            .foregroundColor(.textSecondaryApp)
                        
                        Text(user.email) // Just display
                            .padding(.vertical, 6)
                    }
                } header: {
                    Text("Account Information")
                }
                .padding(.vertical, 8)
                
                // Logout button
                Section {
                    Button(action: {
                        // Logout the user
                        userManager.logout()
                        dismiss()
                    }) {
                        HStack {
                            Spacer()
                            Text("Log Out")
                                .foregroundColor(.red)
                                .bold()
                            Spacer()
                        }
                    }
                }
                .padding(.vertical, 8)
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        // Save all fields to user
                        user.name = name
                        user.bio = bio
                        dismiss()
                    }
                }
            }
            .onAppear {
                // Initialize state values when view appears
                name = user.name
                bio = user.bio
            }
        }
    }
}

#Preview {
    EditProfileView()
        .environmentObject(MockData.users[0])
        .environmentObject(UserManager())
}
