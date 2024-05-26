//
//  PageDuaView.swift
//  NANO 2 Watch App
//
//  Created by Elisabeth Carmela on 18/05/24.
//

import SwiftUI

struct PageDuaView: View {
    var body: some View {
        ZStack {
            Image("pageDua")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            ZStack(alignment: .top) {
                ClockView()
                    .padding(.top, -120)
            }
            
        
        }

    }
}

#Preview {
    PageDuaView()
}
