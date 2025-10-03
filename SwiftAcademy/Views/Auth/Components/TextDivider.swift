// TextDivider component.
// Lightweight divider with centered text used on Auth screens to separate alternative actions.
// Pure view component, used for visual grouping only.

import SwiftUI

struct TextDivider: View {
    // Text to display in the center of the divider
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
