// SummarizationView.swift

import SwiftUI

struct SummarizationView: View {
    @EnvironmentObject var appState: AppState
    @State private var showSummary = false

    private let transcriptLines = [
        "Bryan: Thanks everyone for joining today’s sync.",
        "Adil: We saw a 12% uptick in Q2 revenue vs last quarter.",
        "Bryan: Let’s adjust the timeline for feature X to August.",
        "Adil: Noted—action items on marketing deck and demo."
    ]

    private let summaryPoints = [
        "• Q2 revenue grew by 12%",
        "• Agreed feature X launch in August",
        "• Action items: finalize marketing deck, schedule demo"
    ]

    var body: some View {
        VStack(spacing: 20) {
            // Header
            Text("Conversation Summary")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .center)

            // Transcript ↔ Summary container
            ZStack {
                // Transcript view
                if !showSummary {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 12) {
                            ForEach(transcriptLines, id: \.self) { line in
                                Text(line)
                                    .foregroundColor(.secondary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        .padding()
                    }
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .transition(.opacity.combined(with: .move(edge: .top)))
                }

                // Summary view
                if showSummary {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 12) {
                            ForEach(summaryPoints, id: \.self) { point in
                                Text(point)
                                    .foregroundColor(.primary)
                            }
                        }
                        .padding()
                    }
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .transition(.opacity.combined(with: .move(edge: .bottom)))
                }
            }
            .animation(.easeInOut(duration: 0.6), value: showSummary)

            // Summarize button
            Button(action: {
                withAnimation {
                    showSummary = true
                }
            }) {
                Text("Summarize")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("MochaMousse"))
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal)

            // Action buttons
            HStack(spacing: 12) {
                Button("Back") {
                    appState.currentScreen = .servicesMenu
                }
                .buttonStyle(.bordered)

                Button("Save") {
                    print("Saved!")
                }
                .buttonStyle(.borderedProminent)

                Button(action: {
                    print("Shared!")
                }) {
                    Image(systemName: "square.and.arrow.up")
                }
                .buttonStyle(.bordered)

                Button("Start Over") {
                    appState.currentScreen = .launch
                }
                .buttonStyle(.bordered)
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding(.top)
        .background(Color(.systemBackground).ignoresSafeArea())
    }
}

struct SummarizationView_Previews: PreviewProvider {
    static var previews: some View {
        SummarizationView()
            .environmentObject(AppState())
    }
}
