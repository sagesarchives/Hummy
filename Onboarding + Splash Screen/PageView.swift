//
//  PageView.swift
//  Hummy
//
//  Created by Nyla Wilson on 1/4/26.
//

import Foundation
import SwiftUI

struct PageView: View {
    @Binding var shouldShowOnboarding: Bool
    
    let title: String
    let caption: String
    let subcaption: String
    let showsDismissButton: Bool
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .scaledToFit( )
                .frame(width: 200, height: 200)
            Text(title)
                .font(Font.custom("Times New Roman", size: 30))
                .padding(.bottom)
                .multilineTextAlignment(.center)
            Text(caption)
                .font(Font.custom("Times New Roman", size: 22))
                .multilineTextAlignment(.center)
                .padding(.bottom)
            Text(subcaption)
                .font(Font.custom("Times New Roman", size: 22))
                .multilineTextAlignment(.center)
            if showsDismissButton {
                Button(action: {
                    shouldShowOnboarding.toggle( )
                    
            }, label: {
                    Text("Get Started")
                }) // button ending
                .buttonStyle(.bordered)
                    .tint(.green)
                    .foregroundColor(.black)
                .padding(.top)
            } // if statement ending brace
        } // vstack ending brace
        .padding(.bottom, 105)
    } // var body ending brace
} // struct ending brace
