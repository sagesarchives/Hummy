//
//  SwiftUIView.swift
//  Hummy
//
//  Created by Nyla Wilson on 12/19/25.
//

import SwiftUI

struct SplashScreen: View {
    @State var isActive = true
    
    var body: some View {
        ZStack {
            Color("hummyBlue")
                .ignoresSafeArea()
            if isActive {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .padding()
            } else {
                MainView()
            } // if-else ending statement
        } // zstack ending brace
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    isActive = false
                } // with animation ending brace
            } // dispatch queue ending brace
        } // on appear ending brace
    } // var body ending brace
} // struct ending brace

#Preview {
    SplashScreen()
}
