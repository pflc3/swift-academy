import SwiftUI
struct EditProfileView: View {
    @EnvironmentObject var user: User
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var bio: String = ""

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Name")
                            .font(.caption)
                            .foregroundColor(.textSecondaryApp)
                        
                        TextField("Enter your name", text: $name)
                            .padding(.vertical, 6)
                    }

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
            .onAppear {
                name = user.name
                bio = user.bio
            }
        }
    }
}

#Preview {
    EditProfileView()
        .environmentObject(User(name: "Preview User"))
}
