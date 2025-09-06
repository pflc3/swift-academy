import SwiftUI

struct ChatBotView: View {
    @EnvironmentObject var session: SessionManager
    @EnvironmentObject var chatService: ChatService
    @EnvironmentObject var toasts: ToastCenter
    @StateObject private var vm = ChatViewModel()

    var body: some View {
        NavigationStack {
            ChatContentView(
                messages: $vm.messages,
                newMessage: $vm.newMessage,
                isLoading: $vm.isLoading,
                onSendMessage: vm.send
            )
            .ignoresSafeArea(.container, edges: .top)
            .onAppear {
                vm.configure(session: session, chatService: chatService, toasts: toasts)
            }
        }
    }
}

#Preview {
    let deps = PreviewDeps(user: MockData.users.first)
    return ChatBotView().previewEnv(deps)
}
