import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()

            VStack {
                Spacer()

                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 393, height: 393)
                    .padding(.bottom, -76.15)

                Text("Swift Academy")
                    .font(.custom("AmericanTypewriter-Bold", size: 40))
                    .foregroundColor(Color(hex: "#38b6ff"))
                    .padding(.bottom, 66)

                Spacer()
                Spacer()
            }
        }
    }
}

#Preview {
    SplashView()
}
