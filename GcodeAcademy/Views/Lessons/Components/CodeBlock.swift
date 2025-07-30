import SwiftUI

struct CodeBlock: View {
    let code: String
    let language: String // For future syntax highlighting support
    
    var body: some View {
        // Horizontal scroll for code that doesn't fit on screen
        ScrollView(.horizontal, showsIndicators: false) {
            Text(code)
                .font(.system(size: 14, design: .monospaced))
                .padding(16)
                .background(Color.surfaceApp)
                .cornerRadius(8)
        }
    }
}
    
        

#Preview {
    CodeBlock(code: "// This is a code example\nlet name = \"Gcode\"", language: "swift")
        .padding()
}
