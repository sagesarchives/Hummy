//
//  HummingCountdown.swift
//  Hummy
//
//  Created by Nyla Wilson on 1/9/26.
//

import SwiftUI
import Combine

struct HummingCountdown: View {
    @State private var timeRemaining = 5
    @State var countDown: Int
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image ("background")
                    Text("\(timeRemaining)")
                        .font(Font.custom("Times New Roman", size: 70))
                        .bold()
                        .shadow(radius: 1)
                        .onReceive(timer) { _ in
                            if timeRemaining > 1 {
                                timeRemaining -= 1
                            } // if statement ending brace
                        } // on receive ending brace
                
                if timeRemaining == 1 {
                    HummingSession(countDown: countDown)
                } // if statement ending brace
            } // zstack ending
        } // nav stack ending brace
        .navigationBarBackButtonHidden(true)
    } // var body ending brace
} // struct ending brace

#Preview {
    HummingCountdown(countDown: 60)
}
