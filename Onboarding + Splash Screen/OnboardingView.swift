//
//  OnboardingView.swift
//  Hummy
//
//  Created by Nyla Wilson on 1/4/26.
//

import Foundation
import SwiftUI

struct OnboardingView: View {
    @Binding var shouldShowOnboarding: Bool
    @State var obActive = true
    
    var body: some View {
        ZStack {
            Color(.hummyBlue)
                .ignoresSafeArea()
            
            if obActive {
                TabView {
                    PageView (
                        shouldShowOnboarding: $shouldShowOnboarding,
                        title: "Welcome to Hummy",
                        caption: """
                        Experience the power of humming 
                        as you stimulate the vagus nerve 
                        to lower anxiety and release endorphins 
                        -- that's the feel good hormone
                        """,
                        subcaption: "",
                        showsDismissButton: false,
                    )
                    
                    PageView (
                        shouldShowOnboarding: $shouldShowOnboarding,
                        title: "Haptic Supported Experience",
                        caption: """
                        To enjoy Hummy to its full extent, 
                        ensure you have vibration haptics 
                        toggled on
                        """,
                        subcaption: """
                        Settings → Accessibility → Touch 
                        → Toggle Vibration On
                        """,
                        showsDismissButton: false,
                    )
                    
                    PageView (
                        shouldShowOnboarding: $shouldShowOnboarding,
                        title: "A Tool For Any Moment",
                        caption: """
                        Experience humming in either a one 
                        minute, two minute, or three minute 
                        session depending on your needs
                        """,
                        subcaption: "",
                        showsDismissButton: true,
                    )
                } // tab view ending brace
                .tabViewStyle(PageTabViewStyle())
            } else {
                    SplashScreen()
            } // if-else ending brace
        } // zstack ending brace
    } // var body ending brace
} // struct ending brace
