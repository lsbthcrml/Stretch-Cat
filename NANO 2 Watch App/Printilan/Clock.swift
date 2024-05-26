//
//  Clock.swift
//  NANO 2 Watch App
//
//  Created by Elisabeth Carmela on 18/05/24.
//

import SwiftUI

struct ClockView: View {
    @State private var currentTime = Date()
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        Text(currentTime, style: .time)
            .font(.body)
            .fontWeight(.semibold)
            .foregroundColor(Color("army"))
            .onReceive(timer) { input in
                currentTime = input
            }
    }
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
    }
}
