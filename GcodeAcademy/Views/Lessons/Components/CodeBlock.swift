import SwiftUI

struct CodeBlock: View {
    let code: String
    let language: String
    
    var body: some View {
        Text("Code Block Component")
            .padding()
            .background(Color.gray.opacity(0.2))
    }
}

#Preview {
    CodeBlock(code: "example", language: "swift")
}
