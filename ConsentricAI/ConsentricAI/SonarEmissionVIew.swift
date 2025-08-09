import SwiftUI

struct SonarEmissionView: View {
    @State private var animate = false

    var color: Color = Color("MochaMousse") // Adaptive to light/dark
    var maxRadius: CGFloat = 200
    var duration: Double = 2.0
    var lineWidth: CGFloat = 3.0

    var body: some View {
        Circle()
            .stroke(color.opacity(animate ? 0 : 0.4), lineWidth: lineWidth)
            .frame(width: maxRadius, height: maxRadius)
            .scaleEffect(animate ? 1.2 : 0.4)
            .blur(radius: 0.8)
            .onAppear {
                withAnimation(
                    .linear(duration: duration).repeatForever(autoreverses: false)
                ) {
                    animate = true
                }
            }
    }
}
