//
//  Background.swift
//  Test
//
//  Created by Joshua Fineboy-Mark on 7/27/25.
//
import SwiftUI
let Modernimages = [
    "swift",        // Swift logo
    "github",       // developer relevance
    "ai",           // modern tech
    "app-store",    // mobile app learning
]

/// A dynamic background composed of themed images for each level
struct Background: View {
    var length: Int
    var images: [String]

    var body: some View {
        ZStack {
            // Background base color
            Color.white.ignoresSafeArea()

            // Vertical stack of decorative images
            VStack(alignment: .leading, spacing: 0) {
                ForEach(0...length, id: \.self) { i in
                    BgImage(
                        image: images.randomElement() ?? "swift",
                        offsetX: i.isMultiple(of: 2) ? 128 : -120
                    )
                }
                Spacer()
            }
        }
    }
}

/// Individual background image element
import SwiftUI

/// Single animated background image with themed sizing and opacity
struct BgImage: View {
    var image: String
    var size: CGFloat = 140
    var offsetX: CGFloat

    @State private var floatOffset: CGFloat = 0

    var body: some View {
        Image(image)
            .resizable()
            .opacity(opacityForImage(image))
            .aspectRatio(contentMode: .fit)
            .frame(width: sizeForImage(image), height: sizeForImage(image))
            .padding(10)
            .offset(x: offsetX, y: floatOffset)
            .onAppear {
                withAnimation(
                    .easeInOut(duration: Double.random(in: 3.0...4.5))
                        .repeatForever(autoreverses: true)
                ) {
                    floatOffset = CGFloat.random(in: -6...6)
                }
            }
    }

    /// Custom image size logic
    private func sizeForImage(_ name: String) -> CGFloat {
        if ["sun", "swift", "github", "ai", "app-store"].contains(name) {
            return size - 40
        }
        return size
    }

    /// Opacity per image category
    private func opacityForImage(_ name: String) -> Double {
        return name == "surfing" ? 0.8 : 0.7
    }
}
#Preview {
    Background(length: 6, images: Modernimages)
}

