//
//  AnimatedCircleView.swift
//  NANO 2 Watch App
//
//  Created by Elisabeth Carmela on 18/05/24.
//

import SwiftUI

struct AnimatedCircleView: View {
    @State private var scale: CGFloat = 0.1
    @State private var isAnimating = false

    var body: some View {
        Circle()
            .frame(width: 150, height: 150)
            .scaleEffect(scale)
            .foregroundColor(Color("brick"))
            .onAppear {
                animateCircle()
            }
    }
    
    func animateCircle() {
        withAnimation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
            scale = 1.0
        }
        

            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
                    scale = 1.0
                }
            }
    }
}

#Preview {
    AnimatedCircleView()
}

