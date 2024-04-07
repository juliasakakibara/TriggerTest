import RealityKit
import SwiftUI

struct ARGameView: View {
    
    @State private var help = false
    @State private var showCard = false
    @State var tapped: Bool = false
    //@State private var arView = ARView(frame: .zero)
   // @State private var scene = try! Experience.loadBox()
    
    
    var body: some View {
        
        
        
        NavigationStack {
            ZStack {
                ARViewContainer(tapped: $tapped)
                    .ignoresSafeArea()
                
                VStack {
                    Text("OLÁ")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }
                .alert("Important message", isPresented: $tapped) {
                            Button("OK", role: .cancel) { 
                                tapped.toggle()
                            }
                        }
                
                //vstack text
//                VStack {
//                    if showCard {
//                        CardView().onTapGesture {
//                            withAnimation {
//                                showCard.toggle()
//                            }
//                        }
//                    }
//                }
//                .toolbar {
//                    Button ("+ More info") {
//                        withAnimation {
//                            showCard.toggle()
//                        }
//                        print("help tapped!")
//                    }
                    

                }
            }
        }
    }


struct ARGameView_Previews: PreviewProvider {
    static var previews: some View {
        ARGameView()
    }
}
