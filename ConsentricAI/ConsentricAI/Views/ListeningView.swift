// ListeningView.swift

import SwiftUI

struct ListeningView: View {
    @EnvironmentObject var appState: AppState
    @State private var hasTriggered = false

    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                Spacer()

                ZStack {
                    SonarEmissionView(
                        color: Color("MochaMousse"),
                        maxRadius: 180,
                        duration: 2.0,
                        lineWidth: 4
                    )

                    Image(systemName: "dot.radiowaves.left.and.right")
                        .font(.system(size: 48))
                        .foregroundColor(.primary)
                }

                Text("Listening...")
                    .font(.title2)
                    .foregroundColor(.primary)

                Spacer()
            }
            .padding()
        }
        .onAppear {
            // Auto-trigger the recording transition after 4 seconds
            guard !hasTriggered else { return }
            hasTriggered = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                withAnimation {
                    appState.currentScreen = .recording
                }
            }
        }
    }
}

struct ListeningView_Previews: PreviewProvider {
    static var previews: some View {
        ListeningView()
            .environmentObject(AppState())
    }
}
