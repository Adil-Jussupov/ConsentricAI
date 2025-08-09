import SwiftUI

struct AvailableView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack(spacing: 30) {
            Spacer()

            Image(systemName: "lock.open")
                .font(.system(size: 50))
                .foregroundColor(Color("MochaMousse"))

            Text("Now record is available for both of you")
                .font(.title3)
                .multilineTextAlignment(.center)
                .foregroundColor(.primary)
                .padding(.horizontal, 40)

            Button(action: {
                withAnimation {
                    appState.currentScreen = .servicesMenu
                }
            }) {
                Text("Choose an AI Service")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("MochaMousse"))
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding(.horizontal, 40)
            }

            Spacer()
        }
        .padding()
    }
}
