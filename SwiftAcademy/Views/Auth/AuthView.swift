// AuthView.
// Entry point for authentication flows (welcome, sign-in, sign-up).
// Composes auth sections and wires the `AuthViewModel` into the environment at runtime.

import SwiftUI

struct AuthView: View {
    @EnvironmentObject var session: SessionManager
    @EnvironmentObject var userService: UserService
    @EnvironmentObject var toasts: ToastCenter

    @StateObject private var vm = AuthViewModel()

    var body: some View {
        ZStack {
            WaveBackground()
            VStack {
                HStack(alignment: .center, spacing: 16) {
                    Image("BeaverLight")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Swift")
                            .font(.system(size: 28, weight: .semibold))
                            .foregroundColor(.white)
                        Text("Academy")
                            .font(.system(size: 28, weight: .semibold))
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 60)

                Spacer()

                switch vm.currentView {
                case .welcome:
                    WelcomeSection(
                        showLogin: { withAnimation { vm.currentView = .signin } },
                        showSignup: { withAnimation { vm.currentView = .create } },
                        tryDemo: { vm.demoLogin() }
                    )
                case .signin:
                    SignInSection(
                        email: $vm.email,
                        password: $vm.password,
                        errorMessage: vm.errorMessage,
                        isLoading: vm.isLoading,
                        login: { vm.login() },
                        showSignup: { withAnimation { vm.currentView = .create } }
                    )
                case .create:
                    CreateAcntSection(
                        name: $vm.name,
                        email: $vm.email,
                        password: $vm.password,
                        confirmPassword: $vm.confirmPassword,
                        errorMessage: vm.errorMessage,
                        isLoading: vm.isLoading,
                        signup: { vm.signup() },
                        showLogin: { withAnimation { vm.currentView = .signin } }
                    )
                }

                Spacer()
            }
            .padding(.horizontal)
        }
        .animation(.easeInOut, value: vm.currentView)
        .onAppear {
            vm.configure(session: session, userService: userService, toasts: toasts)
        }
    }
}

#Preview {
    let deps = PreviewDeps()
    return AuthView().previewEnv(deps)
}
