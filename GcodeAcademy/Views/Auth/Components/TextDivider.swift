import SwiftUI

struct TextDivider: View {
    // Text to displsy in the center of the divider
    let text: String
    
    var body: some View {
        HStack {
            // Left divider line
            VStack {
                Divider()
                    .background(Color.white)
            }
            .padding(.trailing)
            
            // Center text
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
            
            // Right divider line
            VStack {
                Divider()
                    .background(Color.white)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    ZStack {
        Color.primaryApp
        
        VStack {
            TextDivider(text: "OR")
            
            TextDivider(text: "CONTINUE WITH")
        }
        .padding()
    }
}
