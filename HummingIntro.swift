//
//  HummingIntro.swift
//  Hummy
//
//  Created by Nyla Wilson on 1/6/26.
//

import SwiftUI

struct  HummingIntro: View {
    @State var humming: HummingCards
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("background")
                VStack {
                    Text("\(humming.hummingSession) SESSION")
                        .font(Font.custom("Times New Roman", size: 30))
                        .bold()
                        .padding(.top, 45)
                    
                    Text("How It Works:")
                        .font(Font.custom("Times New Roman", size: 26))
                        .padding(.bottom)
                    HStack {
                        Image(systemName: "sparkle")
                        Text("━━━━━━━━━━━━━━━━")
                        Image(systemName: "sparkle")
                    } // hstack ending brace
                    .bold()
                    .padding(.bottom, 30)
                    
                    VStack (spacing: 30) {
                        Text("""
                        Place your phone on your 
                        chest or any smooth surface
                        """)
                            .multilineTextAlignment(.center)
                            .font(Font.custom("Times New Roman", size: 23))
                            .bold()
                        Text("""
                        While your phone is buzzing, 
                        hum along!
                        """)
                            .multilineTextAlignment(.center)
                            .font(Font.custom("Times New Roman", size: 23))
                            .bold()
                        Text("""
                        When you need take a breath, tap 
                        the Hummy icon to pause everything, 
                        then tap it again to resume
                        """)
                            .multilineTextAlignment(.center)
                            .font(Font.custom("Times New Roman", size: 23))
                            .bold()
                        Text("""
                        During the session, focus your 
                        attention on the buzzing sensation 
                        you are feeling from your hums
                        """)
                            .multilineTextAlignment(.center)
                            .font(Font.custom("Times New Roman", size: 23))
                            .bold()
                    } // vstack ending brace
                        
                    NavigationLink (destination: HummingCountdown(countDown: humming.hummingSessionLength)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25).fill(Color.white)
                                .shadow(color: .black, radius: 3, x: 0, y: 2)
                                .frame(width: 300, height: 50)
                                .overlay (
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.black, lineWidth: 4)
                                ) // overlay ending parenthesis
                            Text("START SESSION")
                                .font(Font.custom("Times New Roman", size: 28))
                                .accentColor(Color.black)
                        } // zstack ending brace
                    } // nav link ending brace
                        .padding(.top, 40)
                    } // vstack ending brace
                } // zstack ending brace
            } // nav stack ending brace
    } // var body ending brace
} // struct ending brace

#Preview {
    HummingIntro(humming: HummingCards(hummingSession: "ONE MINUTE", caption: "for a quick reset", heartAsset: "redHeart"))
}
