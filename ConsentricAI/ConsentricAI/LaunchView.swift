//
//  LaunchView.swift
//  ConsentricAI
//
//  Created by Adil on 8/6/25.
//

import Foundation

import SwiftUI

struct LaunchView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                appState.currentScreen = .listening
            }) {
                Text("Start Listening")
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("MochaMousse"))
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding(.horizontal, 40)
            }
            Spacer()
        }
        .background(Color(.systemBackground))
    }
}
