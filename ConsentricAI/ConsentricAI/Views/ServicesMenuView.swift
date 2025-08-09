// ServicesMenuView.swift

import SwiftUI

struct ServicesMenuView: View {
    @EnvironmentObject var appState: AppState

    private let services: [(title: String, icon: String)] = [
        ("Summarize",           "text.bubble"),
        ("Diarize",             "waveform"),
        ("Create To-do List",   "checkmark.circle"),
        ("Extract Actions",     "list.bullet.clipboard"),
        ("Draft Follow-up",     "envelope"),
        ("Highlight Decisions", "highlighter"),
        ("Meeting Minutes",     "doc.plaintext"),
        ("Tag Participants",    "person.3"),
        ("To Calendar Event",   "calendar.badge.plus"),
        ("Sentiment Analysis",  "smiley"),
        ("Keyword Extraction",  "tag"),
        ("Topic Modeling",      "brain.head.profile"),
        ("Export Transcript",   "square.and.arrow.up"),
        ("Agenda Generator",    "text.book.closed"),
        ("Reminder Setup",      "bell"),
        ("Translate",           "globe"),
        ("Email Draft",         "paperplane")
    ]

    var body: some View {
        VStack(spacing: 0) {
            Text("Would you like:")
                .font(.title2)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.top)

            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(services, id: \.title) { service in
                        Button(action: {
                                switch service.title {
                                case "Summarize":
                                    appState.currentScreen = .summarization
                                case "Create To-do List":
                                    appState.currentScreen = .todoList     // ← new
                                default:
                                    appState.currentScreen = .summarization
                                }
                        }) {
                            HStack(spacing: 12) {
                                Image(systemName: service.icon)
                                    .font(.title2)
                                    .foregroundColor(Color("MochaMousse"))
                                Text(service.title)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                Spacer()
                            }
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(12)
                            .shadow(color: Color.primary.opacity(0.1), radius: 1, x: 0, y: 1)
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical)
            }
        }
        .background(Color(.systemBackground).ignoresSafeArea())
    }
}

struct ServicesMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ServicesMenuView()
            .environmentObject(AppState())
    }
}
