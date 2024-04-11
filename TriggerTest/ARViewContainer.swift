//
//  ARViewContainer.swift
//  TriggerTest
//
//  Created by Julia Sakakibara on 28/02/24.
//

import Foundation
import SwiftUI
import RealityKit



/// You can use this class to load an AR experience from a reality file and create anchor entities for it.
class ARExperience: RealityKit.Entity, RealityKit.HasAnchoring {

    
    static func load(named resourceName: String) -> ARExperience {
        if let url = Bundle.main.url(forResource: resourceName, withExtension: "rcproject") {
            let anchor = try! ARExperience.loadAnchor(contentsOf: url)
            return ARExperience(anchor: anchor)
        }
        return ARExperience()
    }
    
    required init() {
        super.init()
    }
    
    required init(anchor: RealityKit.AnchorEntity) {
        super.init()
        self.anchoring = anchor.anchoring
        self.addChild(anchor)
    }
    
}

struct ARViewContainer: UIViewRepresentable {
    
    @Binding var tapped: Bool
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: true)
        
        arView.enableTapGesture()
        arView.environment.lighting.intensityExponent = 1
        
        //let experience = ARExperience.load(named: "WWDCTest")
       // experience.notificat
        let experience = try! WWDCTest.loadJungle()
        
        experience.actions.treeWasTapped.onAction = printer
        
        arView.scene.addAnchor(experience)
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        
    }
    
    func printer(_ entity: Entity?) -> Void {
        print("Hello")
        tapped.toggle()
    }
    
    
}

extension ARView {
    
    func enableTapGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func handleTap(recognizer: UITapGestureRecognizer) {
        let tapLocation = recognizer.location(in: self)
        let hit = self.hitTest(tapLocation, types: [.existingPlaneUsingExtent, .estimatedHorizontalPlane, .estimatedVerticalPlane])
    }
    
    //
    //        
    //        guard let rayResult = self.ray (through: tapLocation) else { return }
    //        
    //        let results = self.scene.raycast(origin: rayResult.origin, direction: rayResult.direction)
    //        
    //        if results.first(where: { $0.entity.name == "TesteArv" }) != nil {
    //            print("gstv")
    //        }
    //        
    //        if let firstResult = results.first {
    //            
    //            var position = firstResult.position
    //            // print("position: \(position)")
    //            
    //            position.y = 0.3/2
    //            
    //            
    //        } else {
    //            let results = self.raycast(from: tapLocation, allowing: .estimatedPlane, alignment: .any)
    //            
    //            
    //            if let firstResult = results.first {
    //                
    //                let position = simd_make_float3(firstResult.worldTransform.columns.3)
    //                //placeTree(at: position)
    //                print("gstv")
    //                
    //            }
    //        }
    //        
    ////        #Preview {
    ////            ARViewContent()
    ////        }
    ////        
    //        
    ////        func placeTree(at position: SIMD3<Float>) {
    ////            print(#function)
    ////            
    ////            let experience = ARExperience.load(named: "WWDCTest")
    ////            self.scene.addAnchor(experience)
    ////            let mesh = MeshResource.generateBox(size: 0.3)
    ////            let material = SimpleMaterial(color: .white, roughness: 0.3, isMetallic: true)
    ////            let modelEntity = ModelEntity(mesh: mesh, materials: [material])
    ////            modelEntity.generateCollisionShapes(recursive: true)
    ////            
    ////            let anchorEntity = AnchorEntity(world: position)
    ////            anchorEntity.addChild(modelEntity)
    ////            //  let experience = ARExperience.load(named: "TesteArv")
    ////            
    ////            self.scene.addAnchor(anchorEntity)
    ////        }
    //    }
    //}
}

