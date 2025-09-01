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
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false // Toggle to show/hide password
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    // Name field
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Name")
                            .font(.caption)
                            .foregroundColor(.textSecondaryApp)
                        
                        TextField("Enter your name", text: $name)
                            .padding(.vertical, 6)
                    }
                    
                    // Bio field - multiline
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
                
                Section {
                    // Email field
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Email")
                            .font(.caption)
                            .foregroundColor(.textSecondaryApp)
                        
                        TextField("Enter your email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .padding(.vertical, 6)
                    }
                    
                    // Password field with toggle to show/hide
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Password")
                            .font(.caption)
                            .foregroundColor(.textSecondaryApp)
                        
                        ZStack(alignment: .trailing) {
                            if showPassword {
                                TextField("Enter your password", text: $password)
                                    .padding(.vertical, 6)
                                    .padding(.trailing, 30) // Make room for the button
                            } else {
                                SecureField("Enter your password", text: $password)
                                    .padding(.vertical, 6)
                                    .padding(.trailing, 30) // Make room for the button
                            }
                            
                            Button(action: {
                                showPassword.toggle()
                            }) {
                                Image(systemName: showPassword ? "eye.slash" : "eye")
                                    .foregroundColor(.primaryApp)
                            }
                            // Prevent the button from capturing the whole area
                            .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                } header: {
                    Text("Account Information")
                }
                .padding(.vertical, 8)
                
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
                        user.email = email
                        user.password = password
                        dismiss()
                    }
                }
            }
            .onAppear {
                // Initialize state values when view appears
                name = user.name
                bio = user.bio
                email = user.email
                password = user.password
            }
        }
    }
}

#Preview {
    EditProfileView()
        .environmentObject(MockData.users[0])
        .environmentObject(UserManager())
}
