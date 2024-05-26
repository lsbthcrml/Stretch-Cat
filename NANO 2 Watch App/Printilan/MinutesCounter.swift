//import SwiftUI
//
//struct MinutesCounter: View {
//    @State private var minutes: Int = 2
//    
//    var body: some View {
//        VStack {
//            Text("\(minutes) minute\(minutes == 1 ? "" : "s")")
//                .font(.title)
//            
//            HStack {
//                Button(action: {
//                    if minutes > 0 {
//                        minutes -= 1
//                    }
//                }) {
//                    Image("minus")
//                }
//                
//                Button(action: {
//                    minutes += 1
//                }) {
//                    Image("plus")
//                }
//            }
//        }
//
//    }
//}
//
//
//#Preview {
//    MinutesCounter()
//}

import SwiftUI

struct MinutesCounter: View {
    @State private var minutes: Int = 2
    
    var body: some View {
        HStack {
            Button(action: {
                if minutes > 0 {
                    minutes -= 1
                }
            }) 
            {
                Image("minus")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
            }
            .buttonStyle(PlainButtonStyle()) // Remove default button style
            
            Spacer()
            Text("\(minutes) minute\(minutes == 1 ? "" : "s")")
                .foregroundColor(Color("army"))
                .font(.system(size: 17))
                .padding(.horizontal, 1.0)
        
            Spacer()
            Button(action: {
                minutes += 1
            }) {
                Image("plus")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                
            }
            .buttonStyle(PlainButtonStyle()) // Remove default button style
        }
        .padding()
        .edgesIgnoringSafeArea(.all)
    }
}

struct MinutesCounter_Previews: PreviewProvider {
    static var previews: some View {
        MinutesCounter()
    }
}
