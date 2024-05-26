//
//  ContentView.swift
//  NANO 2 Watch App
//
//  Created by Elisabeth Carmela on 17/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.cream
                .edgesIgnoringSafeArea(.all)
            VStack {
                ClockView()
                    .padding(.top, -40)
                Text("Stretch")
                    .foregroundColor(Color("army"))
                    .font(.system(size: 17))
                    .padding(.top, -25)
                
                Image("kucingAwal")
                    .resizable()
                    .frame(width: 150, height: 140)
                    .aspectRatio(contentMode: .fit)
                
            }
            .scenePadding()
        }
    }
}

#Preview {
    ContentView()
}

