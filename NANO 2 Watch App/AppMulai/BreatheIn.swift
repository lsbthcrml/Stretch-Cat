//
//  BreatheIn.swift
//  NANO 2 Watch App
//
//  Created by Elisabeth Carmela on 18/05/24.
//

//import SwiftUI
//
//struct BreatheIn: View {
//    @State private var breatheText = "Breathe In"
//    var body: some View {
//        ZStack {
//            Color.cream
//                .edgesIgnoringSafeArea(.all)
//            
//            VStack {
//                Text("Breathe In")
//                    .fontWeight(.semibold)
//                    .foregroundColor(Color("army"))
//                    .font(.system(size: 17))
//                    .padding(.top, 0)
//                
//                AnimatedCircleView()
//                
//                Spacer() // Add Spacer to push the button to the bottom
//                
//                HStack {
//                    Spacer()
//                    Button(action: {
//                        print("Button tapped")
//                    }) {
//                        Image("play.button")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 40, height: 40)
//                    }
//                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0)) // Adjust padding as needed
//                }
//            }
//            .padding()
//        }
//        .onAppear {
//            Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
//                self.breatheText = (self.breatheText == "Breathe In") ? "Breathe Out" : "Breathe In"
//            }
//            
//        }
//    }
//    
//    struct ContentView_Previews: PreviewProvider {
//        static var previews: some View {
//            BreatheIn()
//        }
//    }
//}

import SwiftUI

struct BreatheIn: View {
    @State private var breatheText = "Breathe In"
       @State private var isButtonPressed = false
       
       var body: some View {
           ZStack {
               Color.cream
                   .edgesIgnoringSafeArea(.all)
               
               VStack {
                   if !isButtonPressed {
                       Text(breatheText)
                           .fontWeight(.semibold)
                           .foregroundColor(Color("army"))
                           .font(.system(size: 16))
                           .padding(.top, 0)
                       
                       AnimatedCircleView()
                    
                       
                       HStack {
                           Spacer() // Pushes the button to the right
                           
                           Button(action: {
                               self.isButtonPressed = true
                           }) {
                               Image("play.button")
                                   .resizable()
                                   .scaledToFit()
                                   .frame(width: 40, height: 40)
                           }
                           .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0)) // Adjust padding as needed
                       }
                   } else {
                       Spacer()
                       
                       AnimatedCircleView()
                           .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
                       
                       Spacer()
                   }
               }
               .padding() // Add padding to the VStack
           }
           .onAppear {
               Timer.scheduledTimer(withTimeInterval: 4.1, repeats: true) { timer in
                   if !self.isButtonPressed {
                       self.breatheText = (self.breatheText == "Breathe In") ? "Breathe Out" : "Breathe In"
                   }
               }
           }
       }
   }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BreatheIn()
    }
}
