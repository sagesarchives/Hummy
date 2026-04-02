//
//  HummingSession.swift
//  Hummy
//
//  Created by Nyla Wilson on 1/7/26.
//

import SwiftUI
import Combine

struct HummingSession: View {
    // Haptic variables
    @StateObject private var continuousHaptic = HapticsManager()
    
    // Timer variables
    @State var countDown: Int
    @State var isRunning = true
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    // Booleans
    @State var isComplete: Bool = false
    @State private var shouldExit = false

    var body: some View {
        NavigationStack {
            ZStack {
                Image("background")
                VStack {
                    Button(action: {
                        continuousHaptic.stop()
                        isRunning = false
                        shouldExit = true
                    }) { Text("EXIT")
                            .foregroundColor(Color("darkred"))
                            .font(Font.custom("Times New Roman", size: 25))
                            .bold()
                    }
                    .position(CGPoint(x: 120, y: 290))
        
                    VStack {
                        Button(action: {
                            isRunning.toggle()
                        }) {
                            ZStack {
                                Image(isRunning ? "whiteLogo" : "whiteLogo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                            } // zstack ending brace
                        } // button ending brace
                        
                        HStack {
                            Text("HUM")
                                .font(Font.custom("Times New Roman", size: 35))
                                .bold()
                            Text("(\(countDown))")
                                .font(Font.custom("Times New Roman", size: 35))
                                .bold()
                                .onReceive(timer) { _ in
                                    if isRunning && countDown > 1 {
                                        countDown -= 1
                                    } else if countDown == 1 {
                                        isRunning = false
                                        continuousHaptic.stop()
                                        isComplete = true
                                    }// if else statement ending brace
                                } // on receive ending brace
                        } // hstack ending brace
                    } // vstack ending brace
                    .position(CGPoint(x: 265, y: 10))
                } // vstack ending brace
            } // zstack ending brace
            .navigationDestination(isPresented: $isComplete) {
                ReflectionView()
            } // nav destination ending brace
            
            .navigationDestination(isPresented: $shouldExit) {
                MainView()
            } // nav destinaiton ending brace
        } // nav stack ending brace
        .onAppear {
            continuousHaptic.start()
        } // on appear ending brace
        
        .onChange(of: isRunning) { checker in
            if checker {
                continuousHaptic.start()
            } else {
                continuousHaptic.stop()
            } // if else ending brace
        } // on change ending brace
        
        .onDisappear {
            continuousHaptic.stop()
        } // on disappear ending brace
    } // var body ending brace
    
    func toggleHaptic() {
        if isRunning == false {
            continuousHaptic.stop()
        } else {
            continuousHaptic.start()
        } // if else statement ending brace
    } // func ending brace
} // struct ending brace

#Preview {
    HummingSession(countDown: 60)
}
