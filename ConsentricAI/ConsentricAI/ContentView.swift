//
//  ContentView.swift
//  ConsentricAI
//
//  Created by Adil on 8/6/25.
//

import SwiftUI

//struct ContentView: View {
//    @StateObject private var appState = AppState()
//    
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}

struct ContentView: View {
    @StateObject private var appState = AppState()

    var body: some View {
        NavigationStack {
            VStack {
                switch appState.currentScreen {
                case .launch:
                    LaunchView()
                        .environmentObject(appState)
                case .listening:
                    ListeningView()
                        .environmentObject(appState)
                default:
                    Text("Screen not implemented yet")
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ContentView()
}
