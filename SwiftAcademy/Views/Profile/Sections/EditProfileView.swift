// EditProfileView.
// Form-based editor for updating the user's name and bio, and performing logout.

import SwiftUI

struct EditProfileView: View {
    @ObservedObject var vm: ProfileViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Name")
                            .font(.caption)
                            .foregroundColor(.textSecondaryApp)
                        TextField("Enter your name", text: $vm.name)
                            .padding(.vertical, 6)
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        Text("Bio")
                            .font(.caption)
                            .foregroundColor(.textSecondaryApp)
                        TextEditor(text: $vm.bio)
                            .frame(minHeight: 100)
                            .padding(.vertical, 6)
                    }
                } header: {
                    Text("Profile Information")
                }
                .padding(.vertical, 8)

                Section {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Email")
                            .font(.caption)
                            .foregroundColor(.textSecondaryApp)
                        Text(vm.email)
                            .padding(.vertical, 6)
                    }
                } header: {
                    Text("Account Information")
                }
                .padding(.vertical, 8)

                Section {
                    Button {
                        vm.logout()
                        dismiss()
                    } label: {
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
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        Task {
                            await vm.save()
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    let deps = PreviewDeps(user: MockData.users.first)
    return EditProfileView(
        vm: ProfileViewModel(
            session: deps.session,
            userService: deps.userService,
            toasts: deps.toasts
        )
    ).previewEnv(deps)
}
