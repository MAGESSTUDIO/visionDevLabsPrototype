//
//  ImmersiveView.swift
//  MagesVision
//
//  Created by Atul Singh on 30/08/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    @State var isDragging = false
    @State var position = CGSize.zero
    
    var scene: Entity = Entity()
    
    var body: some View {
        RealityView { content in
            
            
        
            if let scene = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                content.add(scene)
            
            
            
            }
                //.gesture(dragGesture)
        }
        
        .gesture(DragGesture().targetedToAnyEntity().onChanged { value in
                    print(value.entity.name)
                    value.entity.position = value.convert(value.location3D, from: .local, to: value.entity.parent!)
                    
                })
        
        .gesture(RotateGesture().targetedToAnyEntity().onChanged { value in
            let sourceRotation = value.entity.transform.rotation
            let delta = simd_quatf(angle: Float(value.rotation.radians), axis: [0, 1, 0])
            value.entity.transform.rotation = sourceRotation * delta
        })
        
        
       
        
                 }
        
   
       
    
        
        
       /* .gesture(TapGesture().targetedToAnyEntity().onEnded { value in
            var transform = value.entity.transform
            transform.translation += SIMD3(0.1, 0, -0.1)
            value.entity.move(
                to: transform,
                relativeTo: nil,
                duration: 3,
                timingFunction: .easeInOut
            )
        })*/
        
       /* .gesture(DragGesture().targetedToAnyEntity().onChanged({value in
            position = value.translation
            var transform = value.entity.transform
            value.entity.position = value.convert(value.location3D, from: .local, to: entity.parent!)
        })
                 
            .onEnded({value in
                position = .zero
                isDragging = false
            })
        )*/
        
                 
        
    }


#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
