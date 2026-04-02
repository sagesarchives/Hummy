//
//  MainView.swift
//  Hummy
//
//  Created by Nyla Wilson on 1/4/26.
//

import SwiftUI

struct MainView: View {
    @State private var isShowingPopover = false

    var humming: [HummingCards] = [
        HummingCards(hummingSession: "ONE MINUTE", caption: "for a quick reset", heartAsset: "redHeart", hummingSessionLength: 60),
        HummingCards(hummingSession: "TWO MINUTE", caption: """
            for rest & relaxtion
            """, heartAsset: "greenHeart", hummingSessionLength: 120),
        HummingCards(hummingSession: "THREE MINUTE", caption: """
            for stress relief
            """, heartAsset: "purpleHeart", hummingSessionLength: 180),
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("background")
                
                VStack {
                    HStack (spacing: 190) {
                        Text("hello there!")
                            .font(Font.custom("Times New Roman", size: 30))
                        Button {
                            isShowingPopover = true
                        } label: {
                            Image(systemName: "info.circle")
                                .font(.system(size: 25))
                                .foregroundColor(.black)
                        } // label ending brace
                        .sheet(isPresented: $isShowingPopover) {
                            InfoSheet()
                        } // sheet ending brace
                    } // top bar hstack ending brace
                    .position(x: 265, y: 270)
                    
                    VStack (spacing: 45) {
                        Text("LET'S GET HUMMY")
                            .font(Font.custom("Times New Roman", size: 25))
                            .bold()
                            .padding(.top, 100)
                        HStack {
                            Image(systemName: "sparkle")
                            Text("━━━━━━━━━━━━━━━━━")
                            Image(systemName: "sparkle")
                        } // hstack ending brace
                    } // divider hstack ending brace
                    .position(x: 265, y: 35)

                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(humming, id: \.self) { HummingCards in
                                NavigationLink {
                                    HummingIntro(humming: HummingCards)
                                } label: {
                                    CardView(humCard: HummingCards)
                                } // label ending brace
                            } // for each ending brace
                        } // hstack ending brace
                    } // scroll view ending brace
                    .padding(.leading, 60)
                    .padding(.trailing, 60)
                    .position(x: 265, y: -100)
                } // vstack ending brace
            } // zstack ending brace
        } // navstack ending brace
            .navigationBarBackButtonHidden(true)
    } // var body ending brace
} // struct ending brace

struct InfoSheet: View {
    var body: some View {
        ZStack {
            Image("background")
            Text("WHY HUMMING?")
                .font(Font.custom("Times New Roman", size: 25))
                .bold()
                .position(x: 265, y: 320)
            HStack {
                Image(systemName: "sparkle")
                Text("━━━━━━━━━━━━━━━━━")
                Image(systemName: "sparkle")
            } // hstack ending brace
            .position(x: 265, y: 390)
            Text("""
             Humming stimulates the vagus nerve, 
             a nerve part of the parasympathetic
             nervous system that controls our 
             fight-or-flight responses.
             """)
            .multilineTextAlignment(.center)
            .font(Font.custom("Times New Roman", size: 22))
            .position(x: 265, y: 490)
            Text("""
            Because it's a physically stimulating 
            task, humming is a grounding activity. 
            It provides significant benefits to those 
            who struggle with anxiety and want to 
            reconnect with their bodies and 
            the present moment.
            """)
            .multilineTextAlignment(.center)
            .font(Font.custom("Times New Roman", size: 21))
            .position(x: 265, y: 630)
            Image("whiteLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .position(x: 265, y: 780)
            Text("""
            “Does Humming Help Anxiety? Simple Tips to Cope.” 
            AMFM Mental Health Treatment, 17 Feb. 2026,
            amfmtreatmen.com/what-we-treat/anxiety/
            does-humming-help-anxiety/
            """)
            .multilineTextAlignment(.center)
            .font(Font.custom("Times New Roman", size: 15))
            .foregroundColor(.gray)
            .position(x: 265, y: 900)
        } // zstack ending brace
    } // var body ending brace
} // struct ending brace

#Preview {
    MainView()
}
