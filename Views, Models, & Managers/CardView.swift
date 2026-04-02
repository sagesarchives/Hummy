//
//  SwiftUIView.swift
//  Hummy
//
//  Created by Nyla Wilson on 2/6/26.
//

import SwiftUI

struct CardView: View {
    var humCard: HummingCards
    
    var body: some View {
        ZStack {
            VStack (spacing: 10) {
                Text(humCard.hummingSession)
                    .font(.custom("Times New Roman", size: 20))
                    .bold()
                    .foregroundStyle(.black)
                Text(humCard.caption)
                    .font(.custom("Times New Roman", size: 18))
                    .foregroundStyle(.black)
                    .padding(.bottom, 25)
                Image(humCard.heartAsset)
                    .rotationEffect(.degrees(-15))
                    .padding(.leading, 125)
            } // vstack ending brace
            .padding(.top, 35)

            .background {
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(.white)
                    .frame(width: 180, height: 200)
            } // background ending brace
            .scaledToFit()
            .padding()
            
            .background {
                RoundedRectangle(cornerRadius: 25)
                    .stroke(.black, lineWidth: 4)
                    .frame(width: 180, height: 200)
                    .shadow(radius: 1)
            } // background ending brace
            .scaledToFit()
            .padding()
        } // zstack ending brace
    } // var body ending brace
} // struct ending brace

#Preview {
    let oneMinute = HummingCards(hummingSession: "ONE MINUTE", caption: "for a quick reset", heartAsset: "redHeart")
    let twoMinutes = HummingCards(hummingSession: "TWO MINUTE", caption: """
        for rest & rexalation
        """, heartAsset: "greenHeart")
    let threeMinutes = HummingCards(hummingSession: "THREE MINUTE", caption: """
        for stress relief
        """, heartAsset: "purpleHeart")
    CardView(humCard: oneMinute)
}
