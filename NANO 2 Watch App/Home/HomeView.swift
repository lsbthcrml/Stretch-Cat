import SwiftUI

//struct HomeView: View {
//    var body: some View {
//        ScrollView(.vertical, showsIndicators: false) {
//            LazyVStack(spacing: 0){
//                ContentView()
//                PageDuaView()
//                PageTigaView()
//            }
//        }
//        
//    }
//}
//
//#Preview {
//    HomeView()
//}

//struct HomeView: View {
//    @GestureState private var dragOffset: CGFloat = 0
//    @State private var currentPage: Int = 0
//    
//    var body: some View {
//        ScrollView {
//            VStack(spacing: 0) {
//                ContentView().offset(y: currentPage == 0 ? -dragOffset : 0)
//                PageDuaView().offset(y: currentPage == 1 ? -dragOffset : 0)
//                PageTigaView().offset(y: currentPage == 2 ? -dragOffset : 0)
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .gesture(
//                DragGesture()
//                    .updating($dragOffset) { value, state, _ in
//                        state = value.translation.height
//                    }
//                    .onEnded { value in
//                        let dragThreshold: CGFloat = 50 // Adjust as needed
//                        if value.translation.height > dragThreshold {
//                            withAnimation {
//                                currentPage = max(currentPage - 1, 0)
//                            }
//                        } else if value.translation.height < -dragThreshold {
//                            withAnimation {
//                                currentPage = min(currentPage + 1, 2)
//                            }
//                        }
//                    }
//            )
//        }
//    }
//}
//
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}

struct HomeView: View {
    @GestureState private var dragOffset: CGFloat = 0
    @State private var currentPage: Int = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ContentView().offset(y: currentPage == 0 ? -dragOffset : 0)
                PageDuaView().offset(y: currentPage == 1 ? -dragOffset : 0)
                PageTigaView().offset(y: currentPage == 2 ? -dragOffset : 0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .gesture(
                DragGesture()
                    .updating($dragOffset) { value, state, _ in
                        state = value.translation.height
                    }
                    .onEnded { value in
                        let dragThreshold: CGFloat = 50 // Adjust as needed
                        if value.translation.height > dragThreshold && currentPage > 0 {
                            withAnimation {
                                currentPage -= 1
                            }
                        } else if value.translation.height < -dragThreshold && currentPage < 2 {
                            withAnimation {
                                currentPage += 1
                            }
                        }
                    }
            )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
