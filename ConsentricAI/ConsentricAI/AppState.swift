//
//  AppState.swift
//  ConsentricAI
//
//  Created by Adil on 8/6/25.
//

import Foundation
import SwiftUI

class AppState: ObservableObject {
    enum Screen {
        case launch
        case listening
        case recording
        case consentPrompt
        case waitingConsent
        case available
        case servicesMenu
        case summarization
    }

    @Published var currentScreen: Screen = .launch
}
