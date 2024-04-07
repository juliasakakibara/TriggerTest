//
//  CardView.swift
//  TriggerTest
//
//  Created by Julia Sakakibara on 28/02/24.
//

import SwiftUI
import Foundation
import RealityKit

struct CardView: View {
    
    var body: some View {
        
        HStack{

            VStack {

                Spacer ()
                Text("THE SPIRIT OF THE FOREST")
                Text("Saci-pererê")
                VStack{
                    Text ("His story dates back centuries, blending indigenous Brazilian myths with the folklore brought over by African enslaved peoples. However he came to be, Saci-Pererê embodies the resilience and creativity of Brazil's diverse cultural heritage. His tales have been passed down through generations, evolving with each telling to reflect the ever-changing landscape of Brazilian society. So next time you're wandering through the woods, keep an eye out for that mischievous grin and that iconic red cap – you just might catch a glimpse of Saci-Pererê himself!")
                }
                .padding (.horizontal, 40)
                .padding (.bottom, 40)
                .padding ()
            }
            
        }
            .padding()
            .background(
                Color.init(.sRGB, white: 1.0, opacity: 1.0)
            )
            .cornerRadius(8)
            .padding()

    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}




