import SwiftUI

/// Sheet view for editing user profile information
struct EditProfileView: View {
    // Binding to the user model so changes are reflected in parent view
    @Binding var user: User
    
    // Environment value to dismiss the sheet
    @Environment(\.dismiss) private var dismiss
    
    //Local editable copies of name and bio
    @State private var name: String
    @State private var bio: String
    
    // Initialize state from current user model
    init(user: Binding<User>) {
        self._user = user
        self._name = State(initialValue: user.wrappedValue.name)
        self._bio = State(initialValue: user.wrappedValue.bio)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    //Name field
                    VStack(alignment: .leading, spacing:4) {
                        Text("Name")
                            .font(.caption)
                            .foregroundColor(.textSecondaryApp)
                        
                        TextField("Enter your name", text: $name)
                            .padding(.vertical, 8)
                    }
                    
                    //Big field - multiline
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Bio")
                            .font(.caption)
                            .foregroundColor(.textSecondaryApp)
                        
                        TextEditor(text: $bio)
                            .frame(minHeight: 100)
                            .padding(4)
                            .background(Color.surfaceApp)
                            .cornerRadius(8)
                    }
                } header: {
                    Text("Profile Information")
                }footer: {
                    Text("This information will be displayed on your profile")
                        .padding(.top, 8)
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
                        user.name = name
                        user.bio = bio
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    // We need to create a binding for the preview
    EditProfileView(user: .constant(MockData.currentUser))
}
