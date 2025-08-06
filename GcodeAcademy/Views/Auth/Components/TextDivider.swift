import SwiftUI

struct TextDivider: View {
    let text: String
    
    var body: some View {
        Text("TextDivider: \(text)")
            .padding()
    }
}

#Preview {
    TextDivider(text: "OR")
}
