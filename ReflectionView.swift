//
//  ReflectionView.swift
//  Hummy
//
//  Created by Nyla Wilson on 2/22/26.
//

import SwiftUI

struct ReflectionView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("background")
                
                VStack (spacing: 40) {
                    Text("Great job showing up for yourself today")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("Times New Roman", size: 20))
                        .bold()
                    Image(systemName: "heart")
                        .font(.system(size: 23))
                    Text("""
                    Come back for another session 
                    whenever you feel overwhelmed with 
                    the world around you
                    """)
                        .multilineTextAlignment(.center)
                        .font(Font.custom("Times New Roman", size: 20))
                        .bold()
                    
                    NavigationLink (destination: MainView())  {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25).fill(Color.white)
                                .shadow(color: .black, radius: 3, x: 0, y: 2)
                                .frame(width: 300, height: 50)
                                .overlay (
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.black, lineWidth: 4)
                                ) // overlay ending parenthesis
                            Text("RETURN HOME")
                                .font(Font.custom("Times New Roman", size: 28))
                                .accentColor(Color.black)
                        } // zstack ending brace
                    } // button label ending brace
                } // vstack ending brace
                .padding(.top, 40)
            } // zstack ending brace
        } // navstack ending brace
        .navigationBarBackButtonHidden()
    } // var body ending brace
} // struct ending brace

#Preview {
    ReflectionView()
}
